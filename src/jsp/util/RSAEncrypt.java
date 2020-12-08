package jsp.util;

import com.google.gson.Gson;

import javax.crypto.Cipher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.security.*;
import java.security.spec.RSAPublicKeySpec;

public class RSAEncrypt {
    /**
     * 복호화
     *
     * @param privateKey
     * @param securedValue
     * @return
     * @throws Exception
     */
    public String decryptRsa(PrivateKey privateKey, String securedValue) throws Exception {
        System.out.println("decryptRsa privateKey : " + privateKey);
        System.out.println("decryptRsa securedValue : " + securedValue);
        Cipher cipher = Cipher.getInstance("RSA");
        byte[] encryptedBytes = hexToByteArray(securedValue);
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
        String decryptedValue = new String(decryptedBytes, "utf-8"); // 문자 인코딩 주의.
        return decryptedValue;
    }

    /**
     * 16진 문자열을 byte 배열로 변환한다.
     *
     * @param hex
     * @return
     */
    public static byte[] hexToByteArray(String hex) {
        if (hex == null || hex.length() % 2 != 0) { return new byte[] {}; }

        byte[] bytes = new byte[hex.length() / 2];
        for (int i = 0; i < hex.length(); i += 2) {
            byte value = (byte) Integer.parseInt(hex.substring(i, i + 2), 16);
            bytes[(int) Math.floor(i / 2)] = value;
        }
        return bytes;
    }

    /**
     * rsa 공개키, 개인키 생성
     *
     * @param request
     */
    public String initRsa(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String rsaKeyJson = "";

        KeyPairGenerator generator;
        try {
            generator = KeyPairGenerator.getInstance("RSA");
            generator.initialize(1024);

            KeyPair keyPair = generator.genKeyPair();
            KeyFactory keyFactory = KeyFactory.getInstance("RSA");
            PublicKey publicKey = keyPair.getPublic();
            PrivateKey privateKey = keyPair.getPrivate();

            System.out.println("InitRSA privateKey : " + privateKey);
            System.out.println("InitRSA publicKey : "  + publicKey);
            session.setAttribute("_RSA_WEB_Key_", privateKey); // session에 RSA 개인키를 세션에 저장

            RSAKey key = new RSAKey();
            RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
            String publicKeyModulus = publicSpec.getModulus().toString(16);
            String publicKeyExponent = publicSpec.getPublicExponent().toString(16);
            key.setRSAExponent(publicKeyExponent);
            key.setRSAModulus(publicKeyModulus);
            System.out.println("InitRSA RSAModulus : " + publicKeyModulus);
            System.out.println("InitRSA RSAExponent : " + publicKeyExponent);


            Gson gson = new Gson();
            rsaKeyJson = gson.toJson(key);

//            request.setAttribute("RSAModulus", publicKeyModulus); // rsa modulus 를 request 에 추가
//            request.setAttribute("RSAExponent", publicKeyExponent); // rsa exponent 를 request 에 추가
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return rsaKeyJson;
    }
}


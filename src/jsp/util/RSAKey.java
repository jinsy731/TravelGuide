package jsp.util;

public class RSAKey {
    private String RSAModulus;
    private String RSAExponent;

    public void setRSAExponent(String RSAExponent) {
        this.RSAExponent = RSAExponent;
    }

    public void setRSAModulus(String RSAModulus) {
        this.RSAModulus = RSAModulus;
    }

    public String getRSAExponent() {
        return RSAExponent;
    }

    public String getRSAModulus() {
        return RSAModulus;
    }
}

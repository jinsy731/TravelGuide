$(function () {

    $()

    // LoginSubmit Event Handler
    $("#loginSubmit").on("click", async function (event) {
        event.preventDefault();

        var id = $("#formId");
        var pw = $("#formPw");

        if (id.val() == '' || pw.val() == '') {
            alert("아이디와 비밀번호를 입력해주세요.");
            return false;
        }

        var rsa = new RSAKey();

        await $.get({
            url : "MemberInitRsaAction.do",
            dataType: "text",

            success : function(key) {
                console.log(key);
                key = $.parseJSON(key);
                console.log(key.RSAModulus, key.RSAExponent);
                rsa.setPublic(key.RSAModulus,key.RSAExponent);
            }
        });
        // rsa 암호화

        $("#USER_ID").val(rsa.encrypt(id.val()));
        $("#USER_PW").val(rsa.encrypt(pw.val()));

        id.val("");
        pw.val("");

        var form_data = {
            USER_ID: $("#USER_ID").val(),
            USER_PW: $("#USER_PW").val()
        };


        $.ajax({
            url: "MemberLoginAction.do",
            type: "POST",
            data: form_data,
            dataType : "text",
            success: function (data) {
                if(data.trim() == 'success') {
                    location.reload();
                }
                else if(data.trim() == 'wrong_id') {
                    alert("존재하지 않는 아이디입니다.");
                }
                else if(data.trim() == 'wrong_pw') {
                    alert("비밀번호가 다릅니다.");
                }
            },
            error: function () {
                alert("error");
            }
        });
    });  // loginSubmit Event Handler end

    $('#joinSubmit').click( function() {
        location.href = "JoinForm.do";

    });


}); // document.ready end
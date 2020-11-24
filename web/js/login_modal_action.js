$(function () {

    // LoginSubmit Event Handler
    $("#loginSubmit").on("click", function (event) {
        event.preventDefault();

        if($("#defaultLoginFormEmail").val() == '' || $("#defaultLoginFormPassword").val() == '') { alert("아이디와 비밀번호를 입력해주세요."); return false;}
        var form_data = {
            id: $("#defaultLoginFormEmail").val(),
            pw: $("#defaultLoginFormPassword").val()
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
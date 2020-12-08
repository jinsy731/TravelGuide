function formCheck() {
    var $input = $('#content').find('input');
    var check = true;
    $input.each( function () {
        console.log($(this).val());
        if($(this).val() == '')
            check = false;
    })

    return check;
}


async function joinSubmit(event) {
    var check = await formCheck();
    var rsa = new RSAKey();

    if (check !== true) {
        alert("정보를 모두 입력해주세요");
        event.preventDefault();
    } else {
        console.log("init start");
        $.get({
            url : "MemberInitRsaAction.do",
            async : false,
            dataType : "text",

            success : function(key) {
                key = $.parseJSON(key);
                rsa.setPublic(key.RSAModulus,key.RSAExponent);
            }
        });
        console.log("init end");


        var id = $("#joinId");
        var pw = $("#joinPw");

        $("#JOIN_USER_ID").val(rsa.encrypt(id.val()));
        $("#JOIN_USER_PW").val(rsa.encrypt(pw.val()));

        id.val("");
        pw.val("");

        console.log("setting end");

        return true;
    }
}
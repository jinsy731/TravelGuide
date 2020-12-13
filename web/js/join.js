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

function idDupCheck() {
    var id = $('#joinId').val();
    if(id === '') {
        alert("아이디를 입력해주세요");
        return false;
    }
    var data = {
        id : $('#joinId').val()
    }

    $.ajax({
        url : "IDdupCheck.do",
        type: "post",
        data : data,

        success : function(result){
            var result = $.trim(result);
            if (result === 'false') {
                alert("중복된 ID 입니다");
                return false;
            } else {
                alert("사용할 수 있는 ID 입니다.");
            }
        }
    })
}


async function joinSubmit(event) {
    var check = await formCheck();
    // var rsa = new RSAKey();

    if (check !== true) {
        alert("정보를 모두 입력해주세요");
        event.preventDefault();
    } else {
        // $.get({
        //     url : "MemberInitRsaAction.do",
        //     async : false,
        //     dataType : "text",
        //
        //     success : function(key) {
        //         key = $.parseJSON(key);
        //         rsa.setPublic(key.RSAModulus,key.RSAExponent);
        //     }
        // });


        var id = $("#joinId");
        var pw = $("#joinPw");

        // $("#JOIN_USER_ID").val(rsa.encrypt(id.val()));
        // $("#JOIN_USER_PW").val(rsa.encrypt(pw.val()));

        $('#JOIN_USER_ID').val(id.val());
        $('#JOIN_USER_PW').val(SHA256(pw.val()));

        id.val("");
        pw.val("");

        return true;
    }
}
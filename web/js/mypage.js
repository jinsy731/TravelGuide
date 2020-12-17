$(function() {

    $('#mypage a').click(function(event) { event.preventDefault();});

    $('#viewInfo').click(function(event) {
        console.log("viewInfo click");
        event.preventDefault();
        $.ajax({
            url : 'MemberShowInfoAction.do',
            type : 'get',
            dataType : 'text',

            success : function(html) {
                $('#mypageContent').html(html);
            },
            error : function(err) {
                console.log(err);
            }
        })
    }); // viewInfo Click

    $('#viewInfo').click();


    $('#secession').click(function () {
        var html =
            `
            <form action="MemberSecessionAction.do" method="post" onsubmit="secessionCheck(event)">
                <span>비밀번호 입력</span>
                <input type="password" id="passwordInput" class="form-control-sm" placeholder="비밀번호">
                <input type="hidden" id="secessionPW" name="pw" value="default">
                <button class="btn-sm btn-secondary" id="secessionBtn">탈퇴</button>
            </form>
             `;

        $('#mypageContent').html(html);
    }); // secession click


    $('#changePassword').click(function() {
        var html =
            `
            <form action="MemberChangePasswordAction.do" method="post" id="changePwForm" onsubmit="changePasswordCheck(event)">
                <div class="form-group">
                    <span style="margin-right : 52px">비밀번호 입력</span>
                    <input type="password" id="passwordInput" class="form-control-sm" placeholder="비밀번호 확인">
                    <input type="hidden" id="originPW" name="pw" value="default">

                </div>
                <div class="form-group">
                    <span>변경할 비밀번호 입력</span>
                    <input type="password" id="new_passwordInput" class="form-control-sm" placeholder="변경할 비밀번호">
                    <input type="hidden" id="newPW" name="new_pw" value="default">
                </div>
                <button type="submit" class="btn-sm btn-secondary" id="changePasswordBtn">변경</button>
            </form>
            `;
        $('#mypageContent').html(html);
    });

    $('#reservedList').click(function() {
        $.get({
            url : "ReserveShowReservedList.rsrv",
            dataType : "text",
            success : function(result) {
                var html = $.trim(result);
                $('#mypageContent').html(html);
            }
        })
    });




}); // document readt end

async function secessionCheck(event) {
    var check = await formCheck();
    if (check !== true) {
        alert("정보를 모두 입력해주세요");
        event.preventDefault();
    } else {
        var result = confirm("탈퇴하시겠습니까?");
        if(!result) {
            event.preventDefault();
        }
        else {
            $('#secessionPW').val(SHA256($('#passwordInput').val()));
            $('#passwordInput').val("");
        }
    }

}


function formCheck() {
    console.log("formCheck function");
    var $input = $('#mypageContent').find("input");
    var check = true;

    $input.each(function() {
        if ($(this).val() == "") {
            check = false;
        }
    });

    return check;
}


async function changePasswordCheck(event) {
    var check = await formCheck();
    if (check !== true) {
        alert("정보를 모두 입력해주세요");
        event.preventDefault();
    } else {
        console.log("confirm check function");
        var result = confirm("비밀번호를 변경하시겠습니까?");
        if(!result) {
            event.preventDefault();
        }
        else {
            $('#originPW').val(SHA256($('#passwordInput').val()));
            $('#newPW').val(SHA256($('#new_passwordInput').val()));

            $('#passwordInput').val("");
            $('#new_passwordInput').val("");
            console.log($('#originPW').val());
        }
    }
}

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



// $('#viewBid').click(function() {
//     var html =
//         `
//         <div class="row mt-5 mb-5"  id="itemContainer">
//
//         </div>
//
//         `;
//     $('#mypageContent').html(html);
//
//     $.ajax({
//         url : '/users/viewBid',
//         type : 'get',
//         dataType: 'json',
//
//         success : function(list) {
//             for(var i in list) {
//                 var item_html =
//                     `
//                     <div class="col-lg-3 col-md-4 col-sm-6 bid-item">
//                         <a href="/bid/item/${list[i].item_no}">
//                             <img class="img-thumbnail rounded mypage-bid-img" src="\${list[i].item_image_src}" style="width : 130px; height : 130px; object-fit: cover">
//                         </a>
//                         <p class="mt-3 text-center">\${list[i].item_name}</p>
//                         <p><span class="bid-item-sub">시작가  </span>\${list[i].item_start_price}</p>
//                         <p><span class="bid-item-sub">최고가  </span>${list[i].item_max_price}</p>
//                         <p><span class="bid-item-sub">현재 입찰가  </span>${list[i].item_current_price}</p>
//                     </div>
//                     `;
//
//                 $('#itemContainer').append(item_html);
//
//             }
//         }
//     });
// });// viewBid end
//
//
// $('#viewMyProduct').click(function() {
//     var html =
//         `
//         <div class="row mt-5 mb-5"  id="itemContainer">
//
//         </div>
//
//         `;
//     $('#mypageContent').html(html);
//
//     $.ajax({
//         url : '/users/viewMyProduct',
//         type : 'get',
//         dataType: 'json',
//
//         success : function(list) {
//             for(var i in list) {
//                 var item_html =
//                     `
//                     <div class="col-lg-3 col-md-4 col-sm-6 bid-item">
//                         <a href="/bid/item/${list[i].item_no}">
//                             <img class="img-thumbnail rounded mypage-bid-img" src="${list[i].item_image_src}" style="width : 130px; height : 130px; object-fit: cover">
//                         </a>
//                         <p class="mt-3 text-center">${list[i].item_name}</p>
//                         <p><span class="bid-item-sub">시작가  </span>${list[i].item_start_price}</p>
//                         <p><span class="bid-item-sub">최고가  </span>${list[i].item_max_price}</p>
//                         <p><span class="bid-item-sub">현재 입찰가  </span>${list[i].item_current_price}</p>
//                     </div>
//                     `;
//
//                 $('#itemContainer').append(item_html);
//
//             }
//         }
//     });
//
// }); // viewMyProduct end

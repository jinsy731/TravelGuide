
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../source.jsp" />
    </head>

    <body>

        <script>
            var serviceKey = "sR2lezz4nf3nZ9ByB3WOztV0O3VU%2F5iEqHAsbAurxZRabUK4qmfX1HB5Q%2B6nchR2RDhnzEnY%2BBwg59ntZKf%2BkQ%3D%3D";

            var urlStr = "http://api.data.go.kr/openapi/tn_pubr_public_trrsrt_api?";
            urlStr += "ServiceKey=" + serviceKey;
            urlStr += "&pageNo=1";
            urlStr += "&type=json";
            urlStr += "numOfRows=581";

            $.ajax({
                url: urlStr
                , type: 'get'
                , dataType : 'json'
                , success: function (msg) {

                    var text = msg.responseText,
                        text = text.replace(/(<([^>]+)>)/ig, ""); //HTML 태그 모두 공백으로 대체
                    text = '[' + text + ']';
                    var json = $.parseJSON(text);

                    var test1 = json[0].response.body.items.item[1];
                    var test2 = json[0].response.body.items.item[3];
                    var test3 = json[0].response.body.items.item[4];
                    var test4 = json[0].response.body.items.item[5];

                    console.log(test1, test2, test3, test4);
                }
            });
        </script>

    </body>
</html>




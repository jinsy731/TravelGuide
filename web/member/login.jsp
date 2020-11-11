<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    <script>
        $(window).ready(
            ()=> {
                $("#BTN_SIGNUP").on("click", function(event) {
                    event.preventDefault();
                    location.href = ".html";
                });
            });
    </script>

</head>
<body>
<div align="center" >
    Login Form
    <hr>
    <form action="MemberLoginAction.do" method="post">
        <div class="container">
            <div class="form-group row">
                <label for="id" class="col-sm-1">ID</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="id" placeholder="id**" name="id">
                </div>
            </div>
            <div class="form-group row">
                <label for="pw" class="col-sm-1">Password</label>
                <div class="col-sm-4">
                    <input type="password" class="form-control" id="pw" name="pw">
                </div>
            </div>
            <div class="row">
                <div class="col-sm-5 offset-sm-2">
                    <button type="submit" class="btn btn-primary" name="btn" value="BTN_LOGIN">Submit</button>
                    <button type="submit" class="btn btn-secondary" id="BTN_SIGNUP">SIGNUP</button>
                </div>

            </div>
        </div>


    </form>

</div>

</body>
</html>

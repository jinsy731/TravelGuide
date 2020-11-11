<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>

</head>
<body>
<div align="center" >
    Signup Form
    <hr>
    <form action="MemberModifyAction.do" method="post">
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
            <div class="form-group row">
                <label for="email" class="col-sm-1">email</label>
                <div class="col-sm-4">
                    <input type="email" class="form-control" id="email" name="email">
                </div>
            </div>
            <div class="form-group row">
                <label for="name" class="col-sm-1">Name</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="name" name="name">
                </div>
            </div>
            <div class="form-group row">
                <label for="name" class="col-sm-1">Address</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="addr" name="addr">
                </div>
            </div>
            <div class="form-group row">
                <label for="name" class="col-sm-1">Phone</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="phone" name="phone">
                </div>
            </div>
            <div class="form-group row">
                <label for="name" class="col-sm-1">Gender</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="gender" name="gender">
                </div>
            </div>
            <div class="form-group row">
                <label for="name" class="col-sm-1">Birth</label>
                <div class="col-sm-1">
                    <input type="text" class="form-control" id="date_yy" name="date_yy">
                </div>
                <div class="col-sm-1">
                    <input type="text" class="form-control" id="date_mm" name="date_mm">
                </div>
                <div class="col-sm-1">
                    <input type="text" class="form-control" id="date_dd" name="date_dd">
                </div>
            </div>
            <div class="form-group row">
                <label for="name" class="col-sm-1">Hint</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="hint" name="hint">
                </div>
            </div>
            <div class="row">
                <div class="col-sm-5 offset-sm-2">
                    <button type="submit" class="btn btn-secondary" name="btn" value="BTN_MODIFY">Modify</button>
                </div>

            </div>
        </div>


    </form>


</div>


</body>
</html>
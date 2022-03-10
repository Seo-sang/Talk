<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="${path}/"><b>Admin</b>LTE</a>
    </div> <!-- /.login-logo -->
    <div class="card">
        <div class="card-body login-card-body">
            <p class="login-box-msg">Sign in to start your session</p>
            <form action="${path}/user/loginPost" method="post">
                <div class="input-group mb-3">
                    <input type="text" name="userId" class="form-control" placeholder="아아디">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-exclamation"></span>
                        </div>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <input type="password" name="userPw" class="form-control" placeholder="비밀번호">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-lock"></span>
                        </div>
                    </div>
                </div>
                <div class="col-4">
                    <button type="submit" class="btn btn-primary btn-block">Sign In</button>
                </div> <!-- /.col -->
            </form>
            <p class="mb-1">
                <a href="#">I forgot my password</a>
            </p>
            <p class="mb-0">
                <a href="${path}/user/register" class="text-center">Register a new membership</a>
            </p>
        </div> <!-- /.login-card-body -->
    </div> <!-- /.login-box-body -->
</div> <!-- /.login-box -->
</body>
</html>
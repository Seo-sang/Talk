<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp"%>
<body class="hold-transition register-page">
    <div class="register-box">
        <div class="register-logo">
            <a href="${path}">
                <b>DoubleS</b>&nbsp MVC-BOARD
            </a>
        </div>

        <div class="register-box-body">
            <p class="login-box-msg">회원가입 페이지</p>

            <form action="${path}/user/register" method="post">
                <div class="form-group has-feedback">
                    <input type="text" name = "email" class="form-control" placeholder="이메일">
                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="text" name = "nickname" class="form-control" placeholder="닉네임">
                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="text" name = "statusmsg" class="form-control" placeholder="상태메세지">
                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
                </div>
                <div class="row">
                    <div class="col-xs-8">
                        <div class="checkbox icheck">
                            <label>
                                <input type="checkbox">약관에 <a href="#">동의</a>
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-4">
                        <button type="submit" class="btn btn-primary btn-block btn-flat">가입</button>
                    </div>
                </div>
            </form>

            <div class="social-auth-links text-center">
                <p>또는</p>
                <a href="#" class="btn btn-block btn-social btn-facebook btn-flat">
                    <i class="fa fa-facebook"></i> 페이스북으로 가입
                </a>
                <a href="#" class="btn btn-block btn-social btn-google btn-flat">
                    <i class="fa fa-google-plus"></i> 구글 계정으로 가입
                </a>
            </div>

            <a href="${path}/user/login" class="text-center">로그인</a>
        </div>
    </div>

    <%@ include file="../include/plugin_js.jsp" %>
    <script>
        $(function() {
            $('input').iCheck {
                checkboxClass: 'icheckbox_square-blue',
                    radioClass: 'iradio_square-blue',
                    increaseArea: '20%' //optional
            });
        });
    </script>
</body>
</html>
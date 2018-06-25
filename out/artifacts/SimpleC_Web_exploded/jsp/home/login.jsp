<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <title>登录</title>
    <script src="${APP_PATH}/js/jquery-3.1.1.js"></script>

    <link href="${APP_PATH}/amazeui-3.0.0-alpha.beta/AmazeUIdemo/assets/css/amazeui.min.css" rel="stylesheet"
          type="text/css">
    <script src="${APP_PATH}/amazeui-3.0.0-alpha.beta/AmazeUIdemo/assets/js/amazeui.min.js"
            type="text/javascript"></script>

    <%--<link href="${APP_PATH}/AmazeUI-2.4.2/assets/css/amazeui.min.css" rel="stylesheet"/>--%>
    <%--<script src="${APP_PATH}/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>--%>

    <link rel="stylesheet" type="text/css" href="${APP_PATH}/css/dlstyle.css"/>
    <link href="${APP_PATH}/css/jquery.toast.min.css" rel="stylesheet">
    <script type="text/javascript" src="${APP_PATH}/js/jquery.toast.min.js"></script>
</head>

<body>
<div class="login-boxtitle" style="height: 100px">
    <a href="${APP_PATH}/toHome"><img alt="logo" src="${APP_PATH}/static/picture/logoPro.png"
                                      style="height: 100px"/></a>
</div>
<div class="login-banner" style="background: url(${APP_PATH}/static/picture/login.jpg) center fixed;height: 700px">
    <div class="login-main" style="padding-top: 80px;padding-left: 1300px">
        <div class="login-box" style="height: 350px;opacity: 50%;background-color:rgba(255,255,255,0.4)">
            <h3 class="title">登录商城</h3>
            <div class="clear"></div>
            <div class="login-form">

                <form id="LoginForm" action="${APP_PATH}/doLogin" method="post">
                    <div class="user-name">
                        <label><i class="am-icon-user" style="padding-top: 13px"></i></label>
                        <input type="text" id="userlogin" name="userlogin" placeholder="请输入邮箱/昵称"
                               minlength="3" required>
                    </div>
                    <div class="user-pass">
                        <label><i class="am-icon-lock" style="padding-top: 13px"></i></label>
                        <input type="password" id="userpassword" name="userpassword" placeholder="请输入密码" required/>
                    </div>
                </form>

            </div>

            <%--<label for="remember-me">--%>
            <%--<input id="remember-me" type="checkbox">记住密码--%>
            <%--</label>--%>
            <label class="am-checkbox needsclick">
                <input type="checkbox" checked="checked" value="" data-am-ucheck checked> 记住我
            </label>
            <label class="am-checkbox needsclick">
                <input type="checkbox" value="" data-am-ucheck> 记住密码
            </label>
            <a href="${APP_PATH}/toRegister" class="zcnext am-fr am-btn-default">注册</a>


            <div class="am-cf">
                <input onclick="" type="submit" id="LoginBtn" value="登 录"
                       class="am-btn am-btn-primary am-btn-sm">
            </div>
            <div class="am-cf">
                <label style="color: red">${requestScope.result}</label>
                <label style="color: green">${requestScope.success}</label>
                <label style="color: red">
                    <%
                        String msg = (String) request.getAttribute("message");
                        if (msg != null) {
                            out.print(msg);
                        }
                    %>
                </label>
            </div>
        </div>
    </div>
</div>
<div class="footer ">
    <div class="footer-hd ">
        <p><a href="#">心潮工作室</a> <b>|</b> <a href="${APP_PATH}/toHome">商城首页</a> <b>|</b> <a href="# ">支付宝</a> <b>|</b>
            <a
                    href="#">物流</a></p>
    </div>
    <div class="footer-bd ">
        <p><a href="# ">关于心潮</a> <a href="# ">合作伙伴</a> <a href="# ">联系我们</a> <a href="# ">网站地图</a> <em>© 2018-2038
            SimpleChange.com 版权所有.</em></p>
    </div>
</div>
</body>


<script>
    $("#LoginBtn").click(function () {

        var userlogin = $('#userlogin').val();
        var userpassword = $('#userpassword').val();
        console.log(userlogin);
        console.log(userpassword);

        $.ajax({
            url: "${APP_PATH}/validateLogin",
            type: "POST",
            data: {
                "userlogin": userlogin,
                "userpassword": userpassword
            },
            success: function (result) {
                if (result.code == 100) {
                    $("#LoginForm").submit();
                } else {
                    $('#userlogin').removeClass('am-field-valid');
                    $('#userpassword').removeClass('am-field-valid');
                    $('#userlogin').addClass('am-field-error');
                    $('#userpassword').addClass('am-field-error');
                    $.toast({
                        heading: "Fail",
                        text: result.extend.msg,
                        showHideTransition: 'fade',
                        position: 'top-right',
                        icon: 'error'
                    })
                }
            }
        });

    });

    $(function () {
        $('#LoginForm').validator();
    });
</script>

</html>
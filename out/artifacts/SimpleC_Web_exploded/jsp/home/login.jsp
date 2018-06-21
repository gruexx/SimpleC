<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
//        response.setContentType("text/html; charset=utf-8");
    %>
    <title>登录</title>
    <link rel="stylesheet" href="${APP_PATH}/AmazeUI-2.4.2/assets/css/amazeui.css"/>
    <link rel="stylesheet" type="text/css"  href="${APP_PATH}/css/dlstyle.css"/>
    <script src="${APP_PATH}/js/jquery-3.1.1.js"></script>
</head>

<body>
<div class="login-boxtitle" style="height: 100px">
    <a href="${APP_PATH}/toHome"><img alt="logo" src="${APP_PATH}/static/picture/logoPro.png"
                                      style="height: 100px"/></a>
</div>
<div class="login-banner" style="background: url(../../static/picture/login.jpg) center fixed;height: 700px">
    <div class="login-main" style="padding-top: 80px;padding-left: 1300px">
        <div class="login-box" style="height: 350px;opacity: 50%;background-color:rgba(255,255,255,0.4)">
            <h3 class="title">登录商城</h3>
            <div class="clear"></div>
            <div class="login-form">
                <form id="LoginForm" action="${APP_PATH}/doLogin" method="post">
                    <div class="user-name">
                        <label><i class="am-icon-user" style="padding-top: 13px"></i></label>
                        <input type="text" name="userlogin" placeholder="请输入邮箱/昵称"></div>
                    <div class="user-pass">
                        <label><i class="am-icon-lock" style="padding-top: 13px"></i></label>
                        <input type="password" name="userpassword" placeholder="请输入密码"></div>
                </form>
            </div>
            <div class="login-links">
                <label for="remember-me">
                    <input id="remember-me" type="checkbox">记住密码</label> <a href="#" class="am-fr">忘记密码</a> <a
                    href="${APP_PATH}/toRegister"
                    class="zcnext am-fr am-btn-default">注册</a>
                <br/></div>
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
        $("#LoginForm").submit();
    })

    // function Login() {
    //     document.getElementById("LoginForm").submit();
    // }
</script>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <title>注册</title>
    <link rel="stylesheet" href="${APP_PATH}/AmazeUI-2.4.2/assets/css/amazeui.min.css"/>
    <link href="${APP_PATH}/css/dlstyle.css" rel="stylesheet" type="text/css">
    <script src="${APP_PATH}/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="${APP_PATH}/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
</head>

<body>
<div class="login-boxtitle" style="height: 100px">
    <a href="${APP_PATH}/toLogin"><img alt="logo" src="${APP_PATH}/static/picture/logoPro.png" style="height: 100px"/></a>
</div>
<div class="res-banner">
    <div class="res-main">
        <div class="login-banner-bg"><span></span><img src="${APP_PATH}/images/big.jpg"/></div>
        <div class="login-box">
            <div class="am-tabs" id="doc-my-tabs">
                <ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
                    <li style="padding-left: 13px;padding-top: 20px;font-size: 20px">邮箱注册</li>
                </ul>
                <div class="am-tabs-bd">
                    <div class="am-tab-panel am-active">
                        <form action="${APP_PATH}/doRegister" method="post">
                            <div class="user-email">
                                <label><i class="am-icon-user" style="padding-top: 13px"></i></label>
                                <input type="text" name="username" placeholder="请输入昵称"></div>
                            <div class="user-email">
                                <label><i class="am-icon-envelope-o" style="padding-top: 13px"></i></label>
                                <input type="email" name="useremail" placeholder="请输入邮箱账号"></div>
                            <div class="user-pass">
                                <label><i class="am-icon-lock" style="padding-top: 13px"></i></label>
                                <input type="password" name="userpassword" placeholder="设置密码"></div>
                            <div class="user-pass">
                                <label><i class="am-icon-lock" style="padding-top: 13px"></i></label>
                                <input type="password" name="" placeholder="确认密码"></div>
                            <div class="am-cf">
                                <input type="submit" id="EmailReg" value="注册" class="am-btn am-btn-primary am-btn-sm am-fl">
                            </div>
                        </form>
                        <div class="login-links"></div>
                        <div class="am-cf"></div>
                    </div>
                    <div class="login-links"></div>
                    <div class="am-cf"></div>
                    <hr>
                </div>
                <script>
                    $(function () {
                        $('#doc-my-tabs').tabs();
                    })
                </script>
            </div>
        </div>
    </div>
</div>
<div class="footer ">
    <div class="footer-hd ">
        <p><a href="#">心潮工作室</a> <b>|</b> <a href="${APP_PATH}/toHome">商城首页</a> <b>|</b> <a href="# ">支付宝</a> <b>|</b> <a
                href="#">物流</a></p>
    </div>
    <div class="footer-bd ">
        <p><a href="#">关于心潮</a> <a href="# ">合作伙伴</a> <a href="# ">联系我们</a> <a href="# ">网站地图</a> <em>© 2018-2038
            SimpleChange.com 版权所有.</em></p>
    </div>
</div>
</body>

</html>

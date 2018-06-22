<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <title>注册</title>
    <script src="${APP_PATH}/js/jquery-3.1.1.min.js"></script>
    <link href="${APP_PATH}/css/dlstyle.css" rel="stylesheet" type="text/css">
    <link href="${APP_PATH}/AmazeUI-2.4.2/assets/css/amazeui.min.css" rel="stylesheet"/>
    <script src="${APP_PATH}/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
</head>

<body>
<div class="login-boxtitle" style="height: 100px">
    <a href="${APP_PATH}/toLogin"><img alt="logo" src="${APP_PATH}/static/picture/logoPro.png"
                                       style="height: 100px"/></a>
</div>
<div class="res-banner" style="height: 700px;background-color: white">
    <div class="res-main">
        <div class="login-banner-bg" style="background: fixed">
            <img src="${APP_PATH}/static/picture/register.jpg"/>
        </div>
        <div class="login-box" style="background-color: white">

                <ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
                    <li style="padding-left: 13px;padding-top: 20px;font-size: 20px">邮箱注册</li>
                </ul>

                <div class="am-tab-panel am-active">
                    <form action="${APP_PATH}/doRegister" method="post" class="am-form" id="doc-vld-msg">
                        <div class="am-form-group">

                            <input type="text" name="username"
                                   minlength="3" placeholder="输入用户名（至少 3 个字符）" required></div>
                        <div class="am-form-group">

                            <input type="email" name="useremail" data-validation-message="输入地球上的电子邮箱撒"
                                   placeholder="输入邮箱" required></div>
                        <div class="am-form-group">

                            <input type="password" name="userpassword" placeholder="设置密码"></div>
                        <div class="am-form-group">

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

                <script>
                    $(function () {
                        $('#doc-my-tabs').tabs();
                    })
                </script>
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
        <p><a href="#">关于心潮</a> <a href="# ">合作伙伴</a> <a href="# ">联系我们</a> <a href="# ">网站地图</a> <em>© 2018-2038
            SimpleChange.com 版权所有.</em></p>
    </div>
</div>
</body>

</html>
<script>
    /**
     * 注册表单校验
     */
    $(function() {
        $('#doc-vld-msg').validator({
            onValid: function(validity) {
                $(validity.field).closest('.am-form-group').find('.am-alert').hide();
            },

            onInValid: function(validity) {
                var $field = $(validity.field);
                var $group = $field.closest('.am-form-group');
                var $alert = $group.find('.am-alert');
                // 使用自定义的提示信息 或 插件内置的提示信息
                var msg = $field.data('validationMessage') || this.getValidationMessage(validity);

                if (!$alert.length) {
                    $alert = $('<div class="am-alert am-alert-danger"></div>').hide().
                    appendTo($group);
                }

                $alert.html(msg).show();
            }
        });
    });
</script>
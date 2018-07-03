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

    <script src="${APP_PATH}/jigsaw/jigsaw.js"></script>
    <link rel="stylesheet" href="${APP_PATH}/jigsaw/jigsaw.css">
    <style>
        .container {
            width: 310px;
        }

        #msg {
            width: 100%;
            line-height: 40px;
            font-size: 14px;
            text-align: center;
        }

    </style>
</head>

<body>
<div class="login-boxtitle" style="height: 100px">
    <a href="${APP_PATH}/toHome"><img alt="logo" src="${APP_PATH}/static/picture/logoPro.png"
                                      style="height: 100px"/></a>
</div>
<div class="login-banner" style="background: url(${APP_PATH}/static/picture/login.jpg) center fixed;height: 700px">
    <div class="login-main" style="padding-top: 80px;padding-left: 1300px">
        <div class="login-box" style="height: 600px;opacity: 50%;background-color:rgba(255,255,255,0.4)">
            <h3 class="title">登录商城</h3>
            <div class="clear"></div>
            <div class="login-form" data-am-scrollspy="{animation: 'fade'}">

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

            <div class="container" >
                <div id="captcha" style="position: relative;"></div>
                <div id="msg"></div>
            </div>
            <script>
                // $(function () {
                //     $("#captcha canvas").css("display","none");
                //     $(document).on('mouseenter', '.sliderContainer',
                //         function () {
                //             console.log("aaaaa");
                //             // $(this).stop();
                //             $("#captcha canvas").fadeIn(1000);
                //         });
                // });

                jigsaw.init(document.getElementById('captcha'), function () {
                    document.getElementById('msg').innerHTML = '验证成功！';
                    $('#LoginBtn').removeAttr("disabled");
                })
            </script>

            <%--<label for="remember-me">--%>
            <%--<input id="remember-me" type="checkbox">记住密码--%>
            <%--</label>--%>
            <label class="am-checkbox needsclick">
                <input type="checkbox" id="rememberMe" data-am-ucheck checked> 记住我
            </label>
            <label class="am-checkbox needsclick">
                <input type="checkbox" id="rememberPassword" data-am-ucheck> 记住密码
            </label>
            <a href="${APP_PATH}/toRegister" class="zcnext am-fr am-btn-default">注册</a>


            <div class="am-cf" data-am-scrollspy="{animation: 'slide-top'}">
                <input onclick="" type="submit" id="LoginBtn" value="登 录" disabled
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
<jsp:include page="${APP_PATH}/jsp/common/bottom.jsp" flush="true"/>
</body>


<script>

    $(function () {
        if ($.AMUI.utils.cookie.get("userlogin") != null) {
            $('#userlogin').val($.AMUI.utils.cookie.get("userlogin"));
        }
        if ($.AMUI.utils.cookie.get("userpassword") != null) {
            $('#userpassword').val($.AMUI.utils.cookie.get("userpassword"));
        }
    });

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

                    if ($('#rememberMe')[0].checked) {
                        console.log(userlogin);
                        $.AMUI.utils.cookie.set("userlogin", userlogin);
                    }
                    if ($('#rememberPassword')[0].checked) {
                        $.AMUI.utils.cookie.set("userpassword", userpassword);
                    }
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

    $("body").keydown(function () {
        if (event.keyCode == "13") {//keyCode=13是回车键
            $('#LoginBtn').click();
        }
    });

</script>

</html>
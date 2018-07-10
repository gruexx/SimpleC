<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <title>注册</title>
    <script src="${APP_PATH}/js/jquery-3.1.1.min.js"></script>

    <link href="${APP_PATH}/amazeui-3.0.0-alpha.beta/AmazeUIdemo/assets/css/amazeui.min.css" rel="stylesheet"
          type="text/css">
    <script src="${APP_PATH}/amazeui-3.0.0-alpha.beta/AmazeUIdemo/assets/js/amazeui.min.js"
            type="text/javascript"></script>

    <link href="${APP_PATH}/css/dlstyle.css" rel="stylesheet" type="text/css">

    <%--<link href="${APP_PATH}/AmazeUI-2.4.2/assets/css/amazeui.min.css" rel="stylesheet"/>--%>
    <%--<script src="${APP_PATH}/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>--%>

    <link href="${APP_PATH}/css/jquery.toast.min.css" rel="stylesheet">
    <script type="text/javascript" src="${APP_PATH}/js/jquery.toast.min.js"></script>
</head>

<style type="text/css">
    .default {
        background: transparent;
    }

    .weak {
        background: #FF0000;
    }

    .medium {
        background: #FF7F24;
    }

    .strong {
        background: #33CC00;
    }
</style>

<body>
<div class="login-boxtitle" style="height: 100px">
    <a href="${APP_PATH}/toLogin"><img alt="logo" src="${APP_PATH}/static/picture/logoPro.png"
                                       style="height: 100px"/></a>
</div>
<div class="res-banner" style="background: url(${APP_PATH}/static/picture/register.jpg)no-repeat center fixed;
        height: 700px;background-size: 100%">
    <div class="res-main">
        <div class="login-box" style="background-color:rgba(0,0,0,0.4);height: 500px">


            <form class="am-form" id="registerForm">
                <legend style="color: white;padding-bottom: 15px">加入我们</legend>
                <hr style="padding-bottom: 15px"/>
                <fieldset>
                    <div class="am-form-group am-form-icon am-form-feedback">
                        <input type="text" name="username" id="username" class="am-form-field"
                               minlength="3" maxlength="16" placeholder="输入用户名（3-16个字符）" required/>
                        <span style="display: none" class="am-icon-check"></span>
                    </div>
                    <div class="am-form-group am-form-icon am-form-feedback">
                        <input type="email" name="useremail" class="am-form-field"
                               id="useremail"
                               data-validation-message="输入地球上的电子邮箱撒"
                               placeholder="输入邮箱" required/>
                        <span style="display: none" class="am-icon-check"></span>
                    </div>
                    <div class="am-form-group am-form-icon am-form-feedback">

                        <input type="password" name="userpassword" class="am-form-field" id="userpassword"
                               placeholder="设置密码" required/>
                        <span style="display: none" class="am-icon-check"></span>
                    </div>
                    <span style="display: inline-block;width:100px;height:14px;line-height:15px;text-align: center;margin: 1px 1px;font-size:15px;"
                          class="default"></span>
                    <span style="display: inline-block;width:100px;height:14px;line-height:15px;text-align: center;margin: 1px 1px;font-size:15px;"
                          class="default"></span>
                    <span style="display: inline-block;width:100px;height:14px;line-height:15px;text-align: center;margin: 1px 1px;font-size:15px;"
                          class="default"></span>
                    <div class="am-form-group am-form-icon am-form-feedback">

                        <input type="password" id="p2" placeholder="确认密码" class="am-form-field"
                               data-equal-to="#userpassword"
                               data-validation-message="密码对不上啊喂" required/>
                        <span style="display: none" class="am-icon-check"></span>
                    </div>
                    <div class="am-cf">
                        <input type="button" id="RegBtn" value="注册"
                               class="am-btn am-btn-primary am-btn-sm am-fl am-disabled">
                    </div>
                </fieldset>
            </form>

        </div>
    </div>
</div>
<jsp:include page="${APP_PATH}/jsp/common/bottom.jsp" flush="true"/>

</body>

</html>
<script>
    /**
     * 注册表单校验
     */
    $(function () {
        $("#registerForm").validator({
            onValid: function (validity) {
                $(validity.field).closest('.am-form-group').find('.am-alert').hide();
                $(validity.field).closest('.am-form-group').find('.am-icon-check').show();
                $("#registerForm").find(".am-cf").find("#RegBtn").removeClass("am-disabled");
            },

            onInValid: function (validity) {
                var $field = $(validity.field);
                var $group = $field.closest('.am-form-group');
                var $alert = $group.find('.am-alert');
                // 使用自定义的提示信息 或 插件内置的提示信息
                var msg = $field.data('validationMessage') || this.getValidationMessage(validity);

                if (!$alert.length) {
                    $alert = $('<div class="am-alert am-alert-danger"></div>').hide().appendTo($group);
                }

                $alert.html(msg).show();
                $group.find('.am-icon-check').hide();
                $("#registerForm").find(".am-cf").find("#RegBtn").addClass("am-disabled");
            }
        });
    });

    $('#RegBtn').click(function () {
        if ($('#p2').val() !== $('#userpassword').val()) {
            $.toast({
                text: '请确认密码',
                showHideTransition: 'slide',
                hideAfter: false,
                position: 'top-right'
            })
            $('#p2').focus();
        } else {

            $.ajax({
                url: '${APP_PATH}/doRegister',
                type: 'POST',
                data: $('#registerForm').serialize(),
                success: function (result) {
                    console.log(result.code);
                    if (result.code === 100) {
                        $.toast({
                            heading: "Success",
                            text: 'Yes! 注册成功, 我们已发送账号激活邮件, 激活后即可登录 <a href="${APP_PATH}/toLogin">登录</a>.',
                            showHideTransition: 'slide',
                            hideAfter: false,
                            position: 'top-right',
                            icon: 'success'
                        })
                    } else {
                        if (undefined != result.extend.msg) {
                            $.toast({
                                heading: "Fail",
                                text: result.extend.msg + ',如果有账号,请直接<a href="${APP_PATH}/toLogin">登录</a>.',
                                showHideTransition: 'slide',
                                hideAfter: false,
                                position: 'top-right'
                            });
                        } else if (undefined != result.extend.errorFields.username) {
                            $.toast({
                                heading: "Fail",
                                text: result.extend.errorFields.username + ',如果有账号,请直接<a href="${APP_PATH}/toLogin">登录</a>.',
                                showHideTransition: 'slide',
                                hideAfter: false,
                                position: 'top-right'
                            });
                        } else if (undefined != result.extend.errorFields.useremail) {
                            $.toast({
                                heading: "Fail",
                                text: result.extend.errorFields.useremail + ',如果有账号,请直接<a href="${APP_PATH}/toLogin">登录</a>.',
                                showHideTransition: 'slide',
                                hideAfter: false,
                                position: 'top-right'
                            });
                        } else if (undefined != result.extend.errorFields.userpassword) {
                            $.toast({
                                heading: "Fail",
                                text: result.extend.errorFields.userpassword + ',如果有账号,请直接<a href="${APP_PATH}/toLogin">登录</a>.',
                                showHideTransition: 'slide',
                                hideAfter: false,
                                position: 'top-right'
                            });
                        }
                    }
                }
            });

        }
    })
</script>

<script type="text/javascript">
    window.onload = function () {

        var oInput = document.getElementById('userpassword');
        <!-- oInput.value = '';-->
        var spans = document.getElementsByTagName('span');

        oInput.onkeyup = function () {
            //强度状态设为默认
            spans[3].className = spans[4].className = spans[5].className = "default";

            var pwd = this.value;
            var result = 0;
            for (var i = 0, len = pwd.length; i < len; ++i) {
                result |= charType(pwd.charCodeAt(i));
            }

            var level = 0;
            //对result进行四次循环，计算其level
            for (var i = 0; i <= 4; i++) {
                if (result & 1) {
                    level++;
                }
                //右移一位
                result = result >>> 1;
            }

            if (pwd.length > 0) {
                switch (level) {
                    case 1:
                        spans[3].className = "weak";
                        spans[3].innerText = "弱";
                        break;
                    case 2:
                        spans[3].className = "medium";
                        spans[4].className = "medium";
                        spans[4].innerText = "中";
                        break;
                    case 3:
                    case 4:
                        spans[3].className = "strong";
                        spans[4].className = "strong";
                        spans[5].className = "strong";
                        spans[5].innerText = "强";
                        break;
                }
            }
        }
    };

    /*
        定义一个函数，对给定的数分为四类(判断密码类型)，返回十进制1，2，4，8
        数字 0001 -->1  48~57
        小写字母 0010 -->2  97~122
        大写字母 0100 -->4  65~90
        特殊 1000 --> 8 其它
    */
    function charType(num) {
        if (num >= 48 && num <= 57) {
            return 1;
        }
        if (num >= 97 && num <= 122) {
            return 2;
        }
        if (num >= 65 && num <= 90) {
            return 4;
        }
        return 8;
    }
</script>
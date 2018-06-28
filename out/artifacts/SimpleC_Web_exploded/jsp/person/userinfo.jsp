<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <title>个人资料</title>
    <script src="${APP_PATH}/js/jquery-3.1.1.js"></script>

    <link href="${APP_PATH}/amazeui-3.0.0-alpha.beta/AmazeUIdemo/assets/css/amazeui.min.css" rel="stylesheet"
          type="text/css">
    <script src="${APP_PATH}/amazeui-3.0.0-alpha.beta/AmazeUIdemo/assets/js/amazeui.min.js"
            type="text/javascript"></script>

    <%--<link href="${APP_PATH}/AmazeUI-2.4.2/assets/css/amazeui.min.css" rel="stylesheet"/>--%>
    <%--<script src="${APP_PATH}/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>--%>

    <link href="${APP_PATH}/css/personal.css" rel="stylesheet" type="text/css">
    <link href="${APP_PATH}/css/infstyle.css" rel="stylesheet" type="text/css">

    <link href="${APP_PATH}/css/jquery.toast.min.css" rel="stylesheet">
    <script type="text/javascript" src="${APP_PATH}/js/jquery.toast.min.js"></script>
</head>

<body>
<!--头 -->
<header>
    <article>
        <div class="mt-logo">
            <!--顶部导航条 -->
            <jsp:include page="${APP_PATH}/jsp/common/top.jsp" flush="true"/>
            <div class="clear"></div>
        </div>
        </div>
    </article>
</header>
<div class="nav-table">
    <div class="long-title"><span class="all-goods">全部分类</span></div>
    <div class="nav-cont">
        <ul>
            <li class="index"><a href="${APP_PATH}/toHome">首页</a></li>
        </ul>
        <jsp:include page="${APP_PATH}/jsp/common/chaopoint.jsp" flush="true"/>
    </div>
</div>
<b class="line"></b>
<div class="center">
    <div class="col-main">
        <div class="main-wrap">
            <div class="user-info">
                <!--标题 -->
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">个人资料</strong> /
                        <small>Personal&nbsp;information</small>
                    </div>
                </div>
                <hr/>
                <!--头像 -->
                <div class="user-infoPic">
                    <form id="userImageForm">
                        <input id="userImage" name="userImage" type="file" class="inputPic">
                    </form>
                    <%--<img class="am-circle am-img-thumbnail" src="${APP_PATH}/${sessionScope.image}" alt=""/>--%>
                    <img class="am-img-thumbnail am-round am-img-responsive" alt="140*140"
                         src="${APP_PATH}/${sessionScope.image}" width="140" height="140"/>

                    <p class="am-form-help">头像</p>
                    <div class="info-m">
                        <div><b>用户名：<i>${sessionScope.username}</i></b></div>

                        <div class="u-safety">
                            <a href="#">
                                潮积分：
                                <span class="u-profile">
                                    <i style="width: 60px;">${sessionScope.userchaopoint}</i>
                                </span>
                            </a>
                        </div>
                    </div>
                </div>
                <!--个人信息 -->
                <div class="info-main">
                    <form class="am-form am-form-horizontal">
                        <%--<div class="am-form-group">--%>
                        <%--<label class="am-form-label">昵称</label>--%>
                        <%--<div class="am-form-content">--%>
                        <%--<input type="text" placeholder="nickname" value=""></div>--%>
                        <%--</div>--%>
                        <div class="am-form-group">
                            <label class="am-form-label">姓名</label>
                            <div class="am-form-content">
                                <input type="text" placeholder="name" value="${sessionScope.username}"></div>
                        </div>
                        <%--<div class="am-form-group">--%>
                        <%--<label class="am-form-label">性别</label>--%>
                        <%--<div class="am-form-content sex">--%>
                        <%--<label class="am-radio-inline">--%>
                        <%--<input type="radio" name="radio10" value="male" data-am-ucheck> 男 </label>--%>
                        <%--<label class="am-radio-inline">--%>
                        <%--<input type="radio" name="radio10" value="female" data-am-ucheck> 女 </label>--%>
                        <%--<label class="am-radio-inline">--%>
                        <%--<input type="radio" name="radio10" value="secret" data-am-ucheck> 保密 </label>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="am-form-group">--%>
                        <%--<label class="am-form-label">生日</label>--%>
                        <%--<div class="am-form-content birth">--%>
                        <%--<div class="birth-select">--%>
                        <%--<select data-am-selected>--%>
                        <%--<option value="a">2015</option>--%>
                        <%--<option value="b">1987</option>--%>
                        <%--<lect> <em>年</em></div>--%>
                        <%--<div class="birth-select2">--%>
                        <%--<select data-am-selected>--%>
                        <%--<option value="a">12</option>--%>
                        <%--<option value="b">8</option>--%>
                        <%--<lect> <em>月</em></div>--%>
                        <%--<div class="birth-select2">--%>
                        <%--<select data-am-selected>--%>
                        <%--<option value="a">21</option>--%>
                        <%--<option value="b">23</option>--%>
                        <%--<lect> <em>日</em></div>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <div class="am-form-group">
                            <label for="user-phone" class="am-form-label">电话</label>
                            <div class="am-form-content">
                                <input id="user-phone" placeholder="telephonenumber" type="tel" value="${sessionScope.phonenumber}"></div>
                        </div>
                        <div class="am-form-group">
                            <label for="user-phone" class="am-form-label">地址</label>
                            <div class="am-form-content">
                                <input id="user-address" placeholder="address" type="text" value="${sessionScope.useraddress}"></div>
                        </div>
                        <div class="am-form-group">
                            <label for="user-email" class="am-form-label">电子邮件</label>
                            <div class="am-form-content">
                                <input id="user-email" placeholder="Email" type="email" value="${sessionScope.useremail}"></div>
                        </div>


                        <div class="info-btn">
                            <button type="button" class="am-btn am-btn-success am-btn-block">保存修改</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
        <!--底部-->
        <jsp:include page="${APP_PATH}/jsp/common/bottom.jsp" flush="true"/>
    </div>
    <aside class="menu">
        <ul>
            <li class="person"><a href="${APP_PATH}/toUserInfo" style="font-size: 16px">个人中心</a></li>
            <hr/>
            <li class="person" style="font-size: 15px;font-weight: bold"> 个人资料
                <hr/>
                <ul>
                    <li class="active"><a href="${APP_PATH}/toUserInfo">个人信息</a></li>
                    <li><a href="${APP_PATH}/toAddress">收货地址</a></li>
                </ul>
            </li>
            <li class="person" style="font-size: 15px;font-weight: bold"> 我的交易
                <hr/>
                <ul>
                    <li><a href="${APP_PATH}/toOrderItem">订单管理</a></li>
                </ul>
                <ul>
                    <li><a href="${APP_PATH}/toGoodsManage">管理我的商品</a></li>
                </ul>
            </li>
            <li class="person" style="font-size: 15px;font-weight: bold"> 我的资产
                <hr/>
                <ul>
                    <li><a href="${APP_PATH}/toBill">账单明细</a></li>
                </ul>
            </li>
        </ul>
    </aside>
</div>
</body>

</html>

<script>
    $('#userImage').change(function () {

        var form = new FormData(document.getElementById("userImageForm"));

        $.ajax({
            type: "post",
            url: "/userInfo/image",
            data: form,
            processData: false,
            contentType: false,
            success: function (result) {
                if (result.code === 100) {
                    $.toast({
                        heading: "Success",
                        text: result.extend.msg + ' , <a href="${APP_PATH}/toUserInfo">刷新</a>.',
                        showHideTransition: 'slide',
                        hideAfter: false,
                        icon: 'success',
                        position: 'top-right'
                    })
                } else {
                    $.toast({
                        heading: "Fail",
                        text: result.extend.msg,
                        showHideTransition: 'fade',
                        position: 'top-right'
                    })
                }
            },
            error: function () {
                $.toast({
                    heading: "Fail",
                    text: "头像更新失败",
                    showHideTransition: 'fade',
                    position: 'top-right'
                })
            }
        })
    })
</script>
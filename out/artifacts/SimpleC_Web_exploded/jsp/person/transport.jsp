<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<html>

<head>
    <base href="<%=basePath%>">
    <title>物流详情</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <title>物流信息</title>
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
                    <div class="am-fl am-cf">
                        <strong class="am-text-danger am-text-lg">物流信息</strong>/
                        <small>transport</small>
                    </div>
                </div>
                <ul class="am-list am-list-static am-list-border am-list-striped">
                    <li>订单信息:<span id="message"></span></li>
                    <li>订单编号:<span id="num"></span></li>
                    <li>物流方式:<span id="company"></span></li>
                </ul>
                <table class="am-table am-table-striped am-table-hover">
                    <thead>
                    <tr>
                        <th>时间</th>
                        <th>跟踪进度</th>
                        <th>地点</th>
                    </tr>
                    </thead>
                    <tbody id="transportMessage">

                    </tbody>
                </table>
                <div class="am-btn-group am-btn-group-justify" style="padding-top: 30px;">
                    <a href="javascript:history.back(-1)" class="am-btn am-btn-success" role="button">返回订单</a>
                </div>
                <hr/>

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
                    <li><a href="${APP_PATH}/toUserInfo">个人信息</a></li>
                    <li><a href="${APP_PATH}/toAddress">收货地址</a></li>
                </ul>
            </li>
            <li class="person" style="font-size: 15px;font-weight: bold"> 我的交易
                <hr/>
                <ul>
                    <li class="active"><a href="${APP_PATH}/toOrderItem">订单管理</a></li>
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
    $(function () {
        var expressContent = JSON.parse('${requestScope.expressContent}');
        console.log(expressContent);
        $('#message').append(expressContent.message);
        $('#num').append(expressContent.nu);
        $('#company').append(expressContent.com);
        $.each(expressContent.data, function (i) {
            $('#transportMessage').append(
                '<tr>' +
                '<td>' + expressContent.data[i].time + '</td>' +
                '<td>' + expressContent.data[i].context + '</td>' +
                '<td>' + expressContent.data[i].location + '</td>' +
                '</tr>'
            )
        })
    })
</script>

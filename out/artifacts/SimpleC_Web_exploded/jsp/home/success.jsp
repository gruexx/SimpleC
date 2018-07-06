<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <title>付款成功页面</title>
    <script src="${APP_PATH}/js/jquery-3.1.1.js"></script>

    <link href="${APP_PATH}/amazeui-3.0.0-alpha.beta/AmazeUIdemo/assets/css/amazeui.min.css" rel="stylesheet"
          type="text/css">
    <script src="${APP_PATH}/amazeui-3.0.0-alpha.beta/AmazeUIdemo/assets/js/amazeui.min.js"
            type="text/javascript"></script>

    <%--<link href="${APP_PATH}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet">--%>
    <%--<link href="${APP_PATH}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet">--%>

    <link href="${APP_PATH}/basic/css/demo.css" rel="stylesheet" type="text/css"/>
    <link href="${APP_PATH}/css/sustyle.css" rel="stylesheet" type="text/css"/>
</head>

<body>
<!--顶部导航条 -->
<jsp:include page="${APP_PATH}/jsp/common/top.jsp" flush="true"/>
<div class="clear"></div>
<div class="take-delivery">
    <div class="status">
        <h2>您已成功付款</h2>
        <div class="successInfo">
            <ul>
                <li>付款金额<em>${requestScope.orderitem.totalprice}</em></li>
                <li>潮积分抵消<em>-${requestScope.orderitem.setoff}</em></li>
                <br>
                <li style="color: red">实际付款金额<em>${requestScope.orderitem.totalprice-requestScope.orderitem.setoff}</em></li>
                <div class="user-info">
                    <p>收货人：${requestScope.address.receiver}</p>
                    <p>联系电话：${requestScope.address.phone}</p>
                    <p>收货地址：${requestScope.address.address}</p>
                </div>
                请认真核对您的收货信息，如有错误请联系客服
            </ul>
            <div class="option">
                <span class="info">您可以</span>
                <a href="${APP_PATH}/toOrderDetails/${requestScope.orderitem.orderitemid}">查看
                    <span>订单详情</span></a>
            </div>
        </div>
    </div>
    <jsp:include page="${APP_PATH}/jsp/common/bottom.jsp" flush="true"/>
</body>

</html>
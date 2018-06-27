<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <title>付款成功页面</title>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/AmazeUI-2.4.2/assets/css/amazeui.css" />
    <link href="${APP_PATH}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="${APP_PATH}/basic/css/demo.css" rel="stylesheet" type="text/css" />
    <link href="${APP_PATH}/css/sustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${APP_PATH}/basic/js/jquery-1.7.min.js"></script>
</head>

<body>
    <!--顶部导航条 -->
    <jsp:include   page="${APP_PATH}/jsp/common/top.jsp" flush="true"/>
    <div class="clear"></div>
    <div class="take-delivery">
        <div class="status">
            <h2>您已成功付款</h2>
            <div class="successInfo">
                <ul>
                    <li>付款金额<em>¥9.90</em></li>
                    <div class="user-info">
                        <p>收货人：艾迪</p>
                        <p>联系电话：15871145629</p>
                        <p>收货地址：湖北省 武汉市 武昌区 东湖路75号众环大厦</p>
                    </div> 请认真核对您的收货信息，如有错误请联系客服 </ul>
                <div class="option"> <span class="info">您可以</span> <a href="${APP_PATH}/person/order.html" class="J_MakePoint">查看<span>已买到的宝贝</span></a> <a href="${APP_PATH}/person/orderinfo.html" class="J_MakePoint">查看<span>交易详情</span></a> </div>
            </div>
        </div>
    </div>
    <jsp:include   page="${APP_PATH}/jsp/common/bottom.jsp" flush="true"/>
</body>

</html>
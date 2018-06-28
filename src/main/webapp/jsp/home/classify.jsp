<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script src="${APP_PATH}/js/jquery-3.1.1.js"></script>

    <link href="${APP_PATH}/amazeui-3.0.0-alpha.beta/AmazeUIdemo/assets/css/amazeui.min.css" rel="stylesheet" type="text/css">
    <script src="${APP_PATH}/amazeui-3.0.0-alpha.beta/AmazeUIdemo/assets/js/amazeui.min.js" type="text/javascript"></script>

    <%--<link href="${APP_PATH}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet">--%>
    <%--<link href="${APP_PATH}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet">--%>

    <link href="${APP_PATH}/css/personal.css" rel="stylesheet" type="text/css">
</head>

<body>
<jsp:include   page="${APP_PATH}/jsp/common/top.jsp" flush="true"/>

<div class="nav-table">
    <div class="long-title"><span class="all-goods">${requestScope.classify}</span></div>
    <div class="nav-cont">

        <li><a href="javascript:history.back(-1)">返回</a></li>
        <li class="index"><a href="${APP_PATH}/toHome">首页</a></li>
        <jsp:include   page="${APP_PATH}/jsp/common/chaopoint.jsp" flush="true"/>
    </div>
</div>
<b class="line"></b>
<!--文章 -->
<div class="am-g am-g-fixed blog-g-fixed bloglist">
    <div class="am-u-md-12">
        <div class="am-g blog-content">
            <div class="am-u-sm-12">
                <div class="Row">
                    <c:forEach items="${requestScope.GoodsList}" var="goodsList">
                        <li data-am-scrollspy="{animation: 'fade'}" style="height: 278px;width: 277px;">
                            <a href="${APP_PATH}/toIntroduction/${goodsList.goodsid}">
                                <img class="am-img-responsive" src="${APP_PATH}/${goodsList.image}"
                                     data-am-popover="{position: 'bottom' ,theme: 'primary lg' ,content: '${goodsList.goodsname}', trigger: 'hover focus'}"/>
                            </a>
                        </li>
                    </c:forEach>
                    <h3>${requestScope.None}</h3>
                </div>
            </div>
        </div>
        <hr class="am-article-divider blog-hr">
    </div>

</div>
<jsp:include   page="${APP_PATH}/jsp/common/bottom.jsp" flush="true"/>


</body>

</html>

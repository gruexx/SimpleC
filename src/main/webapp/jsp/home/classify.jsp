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
<!--顶部导航条 -->
<div class="am-container header">
    <ul class="message-l">
        <div class="topMessage">
            <div class="menu-hd">
                <a href="${APP_PATH}/toHome" target="_top" class="h">Hi,${sessionScope.username}</a> |
                <a href="${APP_PATH}/Logout" target="_top" class="h">退出账号</a>
            </div>
        </div>
    </ul>
    <ul class="message-r">
        <div class="topMessage home">
            <div class="menu-hd"><a href="${APP_PATH}/toHome" target="_top" class="h">商城首页</a></div>
        </div>
        <div class="topMessage my-shangcheng">
            <div class="menu-hd MyShangcheng"><a href="#" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a>
            </div>
        </div>
        <div class="topMessage mini-cart">
            <div class="menu-hd"><a id="mc-menu-hd" href="#" target="_top"><i
                    class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum"
                                                                                          class="h">0</strong></a></div>
        </div>
    </ul>
</div>
<!--悬浮搜索框-->
<div class="nav white">
    <div class="logoBig">
        <li>
            <a href="${APP_PATH}/toHome">
            <img src="${APP_PATH}/static/picture/logoPro.png" style="height: 90px;width: 150px"/></a>
        </li>
    </div>
    <div class="search-bar pr">
        <a name="index_none_header_sysc" href="#"></a>
        <form action="${APP_PATH}/Search" method="post">
            <input id="searchInput" name="search" type="text" placeholder="搜索" autocomplete="off">
            <input id="ai-topsearch" class="submit am-btn" value="搜索" type="submit">
        </form>

    </div>
</div>
<div class="nav-table">
    <div class="long-title"><span class="all-goods">${requestScope.classify}</span></div>
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
                                <img src="${APP_PATH}/${goodsList.image}"/>
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
<div class="footer ">
    <div class="footer-hd ">
        <p><a href="#">心潮工作室</a> <b>|</b> <a href="${APP_PATH}/jsp/home/home.jsp">商城首页</a> <b>|</b> <a href="# ">支付宝</a>
            <b>|</b>
            <a href="#">物流</a></p>
    </div>
    <div class="footer-bd ">
        <p><a href="# ">关于心潮</a> <a href="# ">合作伙伴</a> <a href="# ">联系我们</a> <a href="# ">网站地图</a> <em>© 2018-2038
            SimpleChange.com 版权所有.</em></p>
    </div>
</div>

<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="${APP_PATH}/AmazeUI-2.4.2/assets/js/amazeui.ie8polyfill.min.js"></script>
<script src="${APP_PATH}/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script src="${APP_PATH}/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
</body>

</html>

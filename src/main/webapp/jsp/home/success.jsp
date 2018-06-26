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
                <div class="menu-hd MyShangcheng"><a href="#" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a> </div>
            </div>
            <div class="topMessage mini-cart">
                <li class="am-dropdown" data-am-dropdown>
                    <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
                        购物车 <span class="am-icon-caret-down"></span>
                    </a>
                    <ul class="am-dropdown-content" style="white-space: nowrap">
                        <li class="am-dropdown-header" >${sessionScope.username}的购物车</li>
                        <li class="am-divider"></li>
                        <li class="am-active"><a href="${APP_PATH}/toShopcart">前往购物车</a></li>
                        <li class="am-divider"></li>
                        <li><a href="#">网址不变且唯一</a></li>
                        <li><a href="#">内容实时同步更新</a></li>
                        <li><a href="#">云端跨平台适配</a></li>
                        <li><a href="#">专属的一键拨叫</a></li>
                    </ul>
                </li>
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
    <div class="footer ">
        <div class="footer-hd ">
            <p> <a href="# ">心潮工作室</a> <b>|</b> <a href="# ">商城首页</a> <b>|</b> <a href="# ">支付宝</a> <b>|</b> <a href="# ">物流</a> </p>
        </div>
        <div class="footer-bd ">
            <p> <a href="# ">关于心潮</a> <a href="# ">合作伙伴</a> <a href="# ">联系我们</a> <a href="# ">网站地图</a> <em>© 2018-2038 SimpleChange.com 版权所有.</em> </p>
        </div>
    </div>
</body>

</html>
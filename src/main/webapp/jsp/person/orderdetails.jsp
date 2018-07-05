<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <title>订单详情</title>
    <script src="${APP_PATH}/js/jquery-3.1.1.js"></script>

    <link href="${APP_PATH}/amazeui-3.0.0-alpha.beta/AmazeUIdemo/assets/css/amazeui.min.css" rel="stylesheet"
          type="text/css">
    <script src="${APP_PATH}/amazeui-3.0.0-alpha.beta/AmazeUIdemo/assets/js/amazeui.min.js"
            type="text/javascript"></script>

    <%--<link href="${APP_PATH}/AmazeUI-2.4.2/assets/css/amazeui.min.css" rel="stylesheet"/>--%>
    <%--<script src="${APP_PATH}/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>--%>

    <link href="${APP_PATH}/css/personal.css" rel="stylesheet" type="text/css">
    <link href="${APP_PATH}/css/orstyle.css" rel="stylesheet" type="text/css">
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
            <div class="user-orderinfo">
                <!--标题 -->
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单详情</strong> /
                        <small>Order&nbsp;details</small>
                    </div>
                </div>
                <hr/>
                <!--进度条-->


                <div class="order-infomain">
                    <div class="order-top">
                        <div class="th th-item">
                            <td class="td-inner">商品</td>
                        </div>
                        <div class="th th-price">
                            <td class="td-inner">单价</td>
                        </div>
                        <div class="th th-number">
                            <td class="td-inner">数量</td>
                        </div>
                        <%--<div class="th th-operation">--%>
                        <%--<td class="td-inner"></td>--%>
                        <%--</div>--%>
                        <div class="th th-change" style="float: right;">
                            <td class="td-inner">交易操作</td>
                        </div>
                        <div class="th th-status" style="float: right;">
                            <td class="td-inner">交易状态</td>
                        </div>
                        <div class="th th-amount" style="float: right;">
                            <td class="td-inner">合计</td>
                        </div>


                    </div>
                    <div class="order-main">
                        <div class="order-status3">
                            <div class="order-title">
                                <div class="dd-num">订单编号：<a
                                        href="javascript:;">${requestScope.OrderItemList.orderitemid}</a></div>
                                <span>成交时间：2015-12-20</span>
                            </div>
                            <c:forEach items="${requestScope.GoodsList}" var="GoodsList" varStatus="loop">
                                <div class="order-content">
                                    <div class="order-left">
                                        <ul class="item-list" style="float: left;">
                                            <li class="td td-item">
                                                <div class="item-pic">
                                                    <a href="#" class="J_MakePoint"> <img
                                                            src="${APP_PATH}/${GoodsList.image}"
                                                            class="itempic J_ItemImg"> </a>
                                                </div>
                                                <div class="item-info">
                                                    <div class="item-basic-info">
                                                        <a href="#">
                                                            <p>${GoodsList.goodsname}</p>
                                                        </a>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="td td-price">
                                                <div class="item-price">${GoodsList.goodsprice}</div>
                                            </li>
                                            <li class="td td-number">
                                                <div class="item-number">
                                                    <span>×</span>${requestScope.OrderDetailList[loop.count-1].number}
                                                </div>
                                            </li>
                                                <%--<li class="td td-operation">--%>
                                                <%--<div class="item-operation"> 退款/退货 </div>--%>
                                                <%--</li>--%>
                                        </ul>

                                    </div>

                                    <div class="order-right">
                                        <li class="td td-amount">
                                            <div class="item-amount" style="float: left;">
                                                合计：
                                                <p class="totalprice">
                                                    <script>${GoodsList.goodsprice*requestScope.OrderDetailList[loop.count-1].number}</script>
                                                </p>
                                            </div>
                                        </li>
                                        <div class="move-right">
                                            <li class="td td-status">
                                                <div class="item-status">
                                                    <p class="Mystatus">卖家已发货</p>
                                                    <p class="order-info"><a href="#">查看物流</a></p>
                                                    <p class="order-info"><a href="#">延长收货</a></p>
                                                </div>
                                            </li>
                                            <li class="td td-change">
                                                <div class="am-btn am-btn-danger anniu"> 确认收货</div>
                                            </li>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                    </div>
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


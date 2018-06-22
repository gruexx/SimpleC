<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <title>订单管理</title>
    <link href="${APP_PATH}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="${APP_PATH}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
    <link href="${APP_PATH}/css/personal.css" rel="stylesheet" type="text/css">
    <link href="${APP_PATH}/css/orstyle.css" rel="stylesheet" type="text/css">
    <script src="${APP_PATH}/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="${APP_PATH}/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
</head>

<body>
    <!--头 -->
    <header>
        <article>
            <div class="mt-logo">
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
                            <div class="menu-hd MyShangcheng"><a href="${APP_PATH}/toUserInfo" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a>
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
                <div class="clear"></div>
            </div>
            </div>
        </article>
    </header>
    <div class="nav-table">
        <div class="long-title"><span class="all-goods">全部分类</span></div>
        <div class="nav-cont">
            <ul>
                <li class="index"><a href="#">首页</a></li>
            </ul>
            <div class="nav-extra"> <i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的潮积分 <i class="am-icon-angle-right" style="padding-left: 10px;"></i> </div>
        </div>
    </div> <b class="line"></b>
    <div class="center">
        <div class="col-main">
            <div class="main-wrap">
                <div class="user-order">
                    <!--标题 -->
                    <div class="am-cf am-padding">
                        <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单管理</strong> / <small>Order</small></div>
                    </div>
                    <hr/>
                    <div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>
                        <div class="am-tabs-bd">
                            <div class="am-tab-panel am-fade am-in am-active" id="tab1">
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
                                    <div class="th th-operation">
                                        <td class="td-inner">商品操作</td>
                                    </div>
                                    <div class="th th-amount">
                                        <td class="td-inner">合计</td>
                                    </div>
                                    <div class="th th-status">
                                        <td class="td-inner">交易状态</td>
                                    </div>
                                    <div class="th th-change">
                                        <td class="td-inner">交易操作</td>
                                    </div>
                                </div>
                                <div class="order-main">
                                    <div class="order-list">
                                        <!--交易成功-->
                                        <!--交易失败-->
                                        <!--待发货-->
                                        <!--不同状态订单-->
                                        <div class="order-status3">
                                            <div class="order-title">
                                                <div class="dd-num">订单编号：<a href="javascript:;">1601430</a></div> <span>成交时间：2015-12-20</span>
                                                <!--    <em>店铺：小桔灯</em>--></div>
                                            <div class="order-content">
                                                <div class="order-left">
                                                    <ul class="item-list">
                                                        <li class="td td-item">
                                                            <div class="item-pic">
                                                                <a href="#" class="J_MakePoint"> <img src="${APP_PATH}/images/62988.jpg_80x80.jpg" class="itempic J_ItemImg"> </a>
                                                            </div>
                                                            <div class="item-info">
                                                                <div class="item-basic-info">
                                                                    <a href="#">
                                                                        <p>礼盒袜子女秋冬 纯棉袜加厚 韩国可爱 </p>
                                                                        <p class="info-little">颜色分类：李清照
                                                                            <br/>尺码：均码</p>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="td td-price">
                                                            <div class="item-price"> 333.00 </div>
                                                        </li>
                                                        <li class="td td-number">
                                                            <div class="item-number"> <span>×</span>2 </div>
                                                        </li>
                                                        <li class="td td-operation">
                                                            <div class="item-operation"> <a href="refund.html">退款/退货</a> </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="order-right">
                                                    <li class="td td-amount">
                                                        <div class="item-amount"> 合计：676.00
                                                            <p>含运费：<span>10.00</span></p>
                                                        </div>
                                                    </li>
                                                    <div class="move-right">
                                                        <li class="td td-status">
                                                            <div class="item-status">
                                                                <p class="Mystatus">卖家已发货</p>
                                                                <p class="order-info"><a href="order.jsp">订单详情</a></p>
                                                                <p class="order-info"><a href="logistics.html">查看物流</a></p>
                                                                <p class="order-info"><a href="#">延长收货</a></p>
                                                            </div>
                                                        </li>
                                                        <li class="td td-change">
                                                            <div class="am-btn am-btn-danger anniu"> 确认收货</div>
                                                        </li>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--底部-->
            <div class="footer ">
                <div class="footer-hd ">
                    <p><a href="#">心潮工作室</a> <b>|</b> <a href="${APP_PATH}/home/home.jsp">商城首页</a> <b>|</b> <a href="# ">支付宝</a> <b>|</b> <a href="#">物流</a></p>
                </div>
                <div class="footer-bd ">
                    <p><a href="# ">关于心潮</a> <a href="# ">合作伙伴</a> <a href="# ">联系我们</a> <a href="# ">网站地图</a> <em>© 2018-2038
            SimpleChange.com 版权所有.</em></p>
                </div>
            </div>
        </div>
        <aside class="menu">
            <ul>
                <li class="person"> <a href="${APP_PATH}/toUserInfo" style="font-size: 16px">个人中心</a> </li>
                <hr/>
                <li class="person" style="font-size: 15px"> 个人资料
                    <hr/>
                    <ul>
                        <li> <a href="${APP_PATH}/toUserInfo">个人信息</a></li>
                        <li> <a href="${APP_PATH}/toAddress">收货地址</a></li>
                    </ul>
                </li>
                <li class="person" style="font-size: 15px"> 我的交易
                    <hr/>
                    <ul>
                        <li class="active"><a href="${APP_PATH}/toOrderItem">订单管理</a></li>
                    </ul>
                    <ul>
                        <li><a href="${APP_PATH}/toPublish">发布商品</a></li>
                    </ul>
                </li>
                <li class="person" style="font-size: 15px"> 我的资产
                    <hr/>
                    <ul>
                        <li> <a href="${APP_PATH}/toBill">账单明细</a></li>
                    </ul>
                </li>
            </ul>
        </aside>
    </div>
</body>

</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <title>购物车页面</title>
    <link href="${APP_PATH}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
    <link href="${APP_PATH}/basic/css/demo.css" rel="stylesheet" type="text/css" />
    <link href="${APP_PATH}/css/cartstyle.css" rel="stylesheet" type="text/css" />
    <link href="${APP_PATH}/css/optstyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${APP_PATH}/js/jquery.js"></script>
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
    <!--购物车 -->
    <div class="concent">
        <div id="cartTable">
            <div class="cart-table-th">
                <div class="wp">
                    <div class="th th-chk">
                        <div id="J_SelectAll1" class="select-all J_SelectAll"> </div>
                    </div>
                    <div class="th th-item">
                        <div class="td-inner">商品信息</div>
                    </div>
                    <div class="th th-price">
                        <div class="td-inner">单价</div>
                    </div>
                    <div class="th th-amount">
                        <div class="td-inner">数量</div>
                    </div>
                    <div class="th th-sum">
                        <div class="td-inner">金额</div>
                    </div>
                    <div class="th th-op">
                        <div class="td-inner">操作</div>
                    </div>
                </div>
            </div>
            <div class="clear"></div>
            <tr class="item-list">
                <div class="bundle  bundle-last ">
                    <div class="clear"></div>
                    <div class="bundle-main">
                        <ul class="item-content clearfix">
                            <li class="td td-chk">
                                <div class="cart-checkbox ">
                                    <input class="check" id="J_CheckBox_170769542747" name="items[]" value="170769542747" type="checkbox">
                                    <label for="J_CheckBox_170769542747"></label>
                                </div>
                            </li>
                            <li class="td td-item">
                                <div class="item-pic">
                                    <a href="#" target="_blank" data-title="美康粉黛醉美东方唇膏口红正品 持久保湿滋润防水不掉色护唇彩妆" class="J_MakePoint" data-point="tbcart.8.12"> <img src="${APP_PATH}/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg"></a>
                                </div>
                                <div class="item-info">
                                    <div class="item-basic-info"> <a href="#" target="_blank" title="美康粉黛醉美唇膏 持久保湿滋润防水不掉色" class="item-title J_MakePoint" data-point="tbcart.8.11">美康粉黛醉美唇膏 持久保湿滋润防水不掉色</a> </div>
                                </div>
                            </li>
                            <li class="td td-info">
                                <div class="item-props item-props-can"></div>
                            </li>
                            <li class="td td-price">
                                <div class="item-price price-promo-promo">
                                    <div class="price-content">
                                        <div class="price-line"> <em class="price-original">78.00</em> </div>
                                        <div class="price-line"> <em class="J_Price price-now" tabindex="0">39.00</em> </div>
                                    </div>
                                </div>
                            </li>
                            <li class="td td-amount">
                                <div class="amount-wrapper ">
                                    <div class="item-amount ">
                                        <div class="sl">
                                            <input class="min am-btn" name="" type="button" value="-" />
                                            <input class="text_box" name="" type="text" value="3" style="width:30px;" />
                                            <input class="add am-btn" name="" type="button" value="+" /> </div>
                                    </div>
                                </div>
                            </li>
                            <li class="td td-sum">
                                <div class="td-inner"> <em tabindex="0" class="J_ItemSum number">117.00</em> </div>
                            </li>
                            <li class="td td-op">
                                <div class="td-inner"> <a title="移入收藏夹" class="btn-fav" href="#">
                  移入收藏夹</a> <a href="javascript:;" data-point-url="#" class="delete">
                  删除</a> </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </tr>
        </div>
        <div class="clear"></div>
        <div class="float-bar-wrapper">
            <div id="J_SelectAll2" class="select-all J_SelectAll">
                <div class="cart-checkbox">
                    <input class="check-all check" id="J_SelectAllCbx2" name="select-all" value="true" type="checkbox">
                    <label for="J_SelectAllCbx2"></label>
                </div> <span>全选</span> </div>
            <div class="operations"> <a href="#" hidefocus="true" class="deleteAll">删除</a> <a href="#" hidefocus="true" class="J_BatchFav">移入收藏夹</a> </div>
            <div class="float-bar-right">
                <div class="amount-sum"> <span class="txt">已选商品</span> <em id="J_SelectedItemsCount">0</em><span class="txt">件</span>
                    <div class="arrow-box"> <span class="selected-items-arrow"></span> <span class="arrow"></span> </div>
                </div>
                <div class="price-sum"> <span class="txt">合计:</span> <strong class="price">¥<em id="J_Total">0.00</em></strong> </div>
                <div class="btn-area">
                    <a href="../home/pay.jsp" id="J_Go" class="submit-btn submit-btn-disabled" aria-label="请注意如果没有选择宝贝，将无法结算"> <span>结&nbsp;算</span></a>
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
    </div>
    <!--操作页面-->
    <!--引导 -->
    <div class="navCir">
        <li><a href="../home/home.jsp"><i class="am-icon-home "></i>首页</a></li>
        <li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
        <li class="active"><a href="shopcart.jsp"><i class="am-icon-shopping-basket"></i>购物车</a></li>
        <li><a href="${APP_PATH}/person/index.html"><i class="am-icon-user"></i>我的</a></li>
    </div>
</body>

</html>
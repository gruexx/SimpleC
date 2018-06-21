<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <title>商品页面</title>
    <link href="${APP_PATH}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css"/>
    <link href="${APP_PATH}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css"/>
    <link href="${APP_PATH}/basic/css/demo.css" rel="stylesheet" type="text/css"/>
    <link type="text/css" href="${APP_PATH}/css/optstyle.css" rel="stylesheet"/>
    <link type="text/css" href="${APP_PATH}/css/style.css" rel="stylesheet"/>
    <script type="text/javascript" src="${APP_PATH}/basic/js/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="${APP_PATH}/basic/js/quick_links.js"></script>
    <script type="text/javascript" src="${APP_PATH}/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
    <script type="text/javascript" src="${APP_PATH}/js/jquery.imagezoom.min.js"></script>
    <script type="text/javascript" src="${APP_PATH}/js/jquery.flexslider.js"></script>
    <script type="text/javascript" src="${APP_PATH}/js/list.js"></script>
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
<div class="clear"></div>
<b class="line"></b>
<div class="listMain">
    <!--分类-->
    <div class="nav-table">
        <div class="long-title">
            <a href="javascript:history.back(-1)" style="color: white">
                <span class="all-goods">返回上一页</span>
            </a>
        </div>
        <div class="nav-cont">
            <ul>
                <li class="index"><a href="${APP_PATH}/toHome">首页</a></li>
            </ul>
            <div class="nav-extra"><i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的潮积分 <i
                    class="am-icon-angle-right" style="padding-left: 10px;"></i></div>
        </div>
    </div>
    <ol class="am-breadcrumb am-breadcrumb-slash">

    </ol>
    <script type="text/javascript">
        $(function () {
        });
        $(window).load(function () {
            $('.flexslider').flexslider({
                animation: "slide",
                start: function (slider) {
                    $('body').removeClass('loading');
                }
            });
        });
    </script>
    <div class="scoll">
        <section class="slider">
            <div class="flexslider">
                <ul class="slides">
                    <li><img src="${APP_PATH}/${requestScope.Goods.image}" title="pic"/></li>
                    <li><img src="${APP_PATH}/${requestScope.Goods.image}"/></li>
                    <li><img src="${APP_PATH}/${requestScope.Goods.image}"/></li>
                </ul>
            </div>
        </section>
    </div>
    <!--放大镜-->
    <div class="item-inform">
        <div class="clearfixLeft" id="clearcontent">
            <div class="box">
                <script type="text/javascript">
                    $(document).ready(function () {
                        $(".jqzoom").imagezoom();
                        $("#thumblist li a").click(function () {
                            $(this).parents("li").addClass("tb-selected").siblings().removeClass("tb-selected");
                            $(".jqzoom").attr('src', $(this).find("img").attr("mid"));
                            $(".jqzoom").attr('rel', $(this).find("img").attr("big"));
                        });
                    });
                </script>
                <div class="tb-booth tb-pic tb-s310">
                    <a href="${APP_PATH}/${requestScope.Goods.image}"><img src="${APP_PATH}/${requestScope.Goods.image}"
                                                                           alt="细节展示放大镜特效"
                                                                           rel="${APP_PATH}/${requestScope.Goods.image}"
                                                                           class="jqzoom"/></a>
                </div>
                <ul class="tb-thumb" id="thumblist">
                    <li class="tb-selected">
                        <div class="tb-pic tb-s40">
                            <a href="#"><img src="${APP_PATH}/${requestScope.Goods.image}"
                                             mid="${APP_PATH}/${requestScope.Goods.image}"
                                             big="${APP_PATH}/${requestScope.Goods.image}"></a>
                        </div>
                    </li>
                    <li>
                        <div class="tb-pic tb-s40">
                            <a href="#"><img src="${APP_PATH}/${requestScope.Goods.image}"
                                             mid="${APP_PATH}/${requestScope.Goods.image}"
                                             big="${APP_PATH}/${requestScope.Goods.image}"></a>
                        </div>
                    </li>
                    <li>
                        <div class="tb-pic tb-s40">
                            <a href="#"><img src="${APP_PATH}/${requestScope.Goods.image}"
                                             mid="${APP_PATH}/${requestScope.Goods.image}"
                                             big="${APP_PATH}/${requestScope.Goods.image}"></a>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
        <div class="clearfixRight">
            <!--规格属性-->
            <!--名称-->
            <div class="tb-detail-hd">
                <h1>
                    ${requestScope.Goods.goodsname}
                </h1>
            </div>
            <div class="tb-detail-list">
                <!--价格-->
                <div class="tb-detail-price">
                    <li class="price iteminfo_price">
                        <dt>促销价</dt>
                        <dd><em>¥</em><b class="sys_item_price">${requestScope.Goods.goodsprice}</b></dd>
                    </li>
                    <li class="price iteminfo_mktprice">
                        <dt>原价</dt>
                        <dd><em>¥</em><b class="sys_item_mktprice">${requestScope.Goods.goodsprice}</b></dd>
                    </li>
                    <div class="clear"></div>
                </div>

                <div class="clear"></div>
            </div>
            <div class="theme-options">
                <div class="cart-title number">数量</div>
                <dd>
                    <input id="min" class="am-btn am-btn-default" name="" type="button" value="-" />
                    <input id="text_box" name="" type="text" value="1" style="width:30px;" />
                    <input id="add" class="am-btn am-btn-default" name="" type="button" value="+" />
                    <span id="Stock" class="tb-hidden">库存<span class="stock">${requestScope.Goods.goodsnumber}</span>件</span>
                </dd>

            </div>
        </div>

        <div class="pay">
            <li>
                <div class="clearfix tb-btn tb-btn-buy theme-login"><a id="LikBuy" title="点此按钮到下一步确认购买信息" href="#">立即购买</a>
                </div>
            </li>
            <li>
                <div class="clearfix tb-btn tb-btn-basket theme-login"><a id="LikBasket" title="加入购物车" href="#"><i></i>加入购物车</a>
                </div>
            </li>
        </div>
    </div>

    <div class="clear"></div>

    <div class="clear"></div>
    <!-- introduce-->
    <div class="introduce">
        <div class="browse">
            <div class="mc"></div>
        </div>
        <div class="introduceMain">
            <div class="am-tabs" data-am-tabs>
                <ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
                    <li class="am-active">
                        <a href="#"> <span class="index-needs-dt-txt">宝贝详情</span></a>
                    </li>
                    <li>
                        <a href="#"> <span class="index-needs-dt-txt">全部评价</span></a>
                    </li>
                </ul>
                <div class="am-tabs-bd">
                    <div class="am-tab-panel am-fade am-in am-active">
                        <div class="J_Brand">
                            <div class="attr-list-hd tm-clear">
                                <h4>产品参数：</h4>
                            </div>
                            <div class="clear"></div>
                            <p>
                                ${requestScope.Goods.goodsname}
                            </p>
                            <div class="clear"></div>
                        </div>
                        <div class="details">
                            <div class="attr-list-hd after-market-hd">
                                <h4>商品细节</h4>
                            </div>
                            <div class="twlistNews"><img src="${APP_PATH}/${requestScope.Goods.image}"/> <img
                                    src="${APP_PATH}/${requestScope.Goods.image}"/> <img
                                    src="${APP_PATH}/${requestScope.Goods.image}"/> <img src="${APP_PATH}/${requestScope.Goods.image}"/> <img
                                    src="${APP_PATH}/${requestScope.Goods.image}"/>
                                <img src="${APP_PATH}/${requestScope.Goods.image}"/> <img src="${APP_PATH}/${requestScope.Goods.image}"/>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="am-tab-panel am-fade">
                        <div class="clear"></div>
                        <div class="clear"></div>
                        <ul class="am-comments-list am-comments-list-flip">
                            <li class="am-comment">
                                <!-- 评论容器 -->
                                <a href=""> <img class="am-comment-avatar" src="${APP_PATH}/images/hwbn40x40.jpg"/>
                                    <!-- 评论者头像 -->
                                </a>
                                <div class="am-comment-main">
                                    <!-- 评论内容容器 -->
                                    <header class="am-comment-hd">
                                        <!--<h3 class="am-comment-title">评论标题</h3>-->
                                        <div class="am-comment-meta">
                                            <!-- 评论元数据 --><a href="#link-to-user" class="am-comment-author">b***1
                                            (匿名)</a>
                                            <!-- 评论者 -->评论于
                                            <time datetime="">2015年11月02日 17:46</time>
                                        </div>
                                    </header>
                                    <div class="am-comment-bd">
                                        <div class="tb-rev-item " data-id="255776406962">
                                            <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
                                            </div>
                                            <div class="tb-r-act-bar"> 颜色分类：柠檬黄&nbsp;&nbsp;尺码：S</div>
                                        </div>
                                    </div>
                                    <!-- 评论内容 -->
                                </div>
                            </li>

                        </ul>
                        <div class="clear"></div>
                        <!--分页 -->
                        <div class="clear"></div>
                        <div class="tb-reviewsft">
                            <div class="tb-rate-alert type-attention">购买前请查看该商品的 <a href="#" target="_blank">购物保障</a>，明确您的售后保障权益。
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clear"></div>
            <div class="footer ">
                <div class="footer-hd ">
                    <p><a href="# ">心潮工作室</a> <b>|</b> <a href="# ">商城首页</a> <b>|</b> <a href="# ">支付宝</a> <b>|</b> <a
                            href="# ">物流</a></p>
                </div>
                <div class="footer-bd ">
                    <p><a href="# ">关于心潮</a> <a href="# ">合作伙伴</a> <a href="# ">联系我们</a> <a href="# ">网站地图</a> <em>©
                        2018-2038 SimpleChange.com 版权所有.</em></p>
                </div>
            </div>
        </div>
    </div>
</div>
<!--菜单 -->
<div class=tip>
    <div id="sidebar">
        <div id="wrap">
            <div id="prof" class="item">
                <a href="#"> <span class="setting"></span> </a>
                <div class="ibar_login_box status_login">
                    <div class="avatar_box">
                        <p class="avatar_imgbox"><img src="${APP_PATH}/images/no-img_mid_.jpg"/></p>
                        <ul class="user_info">
                            <li>用户名：sl1903</li>
                            <li>级&nbsp;别：普通会员</li>
                        </ul>
                    </div>
                    <div class="login_btnbox"><a href="#" class="login_order">我的订单</a> <a href="#"
                                                                                          class="login_favorite">我的收藏</a>
                    </div>
                    <i class="icon_arrow_white"></i></div>
            </div>
            <div id="shopCart" class="item">
                <a href="#"> <span class="message"></span> </a>
                <p> 购物车 </p>
                <p class="cart_num">0</p>
            </div>
            <div id="asset" class="item">
                <a href="#"> <span class="view"></span> </a>
                <div class="mp_tooltip"> 我的资产 <i class="icon_arrow_right_black"></i></div>
            </div>
            <div id="foot" class="item">
                <a href="#"> <span class="zuji"></span> </a>
                <div class="mp_tooltip"> 我的足迹 <i class="icon_arrow_right_black"></i></div>
            </div>
            <div id="broadcast" class="item">
                <a href="#"> <span class="chongzhi"><img src="${APP_PATH}/images/chongzhi.png"/></span> </a>
                <div class="mp_tooltip"> 我要充值 <i class="icon_arrow_right_black"></i></div>
            </div>
            <div class="quick_toggle">
                <li class="qtitem"><a href="#"><span class="kfzx"></span></a>
                    <div class="mp_tooltip">客服中心<i class="icon_arrow_right_black"></i></div>
                </li>
                <!--二维码 -->
                <li class="qtitem"><a href="#none"><span class="mpbtn_qrcode"></span></a>
                    <div class="mp_qrcode" style="display:none;"><img src="${APP_PATH}/images/weixin_code_145.png"/><i
                            class="icon_arrow_white"></i></div>
                </li>
                <li class="qtitem"><a href="#top" class="return_top"><span class="top"></span></a></li>
            </div>
            <!--回到顶部 -->
            <div id="quick_links_pop" class="quick_links_pop hide"></div>
        </div>
    </div>
    <div id="prof-content" class="nav-content">
        <div class="nav-con-close"><i class="am-icon-angle-right am-icon-fw"></i></div>
        <div> 我</div>
    </div>
    <div id="shopCart-content" class="nav-content">
        <div class="nav-con-close"><i class="am-icon-angle-right am-icon-fw"></i></div>
        <div> 购物车</div>
    </div>
    <div id="asset-content" class="nav-content">
        <div class="nav-con-close"><i class="am-icon-angle-right am-icon-fw"></i></div>
        <div> 资产</div>
        <div class="ia-head-list">
            <a href="#" target="_blank" class="pl">
                <div class="num">0</div>
                <div class="text">优惠券</div>
            </a>
            <a href="#" target="_blank" class="pl">
                <div class="num">0</div>
                <div class="text">红包</div>
            </a>
            <a href="#" target="_blank" class="pl money">
                <div class="num">￥0</div>
                <div class="text">余额</div>
            </a>
        </div>
    </div>
    <div id="foot-content" class="nav-content">
        <div class="nav-con-close"><i class="am-icon-angle-right am-icon-fw"></i></div>
        <div> 足迹</div>
    </div>
    <div id="brand-content" class="nav-content">
        <div class="nav-con-close"><i class="am-icon-angle-right am-icon-fw"></i></div>
        <div> 收藏</div>
    </div>
    <div id="broadcast-content" class="nav-content">
        <div class="nav-con-close"><i class="am-icon-angle-right am-icon-fw"></i></div>
        <div> 充值</div>
    </div>
</div>
</body>

</html>
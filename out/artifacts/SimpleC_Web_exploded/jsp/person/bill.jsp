<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <title>个人账单</title>
    <link href="${APP_PATH}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="${APP_PATH}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
    <link href="${APP_PATH}/css/personal.css" rel="stylesheet" type="text/css">
    <link href="${APP_PATH}/css/blstyle.css" rel="stylesheet" type="text/css">
    <script src="${APP_PATH}/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
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
                <div class="user-bill">
                    <!--标题 -->
                    <div class="am-cf am-padding">
                        <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">账单</strong> / <small>Electronic&nbsp;bill</small></div>
                    </div>
                    <hr/>
                    <div class="ebill-section">
                        <div class="ebill-title-section">
                            <h2 class="trade-title section-title">
                                交易
                                <span class="desc">（金额单位：元）</span>
                            </h2>
                            <div class=" ng-scope">
                                <div class="trade-circle-select  slidedown-"> <a href="javascript:void(0);" class="current-circle ng-binding">2015/11/01 - 2015/11/30</a> </div> <span class="title-tag"><i class="num ng-binding">12</i>月</span> </div>
                        </div>
                        <div class="module-income ng-scope">
                            <div class="income-slider ">
                                <div class="block-income block  fn-left">
                                    <h3 class="income-title block-title">
                                        支出
                                        <span class="num ng-binding">
                                              119.80
                                       </span>
                                        <span class="desc ng-binding">
                                           <a href="${APP_PATH}/toBillList">查看支出明细</a>
                                         </span>
                                    </h3>
                                    <div ng-class="shoppingChart" class="catatory-details  fn-hide shopping">
                                        <div class="catatory-chart fn-left fn-hide">
                                            <div class="title">类型</div>
                                            <ul> </ul>
                                        </div>
                                        <div class="catatory-detail fn-left">
                                            <div class="title ng-binding"> 购买商品 </div>
                                            <ul>
                                                <li class="ng-scope  delete-false">
                                                    <div class="  ng-scope">
                                                        <a href="#" class="text fn-left " title="呢子大衣"> <span class="emoji-span ng-binding">呢子大衣</span> <span class="amount fn-right ng-binding">349.00</span> </a>
                                                    </div>
                                                </li>
                                                <li class="ng-scope  delete-false">
                                                    <div class="  ng-scope">
                                                        <a href="#" class="text fn-left " title="金士顿羊年限量版16gU盘"> <span class="emoji-span ng-binding">金士顿羊年限量版16gU盘</span> <span class="amount fn-right ng-binding">39.00</span> </a>
                                                    </div>
                                                </li>
                                                <li class="ng-scope  delete-false">
                                                    <div class="  ng-scope">
                                                        <a href="#" class="text fn-left " title="呢子大衣"> <span class="emoji-span ng-binding">呢子大衣</span> <span class="amount fn-right ng-binding">349.00</span> </a>
                                                    </div>
                                                </li>
                                                <li class="ng-scope  delete-false">
                                                    <div class="  ng-scope">
                                                        <a href="#" class="text fn-left " title="金士顿羊年限量版16gU盘"> <span class="emoji-span ng-binding">金士顿羊年限量版16gU盘</span> <span class="amount fn-right ng-binding">39.00</span> </a>
                                                    </div>
                                                </li>
                                                <li class="ng-scope  delete-false">
                                                    <div class="  ng-scope">
                                                        <a href="#" class="text fn-left " title="呢子大衣"> <span class="emoji-span ng-binding">呢子大衣</span> <span class="amount fn-right ng-binding">349.00</span> </a>
                                                    </div>
                                                </li>
                                                <li class="ng-scope  delete-false">
                                                    <div class="  ng-scope">
                                                        <a href="#" class="text fn-left " title="羊毛毡底鞋垫"> <span class="emoji-span ng-binding">羊毛毡底鞋垫</span> <span class="amount fn-right ng-binding">9.90</span> </a>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="block-expense block  fn-left">
                                    <div class="slide-button right"></div>
                                </div>
                                <div class="clear"></div>
                                <!--收入-->
                                <h3 class="expense income-title block-title">
                                    收入
                                    <span class="num ng-binding">
                                              0.00
                                       </span>
                                    <span class="desc ng-binding">
                                           <a href="${APP_PATH}/toBillList">查看收入明细</a>
                                    </span>
                                </h3> </div>
                            <!--消费走势-->
                            <div class="module-consumeTrend inner-module">
                                <h3 class="module-title">消费走势</h3>
                                <div id="consumeTrend-chart" class="consumeTrend-chart"> </div>
                            </div>
                            <!--银行卡使用情况-->
                            <div class="module-card inner-module">
                                <h3 class="module-title">银行卡使用情况</h3>
                                <div class="card-chart valid">
                                    <div class="cards-carousel">
                                        <div class="mask">
                                            <div class="bac fn-left"></div>
                                            <div class="bank ng-binding" style="background-image: url(${APP_PATH}/images/combo.png);">中国农业银行</div>
                                            <div class="details"> <a>查看详情</a> </div>
                                        </div>
                                    </div>
                                    <div class="cards-details">
                                        <div class="bank-name">
                                            <div class="name fn-left" style="background-image: url(${APP_PATH}/images/combo.png);"></div> <span class="close fn-right"><a>X</a></span> </div>
                                        <div class="bank-detail">
                                            <div class="totalin fn-left"> <span class="fn-left">流入</span> <span class="amount fn-right">0.00</span> </div>
                                            <div class="totalout fn-left"> <span class="fn-left">流出</span> <span class="amount fn-right">0.00</span> </div>
                                            <div class="expand fn-left"> <span class="fn-left">支出</span> <span class="amount fn-right">0.00</span> </div>
                                            <div class="withdraw fn-left"> <span class="fn-left">提现</span> <span class="amount fn-right">
							                                0.00
                            						</span> </div>
                                            <div class="recharge fn-left"> <span class="fn-left">充值</span> <span class="amount fn-right">
                                                            0.00
                            						</span> </div>
                                            <div class="refund fn-left"> <span class="fn-left">银行卡退款</span> <span class="amount fn-right ">0.00</span> </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <script>
                                $(document).ready(function (ev) {
                                    $('.cards-carousel .details').on('click', function (ev) {
                                        $('.cards-details').css("display", "block");
                                        $('.cards-carousel').css("display", "none");
                                    });
                                    $('.cards-details .close').on('click', function (ev) {
                                        $('.cards-details').css("display", "none");
                                        $('.cards-carousel').css("display", "block");
                                    });
                                });
                            </script>
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
                        <li><a href="${APP_PATH}/toOrderItem">订单管理</a></li>
                    </ul>
                    <ul>
                        <li><a href="${APP_PATH}/toPublish">发布商品</a></li>
                    </ul>
                </li>
                <li class="person" style="font-size: 15px"> 我的资产
                    <hr/>
                    <ul>
                        <li class="active"> <a href="${APP_PATH}/toBill">账单明细</a></li>
                    </ul>
                </li>
            </ul>
        </aside>
    </div>
</body>

</html>
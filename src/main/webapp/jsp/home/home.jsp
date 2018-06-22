<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <title>首页</title>
    <link href="${APP_PATH}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"/>
    <link href="${APP_PATH}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"/>
    <link href="${APP_PATH}/basic/css/demo.css" rel="stylesheet"/>
    <link href="${APP_PATH}/css/hmstyle.css" rel="stylesheet"/>
    <link href="${APP_PATH}/css/skin.css" rel="stylesheet"/>
    <script src="${APP_PATH}/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="${APP_PATH}/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
</head>

<body>
<div class="hmtop">
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
                                                                                              class="h">0</strong></a>
                </div>
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
<div class="banner">
    <!--轮播 -->
    <div class="am-slider am-slider-default scoll" data-am-flexslider id="demo-slider-0">
        <ul class="am-slides">
            <li class="banner1">
                <a href="introduction.jsp"><img src="${APP_PATH}/images/ad1.jpg"/></a>
            </li>
            <li class="banner2">
                <a><img src="${APP_PATH}/images/ad2.jpg"/></a>
            </li>
            <li class="banner3">
                <a><img src="${APP_PATH}/images/ad3.jpg"/></a>
            </li>
            <li class="banner4">
                <a><img src="${APP_PATH}/images/ad4.jpg"/></a>
            </li>
        </ul>
    </div>
    <div class="clear"></div>
</div>
<div class="shopNav">
    <div class="slideall">
        <div class="long-title"><span class="all-goods">全部分类</span></div>
        <div class="nav-cont">
            <ul>
                <li class="index" style="padding-left: 690px">
                    <a href="${APP_PATH}/toPublish" style="font-size: 20px;background:#000000;color: #f3f6ff">发布商品</a>
                </li>
            </ul>
            <div class="nav-extra"><i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的潮积分 <i
                    class="am-icon-angle-right" style="padding-left: 10px;"></i></div>
        </div>
        <!--侧边导航 -->
        <div id="nav" class="navfull">
            <div class="area clearfix">
                <div class="category-content" id="guide_2">
                    <div class="category">
                        <ul class="category-list" id="js_climit_li">
                            <li class="appliance js_toggle relative first">
                                <div class="category-info">
                                    <h3 class="category-name b-category-name"><a class="ml-22" title="首页">首页</a></h3>
                                </div>
                                <b class="arrow"></b></li>
                            <li class="appliance js_toggle relative first">
                                <div class="category-info">
                                    <h3 class="category-name b-category-name">
                                        <a href="${APP_PATH}/toClassify/家用电器" class="ml-22" title="家用电器">家用电器</a>
                                    </h3>
                                </div>
                                <b class="arrow"></b></li>
                            <li class="appliance js_toggle relative">
                                <div class="category-info">
                                    <h3 class="category-name b-category-name">
                                        <a href="${APP_PATH}/toClassify/手机数码" class="ml-22" title="手机数码">手机数码</a>
                                    </h3>
                                </div>
                                <b class="arrow"></b></li>
                            <li class="appliance js_toggle relative">
                                <div class="category-info">
                                    <h3 class="category-name b-category-name">
                                        <a href="${APP_PATH}/toClassify/电脑办公" class="ml-22" title="电脑办公">电脑办公</a>
                                    </h3>
                                </div>
                                <b class="arrow"></b></li>
                            <li class="appliance js_toggle relative">
                                <div class="category-info">
                                    <h3 class="category-name b-category-name">
                                        <a href="${APP_PATH}/toClassify/服装" class="ml-22" title="服装">服装</a></h3>
                                </div>
                                <b class="arrow"></b></li>
                            <li class="appliance js_toggle relative">
                                <div class="category-info">
                                    <h3 class="category-name b-category-name">
                                        <a href="${APP_PATH}/toClassify/运动" class="ml-22" title="运动">运动</a></h3>
                                </div>
                                <b class="arrow"></b></li>
                            <li class="appliance js_toggle relative">
                                <div class="category-info">
                                    <h3 class="category-name b-category-name">
                                        <a href="${APP_PATH}/toClassify/食品" class="ml-22" title="食品">食品</a></h3>
                                </div>
                                <b class="arrow"></b></li>
                            <li class="appliance js_toggle relative">
                                <div class="category-info">
                                    <h3 class="category-name b-category-name">
                                        <a href="${APP_PATH}/toClassify/美妆" class="ml-22" title="美妆">美妆</a></h3>
                                </div>
                                <b class="arrow"></b></li>
                            <li class="appliance js_toggle relative">
                                <div class="category-info">
                                    <h3 class="category-name b-category-name">
                                        <a href="${APP_PATH}/toClassify/图书" class="ml-22" title="图书">图书</a></h3>
                                </div>
                                <b class="arrow"></b></li>
                            <li class="appliance js_toggle relative">
                                <div class="category-info">
                                    <h3 class="category-name b-category-name">
                                        <a href="${APP_PATH}/toClassify/其他" class="ml-22" title="其他">其他</a></h3>
                                </div>
                                <b class="arrow"></b></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!--轮播-->
        <script type="text/javascript">
            function fun1() {
                $('.am-slider').flexslider();
            };
            $(document).ready(function () {
                $("li").hover(function () {
                    $(".category-content .category-list li.first .menu-in").css("display", "none");
                    $(".category-content .category-list li.first").removeClass("hover");
                    $(this).addClass("hover");
                    $(this).children("div.menu-in").css("display", "block")
                }, function () {
                    $(this).removeClass("hover")
                    $(this).children("div.menu-in").css("display", "none")
                });
            })

        </script>
        <!--走马灯 -->
        <div class="clear"></div>
    </div>
    <script type="text/javascript">
        if ($(window).width() &lt; 640) {
            function autoScroll(obj) {
                $(obj).find("ul").animate({
                    marginTop: "-39px"
                }, 500, function () {
                    $(this).css({
                        marginTop: "0px"
                    }).find("li:first").appendTo(this);
                })
            }

            $(function () {
                setInterval('autoScroll(".demo")', 3000);
            })
        }

    </script>
</div>
<div class="shopMainbg">
    <div class="shopMain" id="shopmain">
        <!--今日推荐 -->
        <div class="am-g am-g-fixed recommendation">
            <div class="clock am-u-sm-3">
                <p>今日
                    <br>推荐</p>
            </div>
            <div class="am-u-sm-4 am-u-lg-3 ">
                <div class="info ">
                    <h3>真的有鱼</h3>
                    <h4>开年福利篇</h4>
                </div>
                <div class="recommendationMain one">
                    <a href="introduction.jsp"><img src="${APP_PATH}/myimages/book/10.jpg"/>
                    </a>
                </div>
            </div>
            <div class="am-u-sm-4 am-u-lg-3 ">
                <div class="info ">
                    <h3>囤货过冬</h3>
                    <h4>让爱早回家</h4>
                </div>
                <div class="recommendationMain two"><img
                        src="${APP_PATH}/myimages/snack/烘烤薯片.jpg"/>
                </div>
            </div>
            <div class="am-u-sm-4 am-u-lg-3 ">
                <div class="info ">
                    <h3>浪漫情人节</h3>
                    <h4>甜甜蜜蜜</h4>
                </div>
                <div class="recommendationMain three"><img src="${APP_PATH}/myimages/household/1.jpg"/>
                </div>
            </div>
        </div>
        <div class="clear "></div>
        <!--热门活动 -->
        <div class="clear "></div>
        <div id="f1">
            <!--甜点-->
            <div class="am-container ">
                <div class="shopTitle ">
                    <h4>家用电器</h4>
                    <h3>每一个家用电器都有一个故事</h3> <span class="more ">
                            <a href="# ">更多家用电器<i class="am-icon-angle-right" style="padding-left:10px ;"></i></a>
                        </span></div>
            </div>
            <div class="am-g am-g-fixed floodFour">
                <div class="am-u-sm-5 am-u-md-4 text-one list "><img src="${APP_PATH}/myimages/hd.png"
                                                                     style="padding-bottom: 120px"/>
                    <div class="triangle-topright"></div>
                </div>
                <div class="am-u-sm-7 am-u-md-4 text-two sug">
                    <div class="outer-con ">
                        <div class="title "> 三星（SAMSUNG）UA65MUC30SJXXZ</div>
                        <div class="sub-title "> ¥5988</div>
                    </div>
                    <a href="# "><img src="${APP_PATH}/myimages/household/1.jpg"/></a>
                </div>
                <div class="am-u-sm-7 am-u-md-4 text-two">
                    <div class="outer-con ">
                        <div class="title "> TCL 55V1 55英寸32核超高清 4K曲面HDR</div>
                        <div class="sub-title "> ¥2587</div>
                    </div>
                    <a href="# "><img src="${APP_PATH}/myimages/household/2.jpg"/></a>
                </div>
                <div class="am-u-sm-3 am-u-md-2 text-three big">
                    <div class="outer-con ">
                        <div class="title "> 晶弘（KINGHOME）410升智能变频 对开门冰箱</div>
                        <div class="sub-title "> ¥2749</div>
                    </div>
                    <a href="# "><img src="${APP_PATH}/myimages/household/3.jpg"/></a>
                </div>
                <div class="am-u-sm-3 am-u-md-2 text-three sug">
                    <div class="outer-con ">
                        <div class="title "> 海尔（Haier）风冷无霜对开门冰箱</div>
                        <div class="sub-title "> ¥3299</div>
                    </div>
                    <a href="# "><img src="${APP_PATH}/myimages/household/4.jpg"/></a>
                </div>
                <div class="am-u-sm-3 am-u-md-2 text-three ">
                    <div class="outer-con ">
                        <div class="title "> 格力（GREE）正1.5匹 变频 品圆 冷暖 壁挂式空调</div>
                        <div class="sub-title "> ¥3299</div>
                    </div>
                    <a href="# "><img src="${APP_PATH}/myimages/household/5.jpg"/></a>
                </div>
                <div class="am-u-sm-3 am-u-md-2 text-three last big ">
                    <div class="outer-con ">
                        <div class="title "> 长虹(CHANGHONG)CKR-D13 电热水龙头</div>
                        <div class="sub-title "> ¥189</div>
                    </div>
                    <a href="# "><img src="${APP_PATH}/myimages/household/6.jpg"/></a>
                </div>
            </div>
            <div class="clear "></div>
        </div>
        <div id="f2">
            <!--坚果-->
            <div class="am-container ">
                <div class="shopTitle ">
                    <h4>手机数码</h4>
                    <h3>手机数码，回味无穷</h3> <span class="more ">
                    <a href="# ">更多手机<i class="am-icon-angle-right" style="padding-left:10px ;"></i></a>
                        </span></div>
            </div>
            <div class="am-g am-g-fixed floodThree ">
                <div class="am-u-sm-4 text-four list"><img src="${APP_PATH}/myimages/phone.png"
                                                           style="padding-bottom: 100px"/>
                    <div class="triangle-topright"></div>
                </div>
                <div class="am-u-sm-4 text-four">
                    <a href="# "> <img src="${APP_PATH}/myimages/phone/1/1.png" style="height: 80%;width: 45%"/>
                        <div class="outer-con ">
                            <div class="title "> iPhone X</div>
                            <div class="sub-title "> ¥8299</div>
                        </div>
                    </a>
                </div>
                <div class="am-u-sm-4 text-four sug">
                    <a href="# "> <img src="${APP_PATH}/myimages/phone/2/2.png"/>
                        <div class="outer-con ">
                            <div class="title "> OPPO R15</div>
                            <div class="sub-title "> ¥2699</div>
                        </div>
                    </a>
                </div>
                <div class="am-u-sm-6 am-u-md-3 text-five big ">
                    <a href="# "> <img src="${APP_PATH}/myimages/phone/3/3.jpg"/>
                        <div class="outer-con ">
                            <div class="title "> vivo X21</div>
                            <div class="sub-title "> ¥3598</div>
                        </div>
                    </a>
                </div>
                <div class="am-u-sm-6 am-u-md-3 text-five ">
                    <a href="# "> <img src="${APP_PATH}/myimages/phone/4/4.jpg"/>
                        <div class="outer-con ">
                            <div class="title "> 华为（HUAWEI）Emily-AL00B</div>
                            <div class="sub-title "> ¥3788</div>
                        </div>
                    </a>
                </div>
                <div class="am-u-sm-6 am-u-md-3 text-five sug">
                    <a href="# "> <img src="${APP_PATH}/myimages/phone/5/5.jpg"/>
                        <div class="outer-con ">
                            <div class="title "> 锤子（smartisan）坚果R1</div>
                            <div class="sub-title "> ¥3499</div>
                        </div>
                    </a>
                </div>
                <div class="am-u-sm-6 am-u-md-3 text-five big">
                    <a href="# "> <img src="${APP_PATH}/myimages/phone/6/6.jpg"/>
                        <div class="outer-con ">
                            <div class="title "> 魅族（MEIZU）15</div>
                            <div class="sub-title "> ¥2499</div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="clear "></div>
        </div>
        <div id="f3">
            <!--甜点-->
            <div class="am-container ">
                <div class="shopTitle ">
                    <h4>电脑办公</h4>
                    <h3>每一个电脑都有一个故事</h3> <span class="more ">
                    <a href="# ">更多美味<i class="am-icon-angle-right" style="padding-left:10px ;"></i></a>
                        </span></div>
            </div>
            <div class="am-g am-g-fixed floodFour">
                <div class="am-u-sm-5 am-u-md-4 text-one list "><img src="${APP_PATH}/myimages/computer.png"
                                                                     style="padding-bottom: 100px"/>
                    <div class="triangle-topright"></div>
                </div>
                <div class="am-u-sm-7 am-u-md-4 text-two sug">
                    <div class="outer-con ">
                        <div class="title "> 联想拯救者 刃9000</div>
                        <div class="sub-title "> ¥9774</div>
                        </i>
                    </div>
                    <a href="# "><img src="${APP_PATH}/myimages/computer/1.jpg"/></a>
                </div>
                <div class="am-u-sm-7 am-u-md-4 text-two">
                    <div class="outer-con ">
                        <div class="title "> 华硕飞行堡垒S M80</div>
                        <div class="sub-title "> ¥6134</div>
                    </div>
                    <a href="# "><img src="${APP_PATH}/myimages/computer/2.jpg"/></a>
                </div>
                <div class="am-u-sm-3 am-u-md-2 text-three big">
                    <div class="outer-con ">
                        <div class="title "> 戴尔Vostro 成就 3650系列 微塔式机</div>
                        <div class="sub-title "> ¥5926</div>
                    </div>
                    <a href="# "><img src="${APP_PATH}/myimages/computer/3.jpg"/></a>
                </div>
                <div class="am-u-sm-3 am-u-md-2 text-three sug">
                    <div class="outer-con ">
                        <div class="title "> 惠普光影精灵II 690-058CN</div>
                        <div class="sub-title "> ¥6654</div>
                    </div>
                    <a href="# "><img src="${APP_PATH}/myimages/computer/4.jpg"/></a>
                </div>
                <div class="am-u-sm-3 am-u-md-2 text-three ">
                    <div class="outer-con ">
                        <div class="title "> Alienware Area-51(ALWA51D-7958S)</div>
                        <div class="sub-title "> ¥6.55万</div>
                    </div>
                    <a href="# "><img src="${APP_PATH}/myimages/computer/5.jpg"/></a>
                </div>
                <div class="am-u-sm-3 am-u-md-2 text-three last big ">
                    <div class="outer-con ">
                        <div class="title "> 联想ThinkCentre M910t</div>
                        <div class="sub-title "> ¥5198</div>
                    </div>
                    <a href="# "><img src="${APP_PATH}/myimages/computer/6.jpg"/></a>
                </div>
            </div>
            <div class="clear "></div>
        </div>
        <div id="f4">
            <!--坚果-->
            <div class="am-container ">
                <div class="shopTitle ">
                    <h4>服装</h4>
                    <h3>服装，回味无穷</h3> <span class="more ">
                    <a href="# ">更多美味<i class="am-icon-angle-right" style="padding-left:10px ;"></i></a>
                        </span></div>
            </div>
            <div class="am-g am-g-fixed floodThree ">
                <div class="am-u-sm-4 text-four list"><img src="${APP_PATH}/myimages/clothes.png"
                                                           style="padding-bottom: 100px">
                    <div class="triangle-topright"></div>
                </div>
                <div class="am-u-sm-4 text-four">
                    <a href="# "> <img src="${APP_PATH}/images/6.jpg"/>
                        <div class="outer-con ">
                            <div class="title "> 雪之恋和风大福</div>
                            <div class="sub-title "> ¥13.8</div>
                            <i class="am-icon-shopping-basket am-icon-md  seprate"></i></div>
                    </a>
                </div>
                <div class="am-u-sm-4 text-four sug">
                    <a href="# "> <img src="${APP_PATH}/images/7.jpg"/>
                        <div class="outer-con ">
                            <div class="title "> 雪之恋和风大福</div>
                            <div class="sub-title "> ¥13.8</div>
                            <i class="am-icon-shopping-basket am-icon-md  seprate"></i></div>
                    </a>
                </div>
                <div class="am-u-sm-6 am-u-md-3 text-five big ">
                    <a href="# "> <img src="${APP_PATH}/images/10.jpg"/>
                        <div class="outer-con ">
                            <div class="title "> 雪之恋和风大福</div>
                            <div class="sub-title "> ¥13.8</div>
                            <i class="am-icon-shopping-basket am-icon-md  seprate"></i></div>
                    </a>
                </div>
                <div class="am-u-sm-6 am-u-md-3 text-five ">
                    <a href="# "> <img src="${APP_PATH}/images/8.jpg"/>
                        <div class="outer-con ">
                            <div class="title "> 雪之恋和风大福</div>
                            <div class="sub-title "> ¥13.8</div>
                            <i class="am-icon-shopping-basket am-icon-md  seprate"></i></div>
                    </a>
                </div>
                <div class="am-u-sm-6 am-u-md-3 text-five sug">
                    <a href="# "> <img src="${APP_PATH}/images/9.jpg"/>
                        <div class="outer-con ">
                            <div class="title "> 雪之恋和风大福</div>
                            <div class="sub-title "> ¥13.8</div>
                            <i class="am-icon-shopping-basket am-icon-md  seprate"></i></div>
                    </a>
                </div>
                <div class="am-u-sm-6 am-u-md-3 text-five big">
                    <a href="# "> <img src="${APP_PATH}/images/10.jpg"/>
                        <div class="outer-con ">
                            <div class="title "> 雪之恋和风大福</div>
                            <div class="sub-title "> ¥13.8</div>
                            <i class="am-icon-shopping-basket am-icon-md  seprate"></i></div>
                    </a>
                </div>
            </div>
            <div class="clear "></div>
        </div>
        <div id="f5">
            <!--甜点-->
            <div class="am-container ">
                <div class="shopTitle ">
                    <h4>运动</h4>
                    <h3>运动</h3> <span class="more ">
                    <a href="# ">更多<i class="am-icon-angle-right" style="padding-left:10px ;"></i></a>
                        </span></div>
            </div>
            <div class="am-g am-g-fixed floodFour">
                <div class="am-u-sm-5 am-u-md-4 text-one list "><img src="${APP_PATH}/myimages/sport.png"
                                                                     style="padding-bottom: 100px">
                    <div class="triangle-topright"></div>
                </div>
                <div class="am-u-sm-7 am-u-md-4 text-two sug">
                    <div class="outer-con ">
                        <div class="title "> Jordan 官方 AIR JORDAN XXXII LOW PF 男子篮球鞋 AH3347</div>
                        <div class="sub-title "> ¥1399.00</div>
                    </div>
                    <a href="# "><img src="${APP_PATH}/myimages/sports/1/1.jpg" style="height: 50%;width: 50%"/></a>
                </div>
                <div class="am-u-sm-7 am-u-md-4 text-two">
                    <div class="outer-con ">
                        <div class="title "> 尤尼克斯羽毛球拍</div>
                        <div class="sub-title "> ¥289</div>
                    </div>
                    <a href="# "><img src="${APP_PATH}/myimages/sports/2.jpg" style="height: 70%;width: 50%"/></a>
                </div>
                <div class="am-u-sm-3 am-u-md-2 text-three big">
                    <div class="outer-con ">
                        <div class="title "> 阿迪达斯adidas FIFA 世界杯 Glider 足球 CE8096</div>
                        <div class="sub-title "> ¥199</div>
                    </div>
                    <a href="# "><img src="${APP_PATH}/myimages/sports/3.jpg" style="height: 50%;width: 10%"/></a>
                </div>
                <div class="am-u-sm-3 am-u-md-2 text-three sug">
                    <div class="outer-con ">
                        <div class="title "> Speedo/速比涛 专业训练 游泳眼镜</div>
                        <div class="sub-title "> ¥199</div>
                    </div>
                    <a href="# "><img src="${APP_PATH}/myimages/sports/4.jpg"/></a>
                </div>
                <div class="am-u-sm-3 am-u-md-2 text-three ">
                    <div class="outer-con ">
                        <div class="title "> 哑铃男士健身家用20/30公斤特价亚玲</div>
                        <div class="sub-title "> ¥82</div>
                    </div>
                    <a href="# "><img src="${APP_PATH}/myimages/sports/5.jpg" style="height: 60%;width: 30%"/></a>
                </div>
                <div class="am-u-sm-3 am-u-md-2 text-three last big ">
                    <div class="outer-con ">
                        <div class="title "> 李宁风衣男士2018新款</div>
                        <div class="sub-title "> ¥179</div>
                    </div>
                    <a href="# "><img src="${APP_PATH}/myimages/sports/6.jpg" style="height: 50%;width: 40%"/></a>
                </div>
            </div>
            <div class="clear "></div>
        </div>
        <div id="f6">
            <!--坚果-->
            <div class="am-container ">
                <div class="shopTitle ">
                    <h4>食品</h4>
                    <h3>酥酥脆脆，回味无穷</h3> <span class="more ">
                    <a href="# ">更多美味<i class="am-icon-angle-right" style="padding-left:10px ;"></i></a>
                        </span></div>
            </div>
            <div class="am-g am-g-fixed floodThree ">
                <div class="am-u-sm-4 text-four list"><img src="${APP_PATH}/myimages/snack.png"
                                                           style="padding-bottom: 100px">
                    <div class="triangle-topright"></div>
                </div>
                <div class="am-u-sm-4 text-four">
                    <a href="# "> <img src="${APP_PATH}/myimages/snack/卤蛋.jpg"/>
                        <div class="outer-con ">
                            <div class="title "> 香卤铁蛋</div>
                            <div class="sub-title "> ¥16.9</div>
                        </div>
                    </a>
                </div>
                <div class="am-u-sm-4 text-four sug">
                    <a href="# "> <img
                            src="${APP_PATH}/myimages/snack/大刀肉辣条.jpg"/>
                        <div class="outer-con ">
                            <div class="title "> 大刀肉辣条</div>
                            <div class="sub-title "> ¥15.9</div>
                        </div>
                    </a>
                </div>
                <div class="am-u-sm-6 am-u-md-3 text-five big ">
                    <a href="# "> <img src="${APP_PATH}/myimages/snack/小土豆.jpg"/>
                        <div class="outer-con ">
                            <div class="title "> 小土豆</div>
                            <div class="sub-title "> ¥15.9</div>
                        </div>
                    </a>
                </div>
                <div class="am-u-sm-6 am-u-md-3 text-five ">
                    <a href="# "> <img src="${APP_PATH}/myimages/snack/山楂糕.jpg"/>
                        <div class="outer-con ">
                            <div class="title "> 山楂糕</div>
                            <div class="sub-title "> ¥9.9</div>
                        </div>
                    </a>
                </div>
                <div class="am-u-sm-6 am-u-md-3 text-five sug">
                    <a href="# "> <img src="${APP_PATH}/myimages/snack/果冻.jpg"/>
                        <div class="outer-con ">
                            <div class="title "> 椰果布丁果冻</div>
                            <div class="sub-title "> ¥20.9</div>
                        </div>
                    </a>
                </div>
                <div class="am-u-sm-6 am-u-md-3 text-five big">
                    <a href="# "> <img src="${APP_PATH}/myimages/snack/棒棒糖.jpg"/>
                        <div class="outer-con ">
                            <div class="title "> 棒棒糖</div>
                            <div class="sub-title "> ¥11.9</div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="clear "></div>
        </div>
        <div id="f7">
            <!--甜点-->
            <div class="am-container ">
                <div class="shopTitle ">
                    <h4>美妆</h4>
                    <h3>美妆</h3> <span class="more ">
                    <a href="# ">更多美味<i class="am-icon-angle-right" style="padding-left:10px ;"></i></a>
                        </span></div>
            </div>
            <div class="am-g am-g-fixed floodFour">
                <div class="am-u-sm-5 am-u-md-4 text-one list "><img src="${APP_PATH}/myimages/beauty.png"
                                                                     style="padding-bottom: 100px">
                    <div class="triangle-topright"></div>
                </div>
                <div class="am-u-sm-7 am-u-md-4 text-two sug">
                    <div class="outer-con ">
                        <div class="title "> 一叶子面膜</div>
                        <div class="sub-title "> ¥99.00</div>
                    </div>
                    <a href="# "><img
                            src="${APP_PATH}/myimages/beauty/1.一叶子面膜.jpg"/></a>
                </div>
                <div class="am-u-sm-7 am-u-md-4 text-two">
                    <div class="outer-con ">
                        <div class="title "> 气垫 Dior/迪奥2018限量版</div>
                        <div class="sub-title "> ¥355.00</div>
                    </div>
                    <a href="# "><img
                            src="${APP_PATH}/myimages/beauty/2.Dior气垫粉底液.jpg"/></a>
                </div>
                <div class="am-u-sm-3 am-u-md-2 text-three big">
                    <div class="outer-con ">
                        <div class="title "> 兰芝气垫bb霜粉凝霜</div>
                        <div class="sub-title "> ¥175.00</div>
                    </div>
                    <a href="# "><img src="${APP_PATH}/myimages/beauty/3.兰芝气垫.jpg"/></a>
                </div>
                <div class="am-u-sm-3 am-u-md-2 text-three sug">
                    <div class="outer-con ">
                        <div class="title "> 悦诗风吟散粉</div>
                        <div class="sub-title "> ¥45.00</div>
                    </div>
                    <a href="# "><img src="${APP_PATH}/myimages/beauty/4.悦诗风吟.jpg"/></a>
                </div>
                <div class="am-u-sm-3 am-u-md-2 text-three ">
                    <div class="outer-con ">
                        <div class="title "> 百雀羚爽肤水</div>
                        <div class="sub-title "> ¥48.00</div>
                    </div>
                    <a href="# "><img
                            src="${APP_PATH}/myimages/beauty/5.百雀羚爽肤水.jpg"/></a>
                </div>
                <div class="am-u-sm-3 am-u-md-2 text-three last big ">
                    <div class="outer-con ">
                        <div class="title "> 韩束面霜</div>
                        <div class="sub-title "> ¥49.90</div>
                    </div>
                    <a href="# "><img src="${APP_PATH}/myimages/beauty/6.韩束面霜.jpg"/></a>
                </div>
            </div>
            <div class="clear "></div>
        </div>
        <div id="f8">
            <!--坚果-->
            <div class="am-container ">
                <div class="shopTitle ">
                    <h4>图书</h4>
                    <h3>知识就是力量</h3> <span class="more ">
                    <a href="# ">更多美味<i class="am-icon-angle-right" style="padding-left:10px ;"></i></a>
                        </span></div>
            </div>
            <div class="am-g am-g-fixed floodThree ">
                <div class="am-u-sm-4 text-four list"><img src="${APP_PATH}/myimages/book.png"
                                                           style="padding-bottom: 100px">
                    <div class="triangle-topright"></div>
                </div>
                <div class="am-u-sm-4 text-four">
                    <a href="# "> <img src="${APP_PATH}/myimages/book/1.jpg"/>
                        <div class="outer-con ">
                            <div class="title "> 那不勒斯的萤火</div>
                            <div class="sub-title "> ¥33.20</div>
                        </div>
                    </a>
                </div>
                <div class="am-u-sm-4 text-four sug">
                    <a href="# "> <img src="${APP_PATH}/myimages/book/2.jpg"/>
                        <div class="outer-con ">
                            <div class="title "> 深入理解Java虚拟机：JVM高级特性与最佳实践（第2版）</div>
                            <div class="sub-title "> ¥58.80</div>
                        </div>
                    </a>
                </div>
                <div class="am-u-sm-6 am-u-md-3 text-five big ">
                    <a href="# "> <img src="${APP_PATH}/myimages/book/3.jpg"/>
                        <div class="outer-con ">
                            <div class="title "> 爱的流放地</div>
                            <div class="sub-title "> ¥40.80</div>
                        </div>
                    </a>
                </div>
                <div class="am-u-sm-6 am-u-md-3 text-five ">
                    <a href="# "> <img src="${APP_PATH}/myimages/book/4.jpg"/>
                        <div class="outer-con ">
                            <div class="title "> 本杰明·富兰克林自传 （完整版）</div>
                            <div class="sub-title "> ¥76.60</div>
                        </div>
                    </a>
                </div>
                <div class="am-u-sm-6 am-u-md-3 text-five sug">
                    <a href="# "> <img src="${APP_PATH}/myimages/book/5.jpg"/>
                        <div class="outer-con ">
                            <div class="title "> 一瓣河川</div>
                            <div class="sub-title "> ¥45.90</div>
                        </div>
                    </a>
                </div>
                <div class="am-u-sm-6 am-u-md-3 text-five big">
                    <a href="# "> <img src="${APP_PATH}/myimages/book/6.jpg"/>
                        <div class="outer-con ">
                            <div class="title "> Python网络爬虫从入门到实践</div>
                            <div class="sub-title "> ¥38.60</div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="clear "></div>
        </div>
        <div class="footer ">
            <div class="footer-hd ">
                <p><a href="# ">心潮工作室</a> <b>|</b> <a href="${APP_PATH}/toHome">商城首页</a> <b>|</b> <a href="# ">支付宝</a>
                    <b>|</b> <a
                            href="# ">物流</a></p>
            </div>
            <div class="footer-bd ">
                <p><a href="# ">关于心潮</a> <a href="# ">合作伙伴</a> <a href="# ">联系我们</a> <a href="# ">网站地图</a> <em>©
                    2018-2038 SimpleChange.com 版权所有.</em></p>
            </div>
        </div>
    </div>
</div>
<!--引导 -->
<div class="navCir">
    <li class="active"><a href="${APP_PATH}/toHome"><i class="am-icon-home "></i>首页</a></li>
    <li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
    <li><a href="shopcart.jsp"><i class="am-icon-shopping-basket"></i>购物车</a></li>
    <li><a href="${APP_PATH}/person/index.html"><i class="am-icon-user"></i>我的</a></li>
</div>
<!--菜单 -->
<div class=tip>
    <div id="sidebar">
        <div id="wrap">
            <div id="prof" class="item ">
                <a href="# "> <span class="setting "></span> </a>
                <div class="ibar_login_box status_login ">
                    <div class="avatar_box ">
                        <p class="avatar_imgbox "><img src="${APP_PATH}/images/no-img_mid_.jpg "/></p>
                        <ul class="user_info ">
                            <li>用户名sl1903</li>
                            <li>级&nbsp;别普通会员</li>
                        </ul>
                    </div>
                    <div class="login_btnbox "><a href="# " class="login_order ">我的订单</a> <a href="# "
                                                                                             class="login_favorite ">我的收藏</a>
                    </div>
                    <i class="icon_arrow_white "></i></div>
            </div>
            <div id="shopCart " class="item ">
                <a href="# "> <span class="message "></span> </a>
                <p> 购物车 </p>
                <p class="cart_num ">0</p>
            </div>
            <div id="asset " class="item ">
                <a href="# "> <span class="view "></span> </a>
                <div class="mp_tooltip "> 我的资产 <i class="icon_arrow_right_black "></i></div>
            </div>
            <div id="foot " class="item ">
                <a href="# "> <span class="zuji "></span> </a>
                <div class="mp_tooltip "> 我的足迹 <i class="icon_arrow_right_black "></i></div>
            </div>
            <div id="broadcast " class="item ">
                <a href="# "> <span class="chongzhi "><img src="${APP_PATH}/images/chongzhi.png "/></span> </a>
                <div class="mp_tooltip "> 我要充值 <i class="icon_arrow_right_black "></i></div>
            </div>
            <div class="quick_toggle ">
                <li class="qtitem "><a href="# "><span class="kfzx "></span></a>
                    <div class="mp_tooltip ">客服中心<i class="icon_arrow_right_black "></i></div>
                </li>
                <!--二维码 -->
                <li class="qtitem "><a href="#none "><span class="mpbtn_qrcode "></span></a>
                    <div class="mp_qrcode " style="display:none; "><img
                            src="${APP_PATH}/images/weixin_code_145.png "/><i
                            class="icon_arrow_white "></i></div>
                </li>
                <li class="qtitem "><a href="#top " class="return_top "><span class="top "></span></a></li>
            </div>
            <!--回到顶部 -->
            <div id="quick_links_pop " class="quick_links_pop hide "></div>
        </div>
    </div>
    <div id="prof-content " class="nav-content ">
        <div class="nav-con-close "><i class="am-icon-angle-right am-icon-fw "></i></div>
        <div> 我</div>
    </div>
    <div id="shopCart-content " class="nav-content ">
        <div class="nav-con-close "><i class="am-icon-angle-right am-icon-fw "></i></div>
        <div> 购物车</div>
    </div>
    <div id="asset-content " class="nav-content ">
        <div class="nav-con-close "><i class="am-icon-angle-right am-icon-fw "></i></div>
        <div> 资产</div>
        <div class="ia-head-list ">
            <a href="# " target="_blank " class="pl ">
                <div class="num ">0</div>
                <div class="text ">优惠券</div>
            </a>
            <a href="# " target="_blank " class="pl ">
                <div class="num ">0</div>
                <div class="text ">红包</div>
            </a>
            <a href="# " target="_blank " class="pl money ">
                <div class="num ">￥0</div>
                <div class="text ">余额</div>
            </a>
        </div>
    </div>
    <div id="foot-content " class="nav-content ">
        <div class="nav-con-close "><i class="am-icon-angle-right am-icon-fw "></i></div>
        <div> 足迹</div>
    </div>
    <div id="brand-content " class="nav-content ">
        <div class="nav-con-close "><i class="am-icon-angle-right am-icon-fw "></i></div>
        <div> 收藏</div>
    </div>
    <div id="broadcast-content " class="nav-content ">
        <div class="nav-con-close "><i class="am-icon-angle-right am-icon-fw "></i></div>
        <div> 充值</div>
    </div>
</div>
<script>
    window.jQuery || document.write('&lt;script src="basic/js/jquery.min.js ">&lt;\/script>');

</script>
<script type="text/javascript " src="${APP_PATH}/basic/js/quick_links.js "></script>
</body>

</html>

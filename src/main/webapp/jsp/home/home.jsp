<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <title>首页</title>
    <script src="${APP_PATH}/js/jquery-3.1.1.js"></script>

    <script src="${APP_PATH}/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
    <link href="${APP_PATH}/AmazeUI-2.4.2/assets/css/amazeui.min.css" rel="stylesheet"/>

    <link href="${APP_PATH}/basic/css/demo.css" rel="stylesheet"/>
    <link href="${APP_PATH}/css/hmstyle.css" rel="stylesheet"/>
    <link href="${APP_PATH}/css/skin.css" rel="stylesheet"/>


</head>

<body>
<div class="hmtop">
    <!--顶部导航条 -->
    <jsp:include   page="${APP_PATH}/jsp/common/top.jsp" flush="true"/>
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
                    <a href="${APP_PATH}/toGoodsManage" style="font-size: 20px;background:#000000;color: #f3f6ff">发布商品</a>
                </li>
            </ul>
            <jsp:include   page="${APP_PATH}/jsp/common/chaopoint.jsp" flush="true"/>
        </div>
        <!--侧边导航 -->
        <div id="nav" class="navfull">
            <div class="area clearfix">
                <div class="category-content" id="guide_2">
                    <div class="category">
                        <ul class="category-list" id="js_climit_li">
                            <a href="${APP_PATH}/toHome">
                                <li class="appliance js_toggle relative first">
                                    <div class="category-info">
                                        <h3 class="category-name b-category-name">
                                            <p class="ml-22" style="color: #d2364c" title="首页">首页</p>
                                        </h3>
                                    </div>

                            <a href="${APP_PATH}/toClassify/2">
                                <li class="appliance js_toggle relative first">
                                    <div class="category-info">
                                        <h3 class="category-name b-category-name">
                                            <p class="ml-22" style="color: #d2364c" title="家用电器">家用电器</p>
                                        </h3>
                                    </div>

                            <a href="${APP_PATH}/toClassify/4">
                                <li class="appliance js_toggle relative">
                                    <div class="category-info">
                                        <h3 class="category-name b-category-name">
                                            <p class="ml-22" style="color: #d2364c" title="手机数码">手机数码</p>
                                        </h3>
                                    </div>

                            <a href="${APP_PATH}/toClassify/7">
                                <li class="appliance js_toggle relative">
                                    <div class="category-info">
                                        <h3 class="category-name b-category-name">
                                            <p class="ml-22" style="color: #d2364c" title="电脑办公">电脑办公</p>
                                        </h3>
                                    </div>

                            <a href="${APP_PATH}/toClassify/8">
                                <li class="appliance js_toggle relative">
                                    <div class="category-info">
                                        <h3 class="category-name b-category-name">
                                            <p class="ml-22" style="color: #d2364c" title="服装">服装</p></h3>
                                    </div>

                            <a href="${APP_PATH}/toClassify/5">
                                <li class="appliance js_toggle relative">
                                    <div class="category-info">
                                        <h3 class="category-name b-category-name">
                                            <p class="ml-22" style="color: #d2364c" title="运动">运动</p></h3>
                                    </div>

                            <a href="${APP_PATH}/toClassify/3" >
                                <li class="appliance js_toggle relative">
                                    <div class="category-info">
                                        <h3 class="category-name b-category-name">
                                            <p class="ml-22" style="color: #d2364c" title="食品">食品</p></h3>
                                    </div>

                            <a href="${APP_PATH}/toClassify/6">
                                <li class="appliance js_toggle relative">
                                    <div class="category-info">
                                        <h3 class="category-name b-category-name">
                                            <p class="ml-22" style="color: #d2364c" title="美妆">美妆</p></h3>
                                    </div>

                            <a href="${APP_PATH}/toClassify/1">
                                <li class="appliance js_toggle relative">
                                    <div class="category-info">
                                        <h3 class="category-name b-category-name">
                                            <p class="ml-22" style="color: #d2364c" title="图书">图书</p></h3>
                                    </div>

                            <a href="${APP_PATH}/toClassify/9">
                            <li class="appliance js_toggle relative">
                                <div class="category-info">
                                    <h3 class="category-name b-category-name">
                                        <p class="ml-22" style="color: #d2364c"     title="其他">其他</p></h3>
                                </div>

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
        if ($(window).width() > 640) {
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
        <div data-am-scrollspy="{animation: 'fade'}" class="am-g am-g-fixed recommendation">
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
                    <a href="introduction.jsp"><img src="${APP_PATH}/${requestScope.one.image}"/>
                    </a>
                </div>
            </div>
            <div class="am-u-sm-4 am-u-lg-3 ">
                <div class="info ">
                    <h3>囤货过冬</h3>
                    <h4>让爱早回家</h4>
                </div>
                <div class="recommendationMain two"><img
                        src="${APP_PATH}/${requestScope.two.image}"/>
                </div>
            </div>
            <div class="am-u-sm-4 am-u-lg-3 ">
                <div class="info ">
                    <h3>浪漫情人节</h3>
                    <h4>甜甜蜜蜜</h4>
                </div>
                <div class="recommendationMain three"><img src="${APP_PATH}/${requestScope.three.image}"/>
                </div>
            </div>
        </div>


        <div class="am-container ">
            <div class="shopTitle ">
                <h4>家用电器</h4>
                <h3>每一个家用电器都有一个故事</h3>
                <span class="more ">
                    <a class="more-link " href="${APP_PATH}/toClassify/家用电器">更多家用电器</a>
                        </span>
            </div>
        </div>
        <div class="am-g am-g-fixed flood method3 ">
            <ul class="am-thumbnails ">
                <c:forEach items="${requestScope.household}" var="list" end="11">
                    <li data-am-scrollspy="{animation: 'fade'}">
                        <div class="list ">
                            <a href="${APP_PATH}/toIntroduction/${list.goodsid}">
                                <img src="${APP_PATH}/${list.image}"/>
                                <div class="pro-title ">${list.goodsname}</div>
                                <span class="e-price ">¥${list.goodsprice}</span>
                            </a>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>


        <div class="am-container ">
            <div class="shopTitle ">
                <h4>手机数码</h4>
                <h3>手机数码</h3>
                <span class="more ">
                    <a class="more-link " href="${APP_PATH}/toClassify/手机数码">更多手机数码</a>
                        </span>
            </div>
        </div>
        <div class="am-g am-g-fixed flood method3 ">
            <ul class="am-thumbnails ">
                <c:forEach items="${requestScope.phone}" var="list" end="11">
                    <li data-am-scrollspy="{animation: 'fade'}">
                        <div class="list ">
                            <a href="${APP_PATH}/toIntroduction/${list.goodsid}">
                                <img src="${APP_PATH}/${list.image}"/>
                                <div class="pro-title ">${list.goodsname}</div>
                                <span class="e-price ">¥${list.goodsprice}</span>
                            </a>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>


        <div class="am-container ">
            <div class="shopTitle ">
                <h4>电脑办公</h4>
                <h3>电脑办公</h3>
                <span class="more ">
                    <a class="more-link " href="${APP_PATH}/toClassify/电脑办公">更多电脑办公</a>
                        </span>
            </div>
        </div>
        <div class="am-g am-g-fixed flood method3 ">
            <ul class="am-thumbnails ">
                <c:forEach items="${requestScope.computer}" var="list" end="11">
                    <li data-am-scrollspy="{animation: 'fade'}">
                        <div class="list ">
                            <a href="${APP_PATH}/toIntroduction/${list.goodsid}">
                                <img src="${APP_PATH}/${list.image}"/>
                                <div class="pro-title ">${list.goodsname}</div>
                                <span class="e-price ">¥${list.goodsprice}</span>
                            </a>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>


        <div class="am-container ">
            <div class="shopTitle ">
                <h4>服装</h4>
                <h3>服装</h3>
                <span class="more ">
                    <a class="more-link " href="${APP_PATH}/toClassify/服装">更多服装</a>
                        </span>
            </div>
        </div>
        <div class="am-g am-g-fixed flood method3 ">
            <ul class="am-thumbnails ">
                <c:forEach items="${requestScope.clothes}" var="list" end="11">
                    <li data-am-scrollspy="{animation: 'fade'}">
                        <div class="list ">
                            <a href="${APP_PATH}/toIntroduction/${list.goodsid}">
                                <img src="${APP_PATH}/${list.image}"/>
                                <div class="pro-title ">${list.goodsname}</div>
                                <span class="e-price ">¥${list.goodsprice}</span>
                            </a>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>


        <div class="am-container ">
            <div class="shopTitle ">
                <h4>运动</h4>
                <h3>运动</h3>
                <span class="more ">
                    <a class="more-link " href="${APP_PATH}/toClassify/运动">更多运动</a>
                        </span>
            </div>
        </div>
        <div class="am-g am-g-fixed flood method3 ">
            <ul class="am-thumbnails ">
                <c:forEach items="${requestScope.sport}" var="list" end="11">
                    <li data-am-scrollspy="{animation: 'fade'}">
                        <div class="list ">
                            <a href="${APP_PATH}/toIntroduction/${list.goodsid}">
                                <img src="${APP_PATH}/${list.image}"/>
                                <div class="pro-title ">${list.goodsname}</div>
                                <span class="e-price ">¥${list.goodsprice}</span>
                            </a>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>


        <div class="am-container ">
            <div class="shopTitle ">
                <h4>食品</h4>
                <h3>食品</h3>
                <span class="more ">
                    <a class="more-link " href="${APP_PATH}/toClassify/食品">更多食品</a>
                        </span>
            </div>
        </div>
        <div class="am-g am-g-fixed flood method3 ">
            <ul class="am-thumbnails ">
                <c:forEach items="${requestScope.snack}" var="list" end="11">
                    <li data-am-scrollspy="{animation: 'fade'}">
                        <div class="list ">
                            <a href="${APP_PATH}/toIntroduction/${list.goodsid}">
                                <img src="${APP_PATH}/${list.image}"/>
                                <div class="pro-title ">${list.goodsname}</div>
                                <span class="e-price ">¥${list.goodsprice}</span>
                            </a>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>


        <div class="am-container ">
            <div class="shopTitle ">
                <h4>美妆</h4>
                <h3>美妆</h3>
                <span class="more ">
                    <a class="more-link " href="${APP_PATH}/toClassify/美妆">更多美妆</a>
                        </span>
            </div>
        </div>
        <div class="am-g am-g-fixed flood method3 ">
            <ul class="am-thumbnails ">
                <c:forEach items="${requestScope.beauty}" var="list" end="11">
                    <li data-am-scrollspy="{animation: 'fade'}">
                        <div class="list ">
                            <a href="${APP_PATH}/toIntroduction/${list.goodsid}">
                                <img src="${APP_PATH}/${list.image}"/>
                                <div class="pro-title ">${list.goodsname}</div>
                                <span class="e-price ">¥${list.goodsprice}</span>
                            </a>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>


        <div class="am-container ">
            <div class="shopTitle ">
                <h4>图书</h4>
                <h3>知识就是力量</h3>
                <span class="more ">
                    <a class="more-link " href="${APP_PATH}/toClassify/图书">更多图书</a>
                        </span>
            </div>
        </div>
        <div class="am-g am-g-fixed flood method3 ">
            <ul class="am-thumbnails ">
                <c:forEach items="${requestScope.book}" var="list" end="11">
                    <li data-am-scrollspy="{animation: 'fade'}">
                        <div class="list ">
                            <a href="${APP_PATH}/toIntroduction/${list.goodsid}">
                                <img src="${APP_PATH}/${list.image}"/>
                                <div class="pro-title ">${list.goodsname}</div>
                                <span class="e-price ">¥${list.goodsprice}</span>
                            </a>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>


        <jsp:include   page="${APP_PATH}/jsp/common/bottom.jsp" flush="true"/>
    </div>
</div>

<a href="##" data-am-smooth-scroll="" class="am-icon-btn am-icon-rocket amdoc-totop" style="display: inline;"></a>

<script type="text/javascript " src="${APP_PATH}/basic/js/quick_links.js "></script>
</body>

</html>

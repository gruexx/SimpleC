<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <title>个人资料</title>
    <script src="${APP_PATH}/js/jquery-3.1.1.js"></script>

    <link href="${APP_PATH}/amazeui-3.0.0-alpha.beta/AmazeUIdemo/assets/css/amazeui.min.css" rel="stylesheet" type="text/css">
    <script src="${APP_PATH}/amazeui-3.0.0-alpha.beta/AmazeUIdemo/assets/js/amazeui.min.js" type="text/javascript"></script>

    <%--<link href="${APP_PATH}/AmazeUI-2.4.2/assets/css/amazeui.min.css" rel="stylesheet"/>--%>
    <%--<script src="${APP_PATH}/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>--%>

    <link href="${APP_PATH}/css/personal.css" rel="stylesheet" type="text/css">
    <link href="${APP_PATH}/css/infstyle.css" rel="stylesheet" type="text/css">
</head>

<body>
    <!--头 -->
    <header>
        <article>
            <div class="mt-logo">
                <!--顶部导航条 -->
                <jsp:include   page="${APP_PATH}/jsp/common/top.jsp" flush="true"/>
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
                <div class="user-info">
                    <!--标题 -->
                    <div class="am-cf am-padding">
                        <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small></div>
                    </div>
                    <hr/>
                    <!--头像 -->
                    <div class="user-infoPic">
                        <div class="filePic">
                            <input type="file" class="inputPic" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*"> <img class="am-circle am-img-thumbnail" src="${APP_PATH}/images/getAvatar.do.jpg" alt="" /> </div>
                        <p class="am-form-help">头像</p>
                        <div class="info-m">
                            <div><b>用户名：<i>小叮当</i></b></div>
                            <div class="u-level"> <span class="rank r2">
							             <s class="vip1"></s><a class="classes" href="#">铜牌会员</a>
						            </span> </div>
                            <div class="u-safety"> <a href="safety.html">
									 账户安全
									<span class="u-profile"><i class="bc_ee0000" style="width: 60px;" width="0">60分</i></span>
									</a> </div>
                        </div>
                    </div>
                    <!--个人信息 -->
                    <div class="info-main">
                        <form class="am-form am-form-horizontal">
                            <div class="am-form-group">
                                <label class="am-form-label">昵称</label>
                                <div class="am-form-content">
                                    <input type="text" placeholder="nickname"> </div>
                            </div>
                            <div class="am-form-group">
                                <label class="am-form-label">姓名</label>
                                <div class="am-form-content">
                                    <input type="text" placeholder="name"> </div>
                            </div>
                            <div class="am-form-group">
                                <label class="am-form-label">性别</label>
                                <div class="am-form-content sex">
                                    <label class="am-radio-inline">
                                        <input type="radio" name="radio10" value="male" data-am-ucheck> 男 </label>
                                    <label class="am-radio-inline">
                                        <input type="radio" name="radio10" value="female" data-am-ucheck> 女 </label>
                                    <label class="am-radio-inline">
                                        <input type="radio" name="radio10" value="secret" data-am-ucheck> 保密 </label>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label class="am-form-label">生日</label>
                                <div class="am-form-content birth">
                                    <div class="birth-select">
                                        <select data-am-selected>
                                            <option value="a">2015</option>
                                            <option value="b">1987</option>
                                        </select> <em>年</em> </div>
                                    <div class="birth-select2">
                                        <select data-am-selected>
                                            <option value="a">12</option>
                                            <option value="b">8</option>
                                        </select> <em>月</em></div>
                                    <div class="birth-select2">
                                        <select data-am-selected>
                                            <option value="a">21</option>
                                            <option value="b">23</option>
                                        </select> <em>日</em></div>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="user-phone" class="am-form-label">电话</label>
                                <div class="am-form-content">
                                    <input id="user-phone" placeholder="telephonenumber" type="tel"> </div>
                            </div>
                            <div class="am-form-group">
                                <label for="user-email" class="am-form-label">电子邮件</label>
                                <div class="am-form-content">
                                    <input id="user-email" placeholder="Email" type="email"> </div>
                            </div>
                            <div class="am-form-group address">
                                <label class="am-form-label">收货地址</label>
                                <div class="am-form-content address">
                                    <a href="address.jsp">
                                        <p class="new-mu_l2cw"> <span class="province">湖北</span>省 <span class="city">武汉</span>市 <span class="dist">洪山</span>区 <span class="street">雄楚大道666号(中南财经政法大学)</span> <span class="am-icon-angle-right"></span> </p>
                                    </a>
                                </div>
                            </div>
                            <div class="am-form-group safety">
                                <label class="am-form-label">账号安全</label>
                                <div class="am-form-content safety">
                                    <a href="safety.html"> <span class="am-icon-angle-right"></span> </a>
                                </div>
                            </div>
                            <div class="info-btn">
                                <div class="am-btn am-btn-danger">保存修改</div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!--底部-->
            <jsp:include   page="${APP_PATH}/jsp/common/bottom.jsp" flush="true"/>
        </div>
        <aside class="menu">
            <ul>
                <li class="person"> <a href="${APP_PATH}/toUserInfo" style="font-size: 16px">个人中心</a> </li>
                <hr/>
                <li class="person" style="font-size: 15px;font-weight: bold"> 个人资料
                    <hr/>
                    <ul>
                        <li class="active"> <a href="${APP_PATH}/toUserInfo">个人信息</a></li>
                        <li> <a href="${APP_PATH}/toAddress">收货地址</a></li>
                    </ul>
                </li>
                <li class="person" style="font-size: 15px;font-weight: bold"> 我的交易
                    <hr/>
                    <ul>
                        <li><a href="${APP_PATH}/toOrderItem">订单管理</a></li>
                    </ul>
                    <ul>
                        <li><a href="${APP_PATH}/toPublish">发布商品</a></li>
                    </ul>
                    <ul>
                        <li><a href="${APP_PATH}/toGoodsManage">管理我的商品</a></li>
                    </ul>
                </li>
                <li class="person" style="font-size: 15px;font-weight: bold"> 我的资产
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

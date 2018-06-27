<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <title>修改密码</title>

    <script src="${APP_PATH}/js/jquery-3.1.1.js"></script>

    <link href="${APP_PATH}/amazeui-3.0.0-alpha.beta/AmazeUIdemo/assets/css/amazeui.min.css" rel="stylesheet" type="text/css">
    <script src="${APP_PATH}/amazeui-3.0.0-alpha.beta/AmazeUIdemo/assets/js/amazeui.min.js" type="text/javascript"></script>

    <%--<link href="${APP_PATH}/AmazeUI-2.4.2/assets/css/amazeui.min.css" rel="stylesheet"/>--%>
    <%--<script src="${APP_PATH}/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>--%>

    <link href="${APP_PATH}/css/personal.css" rel="stylesheet" type="text/css">
    <link href="${APP_PATH}/css/stepstyle.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${APP_PATH}/js/jquery-1.7.2.min.js"></script>
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
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">修改密码</strong> / <small>Password</small></div>
                </div>
                <hr/>
                <!--进度条-->
                <div class="m-progress">
                    <div class="m-progress-list"> <span class="step-1 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                <p class="stage-name">重置密码</p>
                            </span> <span class="step-2 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">2<em class="bg"></em></i>
                                <p class="stage-name">完成</p>
                            </span> <span class="u-progress-placeholder"></span> </div>
                    <div class="u-progress-bar total-steps-2">
                        <div class="u-progress-bar-inner"></div>
                    </div>
                </div>
                <form class="am-form am-form-horizontal">
                    <div class="am-form-group">
                        <label for="user-old-password" class="am-form-label">原密码</label>
                        <div class="am-form-content">
                            <input type="password" id="user-old-password" placeholder="请输入原登录密码"> </div>
                    </div>
                    <div class="am-form-group">
                        <label for="user-new-password" class="am-form-label">新密码</label>
                        <div class="am-form-content">
                            <input type="password" id="user-new-password" placeholder="由数字、字母组合"> </div>
                    </div>
                    <div class="am-form-group">
                        <label for="user-confirm-password" class="am-form-label">确认密码</label>
                        <div class="am-form-content">
                            <input type="password" id="user-confirm-password" placeholder="请再次输入上面的密码"> </div>
                    </div>
                    <div class="info-btn">
                        <div class="am-btn am-btn-danger">保存修改</div>
                    </div>
                </form>
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

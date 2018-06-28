<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <title>账单明细</title>
    <script src="${APP_PATH}/js/jquery-3.1.1.js"></script>

    <link href="${APP_PATH}/amazeui-3.0.0-alpha.beta/AmazeUIdemo/assets/css/amazeui.min.css" rel="stylesheet" type="text/css">
    <script src="${APP_PATH}/amazeui-3.0.0-alpha.beta/AmazeUIdemo/assets/js/amazeui.min.js" type="text/javascript"></script>

    <%--<link href="${APP_PATH}/AmazeUI-2.4.2/assets/css/amazeui.min.css" rel="stylesheet"/>--%>
    <%--<script src="${APP_PATH}/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>--%>

    <link href="${APP_PATH}/css/personal.css" rel="stylesheet" type="text/css">
    <link href="${APP_PATH}/css/bilstyle.css" rel="stylesheet" type="text/css">
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
                <li class="index"><a href="${APP_PATH}/toHome">首页</a></li>
            </ul>
            <jsp:include   page="${APP_PATH}/jsp/common/chaopoint.jsp" flush="true"/>
        </div>
    </div> <b class="line"></b>
    <div class="center">
        <div class="col-main">
            <div class="main-wrap">
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">账单明细</strong> / <small>Electronic&nbsp;bill</small></div>
                </div>
                <hr>
                <!--交易时间	-->
                <div class="order-time">
                    <label class="form-label">交易时间：</label>
                    <div class="show-input">
                        <select class="am-selected" data-am-selected>
                            <option value="today">今天</option>
                            <option value="sevenDays" selected="">最近一周</option>
                            <option value="oneMonth">最近一个月</option>
                            <option value="threeMonths">最近三个月</option>
                            <option class="date-trigger">自定义时间</option>
                        </select>
                    </div>
                    <div class="clear"></div>
                </div>
                <table width="100%">
                    <thead>
                        <tr>
                            <th class="memo"></th>
                            <th class="time">创建时间</th>
                            <th class="name">名称</th>
                            <th class="amount">金额</th>
                            <th class="action">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="img"> <i><img src="${APP_PATH}/images/songzi.jpg"></i> </td>
                            <td class="time">
                                <p> 2016-01-28 </p>
                                <p class="text-muted"> 10:58 </p>
                            </td>
                            <td class="title name">
                                <p class="content"> 良品铺子精选松子，即开即食全国包邮 </p>
                            </td>
                            <td class="amount"> <span class="amount-pay">- 11.90</span> </td>
                            <td class="operation"> 删除 </td>
                        </tr>
                        <tr>
                            <td class="img"> <i><img src="${APP_PATH}/images/songzi.jpg"></i> </td>
                            <td class="time">
                                <p> 2016-01-28 </p>
                                <p class="text-muted"> 10:58 </p>
                            </td>
                            <td class="title name">
                                <p class="content"> 良品铺子精选松子，即开即食全国包邮 </p>
                            </td>
                            <td class="amount"> <span class="amount-pay">- 11.90</span> </td>
                            <td class="operation"> 删除 </td>
                        </tr>
                    </tbody>
                </table>
                <script type="text/javascript">
                    $(document).ready(function () {
                        $(".date-trigger").click(function () {
                            $(".show-input").css("display", "none");
                        });
                    })
                </script>
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
                        <li> <a href="${APP_PATH}/toUserInfo">个人信息</a></li>
                        <li> <a href="${APP_PATH}/toAddress">收货地址</a></li>
                    </ul>
                </li>
                <li class="person" style="font-size: 15px;font-weight: bold"> 我的交易
                    <hr/>
                    <ul>
                        <li><a href="${APP_PATH}/toOrderItem">订单管理</a></li>
                    </ul>
                    <ul>
                        <li><a href="${APP_PATH}/toGoodsManage">管理我的商品</a></li>
                    </ul>
                </li>
                <li class="person" style="font-size: 15px;font-weight: bold"> 我的资产
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
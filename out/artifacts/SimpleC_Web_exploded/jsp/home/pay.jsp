<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <title>结算页面</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script src="${APP_PATH}/js/jquery-3.1.1.js"></script>

    <link href="${APP_PATH}/amazeui-3.0.0-alpha.beta/AmazeUIdemo/assets/css/amazeui.min.css" rel="stylesheet"
          type="text/css">
    <script src="${APP_PATH}/amazeui-3.0.0-alpha.beta/AmazeUIdemo/assets/js/amazeui.min.js"
            type="text/javascript"></script>

    <%--<link href="${APP_PATH}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet">--%>
    <%--<link href="${APP_PATH}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet">--%>

    <link href="${APP_PATH}/basic/css/demo.css" rel="stylesheet" type="text/css"/>
    <link href="${APP_PATH}/css/cartstyle.css" rel="stylesheet" type="text/css"/>
    <link href="${APP_PATH}/css/jsstyle.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${APP_PATH}/js/address.js"></script>
</head>

<body>
<!--顶部导航条 -->
<jsp:include page="${APP_PATH}/jsp/common/top.jsp" flush="true"/>
<div class="clear"></div>
<div class="concent">
    <!--地址 -->
    <div class="paycont">
        <div class="address">
            <h3>确认收货地址 </h3>
            <div class="control">
                <div class="tc-btn createAddr theme-login am-btn am-btn-danger" id="manageAddress">管理我的地址</div>
            </div>
            <div class="clear"></div>
            <ul>
                <c:forEach items="${requestScope.addressList}" var="address">
                    <div class="per-border"></div>
                    <li class="user-addresslist defaultAddr" data-address="${address}">
                        <div class="address-left">
                            <div class="user DefaultAddr">
                                <span class="buy-address-detail">
                                    <span class="buy-user">${address.receiver}</span>
                                    <span class="buy-phone">${address.phone}</span>
                                </span>
                            </div>
                            <div class="default-address DefaultAddr">
                                <span class="buy-line-title buy-line-title-type">收货地址</span>
                                <span class="buy--address-detail">
								   <span class="province">${address.address}</span>
                                </span>
                            </div>
                            <ins class="deftip" style="display: none">默认地址</ins>
                        </div>
                    </li>
                </c:forEach>
            </ul>

            <div class="clear"></div>
        </div>
        <!--支付方式-->
        <div class="logistics">
            <h3>选择支付方式</h3>
            <ul class="pay-list">
                <li class="pay card"><img src="${APP_PATH}/images/wangyin.jpg"/>银联<span></span></li>
                <li class="pay qq"><img src="${APP_PATH}/images/weizhifu.jpg"/>微信<span></span></li>
                <li class="pay taobao"><img src="${APP_PATH}/images/zhifubao.jpg"/>支付宝<span></span></li>
            </ul>
        </div>
        <div class="clear"></div>
        <!--订单 -->
        <div class="concent">
            <div id="cartTable">

                <table class="am-table am-table-striped am-table-hover">
                    <thead>
                    <tr>
                        <th style="font-size: 16px;font-weight: bold">商品图片</th>
                        <th style="font-size: 16px;font-weight: bold">商品名称</th>
                        <th style="font-size: 16px;font-weight: bold">单价</th>
                        <th style="font-size: 16px;font-weight: bold">数量</th>
                        <th style="font-size: 16px;font-weight: bold">金额</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${requestScope.ShopcartList}" var="ShopcartList" varStatus="loop">
                        <tr>
                            <td>
                                <a>
                                    <img src="${APP_PATH}/${requestScope.GoodsList[loop.count-1].image}"
                                         style="width: 90px;height: 90px;">
                                </a>
                            </td>
                            <td>${requestScope.GoodsList[loop.count-1].goodsname}</td>
                            <td>${requestScope.GoodsList[loop.count-1].goodsprice}</td>
                            <td>${ShopcartList.number}</td>
                            <td>${requestScope.GoodsList[loop.count-1].goodsprice*ShopcartList.number}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

            </div>
        </div>
        <div class="clear"></div>

        <!--含运费小计 -->
        <div class="buy-point-discharge ">
            <p class="price g_price "> 合计（含运费）
                <span>¥</span><em class="pay-sum">${requestScope.totalprice}</em>
            </p>
            <div style="float:right">
                <label class="am-checkbox am-success">
                    <input type="checkbox" value="" id="isUsing" data-am-ucheck>使用潮积分抵扣
                    <p id="isUsingp">${sessionScope.user.userchaopoint*0.001}</p>元
                </label>
            </div>
        </div>
        <script>
            $(function () {
                if (${sessionScope.user.userchaopoint*0.001}>
                ${requestScope.totalprice})
                {
                    $('#isUsingp').text(${requestScope.totalprice});
                }
            });
            $('#isUsing').click(function () {
                if (this.checked) {
                    var decent = $('#isUsingp').text();
                    console.log(decent);
                    var result = ${requestScope.totalprice}-decent;
                    console.log(result);
                    $('#J_ActualFee').text(parseFloat(result).toFixed(3));
                }
                else
                    $('#J_ActualFee').text('${requestScope.totalprice}');
            })
        </script>

        <!--信息 -->
        <div class="order-go clearfix">
            <div class="pay-confirm clearfix">
                <div class="box">
                    <div tabindex="0" id="holyshit267" class="realPay"><em class="t">实付款：</em>
                        <span class="price g_price ">
                            <span>¥</span>
                            <em class="style-large-bold-red " id="J_ActualFee">${requestScope.totalprice}</em>
                        </span>
                    </div>
                    <div id="holyshit268" class="pay-address">
                        <p class="buy-footer-address">
                            <span class="buy-line-title buy-line-title-type">寄送至：</span>
                            <span class="buy--address-detail">
                                <span></span>
                            </span>
                        </p>
                        <p class="buy-footer-address">
                            <span class="buy-line-title">收货人：</span>
                            <span class="buy-address-detail">
                                <span class="buy-user">${sessionScope.user.username}</span>
                                <span class="buy-phone">${sessionScope.user.userphone}</span>
                            </span>
                        </p>
                    </div>
                </div>
                <div id="holyshit269" class="submitOrder">
                    <div class="go-btn-wrap">
                        <a id="submitOrder" class="btn-go" tabindex="0"
                           title="点击此按钮，提交订单">提交订单</a>
                        <a href="${APP_PATH}/toShopcart" class="btn-go" style="background-color: #d89f58;"
                           title="返回购物车">返回购物车</a>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>

<jsp:include page="${APP_PATH}/jsp/common/bottom.jsp" flush="true"/>

</body>

</html>

<script>
    $(function () {
        var isdefault = JSON.parse('${requestScope.isdefault}');
        console.log("isdefault: " + isdefault);

        $('.user-addresslist').each(function (i) {

            console.log("isdefault: " + isdefault[i]);

            if (isdefault[i] !== 1) {
                $(this).removeClass('defaultAddr');
            }else {
                $(this).find('.deftip').css({
                    display: 'block'
                });
                $(this).addClass('selectAddress');
            }
        });
    });

    $('#manageAddress').click(function () {
        window.location.href = '${APP_PATH}/toAddress';
    });

    $('#submitOrder').click(function () {
        console.log($('.selectAddress').data('address'));

        <%--$.ajax({--%>
            <%--url: "${APP_PATH}/Balance",--%>
            <%--type: "POST",--%>
            <%--data: {},--%>
        <%--})--%>
    })
</script>

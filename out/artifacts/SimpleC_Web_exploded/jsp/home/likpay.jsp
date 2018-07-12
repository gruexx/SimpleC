<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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

    <link href="${APP_PATH}/css/jquery.toast.min.css" rel="stylesheet">
    <script type="text/javascript" src="${APP_PATH}/js/jquery.toast.min.js"></script>
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
                    <li class="user-addresslist defaultAddr eachAddress" data-addressid="${address.addressid}">
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
                <li class="pay card"><img src="${APP_PATH}/static/picture/logoPro.png"/>余额支付<span></span></li>
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
                    <tr>
                        <td>
                            <a>
                                <img src="${APP_PATH}/${requestScope.Goods.image}"
                                     style="width: 90px;height: 90px;">
                            </a>
                        </td>
                        <td>${requestScope.Goods.goodsname}</td>
                        <td>${requestScope.Goods.goodsprice}</td>
                        <td>${requestScope.number}</td>
                        <td>${requestScope.totalprice}</td>
                    </tr>
                    </tbody>
                </table>


            </div>
        </div>
        <div class="clear"></div>

        <!--含运费小计 -->
        <div class="buy-point-discharge ">
            <p class="price g_price "> 合计（含运费）
                <span>¥</span><em class="pay-sum"><fmt:formatNumber type="number" value="${requestScope.totalprice}"
                                                                    pattern="#.##"/></em>
            </p>
            <div style="float:right">
                <label class="am-checkbox am-success">
                    <input type="checkbox" value="" id="isUsing" data-am-ucheck>使用潮积分抵扣
                    <p id="isUsingp">
                        <fmt:formatNumber type="number" value="${sessionScope.user.userchaopoint*0.001}"
                                          pattern="#.###"/>
                    </p>元
                </label>
            </div>
        </div>
        <script>
            $(function () {
                var chao = parseInt('${sessionScope.user.userchaopoint*0.001}');
                var remainder = parseInt('${requestScope.totalprice}');
                if (chao > remainder) {
                    $('#isUsingp').text(<fmt:formatNumber type="number" value="${requestScope.totalprice}" pattern="#.##"/>);
                    $('#submitOrder').attr("data-chao", ${requestScope.totalprice*1000});
                }
                else {
                    $('#submitOrder').attr("data-chao", ${sessionScope.user.userchaopoint});
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
            } else {
                $(this).find('.deftip').css({
                    display: 'block'
                });
                $(this).addClass('selectAddress');
            }
        });
    });

    $('.user-addresslist').click(function () {
        $('.eachAddress').each(function () {
            $(this).removeClass('selectAddress');
        });
        $(this).addClass('selectAddress');
        console.log($('.selectAddress').data('addressid'));
    });

    $('#manageAddress').click(function () {
        window.location.href = '${APP_PATH}/toAddress';
    });

    $('#submitOrder').click(function () {
        var goodsid = '${requestScope.Goods.goodsid}';
        var number = '${requestScope.number}';

        var setoff = 0;
        if ($('#isUsing')[0].checked) {
            setoff = $(this).data("chao");
            console.log("chao: " + setoff);
        }
        var addressid = $('.selectAddress').data('addressid');
        console.log("addressid:" + addressid);
        var totalprice = '${requestScope.totalprice}';
        console.log("totalprice: " + totalprice);
        if (addressid == null) {
            alert("请先添加一个收货地址！！！！")
        } else {
            $.ajax({
                url: "${APP_PATH}/Balance",
                type: "POST",
                data: {
                    "addressid": addressid,
                    "totalprice": totalprice,
                    "setoff": setoff,
                    "goodsid": goodsid,
                    "number": number
                },
                success: function (result) {
                    if (result.code === 100) {
                        window.location.href = "${APP_PATH}/toSuccess/" + result.extend.orderitemid;
                    } else {
                        $.toast({
                            heading: "Fail",
                            text: result.extend.msg,
                            showHideTransition: 'slide',
                            hideAfter: false,
                            position: 'top-right',
                        })
                    }
                    console.log("success");
                }
            })
        }
    })
</script>
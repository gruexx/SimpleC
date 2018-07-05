<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <title>购物车页面</title>

    <script src="${APP_PATH}/js/jquery-3.1.1.js"></script>

    <link href="${APP_PATH}/amazeui-3.0.0-alpha.beta/AmazeUIdemo/assets/css/amazeui.min.css" rel="stylesheet"
          type="text/css">
    <script src="${APP_PATH}/amazeui-3.0.0-alpha.beta/AmazeUIdemo/assets/js/amazeui.min.js"
            type="text/javascript"></script>

    <%--<link href="${APP_PATH}/AmazeUI-2.4.2/assets/css/amazeui.min.css" rel="stylesheet"/>--%>
    <%--<script src="${APP_PATH}/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>--%>

    <link href="${APP_PATH}/basic/css/demo.css" rel="stylesheet" type="text/css"/>
    <link href="${APP_PATH}/css/cartstyle.css" rel="stylesheet" type="text/css"/>
    <link href="${APP_PATH}/css/optstyle.css" rel="stylesheet" type="text/css"/>
</head>

<body>
<!--顶部导航条 -->
<jsp:include page="${APP_PATH}/jsp/common/top.jsp" flush="true"/>
<div class="clear"></div>
<!--购物车 -->
<div class="concent">
    <div id="cartTable">


        <table class="am-table am-table-striped am-table-hover">
            <thead>
            <tr>
                <th>#</th>
                <th style="font-size: 16px;font-weight: bold">商品图片</th>
                <th style="font-size: 16px;font-weight: bold">商品名称</th>
                <th style="font-size: 16px;font-weight: bold">单价</th>
                <th style="font-size: 16px;font-weight: bold">数量</th>
                <th style="font-size: 16px;font-weight: bold">金额</th>
                <th style="font-size: 16px;font-weight: bold">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.ShopcartList}" var="ShopcartList" varStatus="loop">
                <tr class="shopcartItem">
                    <td width="50px">
                        <label class="am-checkbox needsclick">
                            <input class="check" type="checkbox" value=""
                                   data-id="${ShopcartList.shopcartid}"
                                   data-am-ucheck checked>
                        </label>
                    </td>
                    <td>
                        <a href="${APP_PATH}/toIntroduction/${ShopcartList.goodsidFkShopcart}">
                            <img src="${APP_PATH}/${requestScope.GoodsList[loop.count-1].image}"
                                 style="width: 90px;height: 90px;">
                        </a>
                    </td>
                    <td>${requestScope.GoodsList[loop.count-1].goodsname}</td>
                    <td>${requestScope.GoodsList[loop.count-1].goodsprice}</td>
                    <td>
                        <form class="am-form">
                            <div class="am-form-group" style="width: 60px">
                                <input type="number" class="goodsNumber" value="${ShopcartList.number}"
                                       data-id="${ShopcartList.shopcartid}"
                                       min="0"
                                       max="100"/>
                            </div>
                        </form>
                    </td>
                    <td>${requestScope.GoodsList[loop.count-1].goodsprice*ShopcartList.number}</td>
                    <td>
                        <button type="button"
                                class="am-btn am-btn-danger deleteShopcart"
                                data-id="${ShopcartList.shopcartid}">删除
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    </div>
    <div class="clear"></div>

    <div class="am-container" style="padding-top: 3px;padding-left: 5px;background-color: #d8d8d8">
        <label class="am-checkbox-inline am-u-sm-1">
            <input type="checkbox" id="selectAll" value="" data-am-ucheck> 全选
        </label>
        <a id="deleteAll" class="am-u-sm-1" style="padding-left: 7px">删除</a>

        <div class="am-u-sm-3">
            <button type="button" id="balance" class="am-btn am-btn-danger am-btn-xl">结算</button>
            <label>合计：${requestScope.totalprice}</label>
        </div>

    </div>

    <jsp:include page="${APP_PATH}/jsp/common/bottom.jsp" flush="true"/>
</div>
<!--操作页面-->

</body>

</html>

<script>

    $(function () {
        var isbuy = JSON.parse('${requestScope.isbuy}');
        console.log("isbuys: "+isbuy);
        var sAll=1;
        $('.check').each(function (i) {

            console.log("isbuy: "+isbuy[i]);

            if(isbuy[i]===1){
                $(this).uCheck('check');
            }else {
                sAll=0;
                $(this).uCheck('uncheck');
            }
        })

        if(sAll===1){
            $('#selectAll').uCheck('check');
        }else {
            $('#selectAll').uCheck('uncheck');
        }

    });

    $('.goodsNumber').change(function () {

        console.log($(this).val());
        var shopcartid = $(this).data('id');
        console.log(shopcartid);

        $.ajax({
            url: '${APP_PATH}/updateShopcartGoodsNumber',
            type: 'POST',
            data:
                {
                    "goodsnumber": $(this).val(),
                    "shopcartid": shopcartid
                },
            success: function () {
                window.location.reload();
            },
            error: function () {
                console.log("fail")
            }
        });
    });

    $('.deleteShopcart').click(function () {
        var $ds = $(this);

        var shopcartid = $ds.data('id');
        console.log(shopcartid);
        $.ajax({
            url: '${APP_PATH}/deleteShopcart',
            type: 'POST',
            data:
                {
                    "shopcartid": shopcartid
                },
            success: function () {
                window.location.reload();
                console.log("success");
                // $ds.parents('.shopcartItem').fadeOut(900);
            },
            error: function () {
                console.log("fail")
            }
        });
    });

    $('#selectAll').click(function () {
        if (this.checked) {

            $('.check').uCheck('check');

            $.ajax({
                url: '${APP_PATH}/updateShopcartCheck',
                type: 'POST',
                data:
                    {
                        "isBuy": 1,
                        "shopcartid": 0
                    },
                success: function () {
                    window.location.reload();
                    console.log("success")
                },
                error: function () {
                    console.log("fail")
                }
            });
        } else {
            $('.check').uCheck('uncheck');
            $.ajax({
                url: '${APP_PATH}/updateShopcartCheck',
                type: 'POST',
                data:
                    {
                        "isBuy": 0,
                        "shopcartid": 0
                    },
                success: function () {
                    window.location.reload();
                    console.log("success")
                },
                error: function () {
                    console.log("fail")
                }
            });
        }
    });


    $('#deleteAll').click(function () {

        var shopcartids = [];
        var checks = $('.check');
        // console.log(checks);
        checks.each(function () {
            // console.log($(this));
            if ($(this)[0].checked) {
                // console.log($(this).data('id'));
                shopcartids.push($(this).data('id'));
                console.log(shopcartids);
            }
        });


        $.ajax({
            url: '${APP_PATH}/deleteAllShopcart',
            traditional: true,
            type: 'POST',
            data:
                {
                    "shopcartids": shopcartids
                },
            success: function () {
                window.location.reload();
                console.log("success");
            },
            error: function () {
                console.log("fail")
            }
        });
    });

    $('#balance').click(function () {
        window.location.href = '${APP_PATH}/toPay';
    });

    $('.check').click(function () {

        var shopcartid = $(this).data('id');
        console.log(shopcartid);
        var isBuy;
        if($(this)[0].checked){
            isBuy = 1;
        }else {
            isBuy = 0;
            $('#selectAll').uCheck('uncheck');
        }

        $.ajax({
            url: '${APP_PATH}/updateShopcartCheck',
            type: 'POST',
            data:
                {
                    "isBuy":isBuy,
                    "shopcartid": shopcartid
                },
            success: function () {
                window.location.reload();
                console.log("success")
            },
            error: function () {
                console.log("fail")
            }
        });
    })
    // $('.test').mouseenter(function () {
    //     $(this).fadeOut(1000);
    // })
</script>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <title>订单详情</title>
    <script src="${APP_PATH}/js/jquery-3.1.1.js"></script>

    <link href="${APP_PATH}/amazeui-3.0.0-alpha.beta/AmazeUIdemo/assets/css/amazeui.min.css" rel="stylesheet"
          type="text/css">
    <script src="${APP_PATH}/amazeui-3.0.0-alpha.beta/AmazeUIdemo/assets/js/amazeui.min.js"
            type="text/javascript"></script>

    <%--<link href="${APP_PATH}/AmazeUI-2.4.2/assets/css/amazeui.min.css" rel="stylesheet"/>--%>
    <%--<script src="${APP_PATH}/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>--%>

    <link href="${APP_PATH}/css/personal.css" rel="stylesheet" type="text/css">
    <link href="${APP_PATH}/css/orstyle.css" rel="stylesheet" type="text/css">

    <link href="${APP_PATH}/css/jquery.toast.min.css" rel="stylesheet">
    <script type="text/javascript" src="${APP_PATH}/js/jquery.toast.min.js"></script>
</head>

<body>
<!--头 -->
<header>
    <article>
        <div class="mt-logo">
            <!--顶部导航条 -->
            <jsp:include page="${APP_PATH}/jsp/common/top.jsp" flush="true"/>
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
        <jsp:include page="${APP_PATH}/jsp/common/chaopoint.jsp" flush="true"/>
    </div>
</div>
<b class="line"></b>
<div class="center">
    <div class="col-main">

        <div class="main-wrap">
            <div class="user-orderinfo">
                <!--标题 -->
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单详情</strong> /
                        <small>Order&nbsp;details</small>
                    </div>
                </div>
                <hr/>

                <table class="am-table am-table-striped am-table-hover">
                    <thead>
                    <tr style="white-space: nowrap">
                        <th style="font-size: 16px;font-weight: bold">商品</th>
                        <th style="font-size: 16px;font-weight: bold">商品名称</th>
                        <th style="font-size: 16px;font-weight: bold">单价</th>
                        <th style="font-size: 16px;font-weight: bold">数量</th>
                        <th style="font-size: 16px;font-weight: bold">合计</th>
                        <th style="font-size: 16px;font-weight: bold">交易状态</th>
                        <th style="font-size: 16px;font-weight: bold">交易操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${requestScope.GoodsList}" var="GoodsList" varStatus="loop">
                        <tr class="shopcartItem">
                            <td>
                                <a href="${APP_PATH}/toIntroduction/${GoodsList.goodsid}">
                                    <img src="${APP_PATH}/${GoodsList.image}"
                                         style="width: 90px;height: 90px;">
                                </a>
                            </td>
                            <td>${GoodsList.goodsname}</td>
                            <td>${GoodsList.goodsprice}</td>
                            <td><span>×</span>${requestScope.OrderDetailList[loop.count-1].number}</td>
                            <td>${requestScope.OrderDetailList[loop.count-1].number*GoodsList.goodsprice}</td>
                            <td>${requestScope.OrderDetailList[loop.count-1].number*GoodsList.goodsprice}</td>
                            <td class="operationTd">
                                <button type="button"
                                        class="am-btn am-btn-danger confirmReceive"
                                        data-id="${requestScope.OrderDetailList[loop.count-1].orderid}">确认收货
                                </button>
                                <button type="button"
                                        class="am-btn am-btn-success addComment"
                                        data-id="${GoodsList.goodsid}">评论商品
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>


            </div>
        </div>
        <!--底部-->
        <jsp:include page="${APP_PATH}/jsp/common/bottom.jsp" flush="true"/>
    </div>
    <aside class="menu">
        <ul>
            <li class="person"><a href="${APP_PATH}/toUserInfo" style="font-size: 16px">个人中心</a></li>
            <hr/>
            <li class="person" style="font-size: 15px;font-weight: bold"> 个人资料
                <hr/>
                <ul>
                    <li><a href="${APP_PATH}/toUserInfo">个人信息</a></li>
                    <li><a href="${APP_PATH}/toAddress">收货地址</a></li>
                </ul>
            </li>
            <li class="person" style="font-size: 15px;font-weight: bold"> 我的交易
                <hr/>
                <ul>
                    <li class="active"><a href="${APP_PATH}/toOrderItem">订单管理</a></li>
                </ul>
                <ul>
                    <li><a href="${APP_PATH}/toGoodsManage">管理我的商品</a></li>
                </ul>
            </li>
            <li class="person" style="font-size: 15px;font-weight: bold"> 我的资产
                <hr/>
                <ul>
                    <li><a href="${APP_PATH}/toBill">账单明细</a></li>
                </ul>
            </li>
        </ul>
    </aside>
</div>
</body>

<div class="am-modal am-modal-prompt" tabindex="-1" id="commentModal">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">
            添加评论
            <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
        </div>
        <div class="am-modal-bd">
            <form class="am-form">
                <label for="commentContent"></label>
                <textarea class="am-validate" id="commentContent" minlength="10" maxlength="100" required></textarea>
            </form>
        </div>
        <div class="am-modal-footer">
            <button type="button" class="am-btn am-modal-btn am-btn-default am-btn-hollow" data-am-modal-cancel>取消
            </button>
            <button type="button" class="am-btn am-modal-btn am-btn-primary" data-am-modal-confirm>确定</button>
        </div>
    </div>
</div>

</html>
<script>
    $(function () {
        var isReceive = JSON.parse('${requestScope.isReceive}');
        console.log("isReceive: " + isReceive);

        $('.operationTd').each(function (i) {
            if (isReceive[i] === 0) {
                $(this).find('.addComment').css({
                    display: 'none'
                })
                $(this).find('.confirmReceive').css({
                    display: 'block'
                })
            } else {
                $(this).find('.addComment').css({
                    display: 'block'
                })
                $(this).find('.confirmReceive').css({
                    display: 'none'
                })
            }
        })
    });

    $('.confirmReceive').click(function () {
        var orderid = $(this).data('id');
        console.log(orderid);

        $.ajax({
            url: '${APP_PATH}/confirmReceive',
            type: 'POST',
            data: {"orderid": orderid},
            success: function () {
                window.location.reload();
            }
        })
    });

    $('.addComment').click(function () {

        var goodsid = $(this).data('id');
        console.log(goodsid);

        $('#commentModal').modal({
            onConfirm: function () {
                $.ajax({
                    url: '${APP_PATH}/addComment',
                    type: 'POST',
                    data: {"goodsidFkComment": goodsid, "content": $('#commentContent').val()},
                    success: function (result) {
                        if(result.code ===100){
                            window.location.reload();
                        }
                        if (undefined != result.extend.errorFields.content) {
                            $.toast({
                                heading: "Fail",
                                text: result.extend.errorFields.content,
                                showHideTransition: 'slide',
                                hideAfter: false,
                                position: 'top-right'
                            });
                        }
                    }
                })
            }
        });
    });
</script>

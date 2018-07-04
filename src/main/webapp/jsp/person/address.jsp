<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <title>地址管理</title>
    <script src="${APP_PATH}/js/jquery-3.1.1.js"></script>

    <link href="${APP_PATH}/amazeui-3.0.0-alpha.beta/AmazeUIdemo/assets/css/amazeui.min.css" rel="stylesheet"
          type="text/css">
    <script src="${APP_PATH}/amazeui-3.0.0-alpha.beta/AmazeUIdemo/assets/js/amazeui.min.js"
            type="text/javascript"></script>

    <%--<link href="${APP_PATH}/AmazeUI-2.4.2/assets/css/amazeui.min.css" rel="stylesheet"/>--%>
    <%--<script src="${APP_PATH}/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>--%>

    <link href="${APP_PATH}/css/personal.css" rel="stylesheet" type="text/css">
    <link href="${APP_PATH}/css/addstyle.css" rel="stylesheet" type="text/css">

    <script src="${APP_PATH}/js/ssx.js" type="text/javascript"></script>

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
            <div class="user-address">
                <!--标题 -->
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">地址管理</strong> /
                        <small>Address&nbsp;list</small>
                    </div>
                </div>
                <hr/>
                <ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails">
                    <c:forEach items="${requestScope.addressList}" var="address">
                        <li class="user-addresslist defaultAddr" data-id="${address.addressid}">

                            <span class="new-option-r"><i class="am-icon-check-circle"></i>默认地址</span>
                            <p class="new-tit new-p-re">
                                <span class="new-txt">${address.receiver}</span>
                                <span class="new-txt-rd2">${address.phone}</span>
                            </p>
                            <div class="new-mu_l2a new-p-re">
                                <p class="new-mu_l2cw">
                                    <span class="title">地址：</span>
                                    <span>${address.address}</span>
                                </p>
                            </div>
                            <div class="new-addr-btn">
                                <a href="#" class="am-icon-edit" data-id="${address.addressid}"><i></i>编辑</a>
                                <span class="new-addr-bar">|</span>
                                <a href="javascript:void(0);" class="deladdress"
                                   data-id="${address.addressid}">
                                    <i class="am-icon-trash"></i>删除
                                </a>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
                <div class="clear"></div>
                <a class="new-abtn-type" data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">添加新地址</a>
                <!--例子-->
                <div class="am-modal am-modal-no-btn" id="doc-modal-1">
                    <div class="add-dress">
                        <!--标题 -->
                        <div class="am-cf am-padding">
                            <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> /
                                <small>Add&nbsp;address</small>
                            </div>
                        </div>
                        <hr/>
                        <div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
                            <form class="am-form am-form-horizontal">
                                <div class="am-form-group">
                                    <label for="user-name" class="am-form-label">收货人</label>
                                    <div class="am-form-content">
                                        <input type="text" id="user-name" placeholder="收货人"></div>
                                </div>
                                <div class="am-form-group">
                                    <label for="user-phone" class="am-form-label">手机号码</label>
                                    <div class="am-form-content">
                                        <input id="user-phone" placeholder="手机号必填" type="email"></div>
                                </div>

                                <div class="am-form-group" style="display: inline;float: left;">
                                    <label class="am-form-label">选择地址</label>

                                    <div class="am-form-content">
                                        <select name="user.province"
                                                id="selectprovince"
                                                style="width: 191px;float: left;"></select>
                                        <select name="user.city"
                                                id="selectcity"
                                                style="width: 191px;float: left;"></select>
                                        <select name="user.area"
                                                id="selectarea"
                                                style="width: 191px;float: left;"></select><br>
                                    </div>
                                    <script language="javascript" defer>
                                        new PCAS("user.province", "user.city", "user.area", "", "", "");
                                    </script>
                                </div>

                                <div class="am-form-group">
                                    <label for="user-intro" class="am-form-label">详细地址</label>
                                    <div class="am-form-content">
                                        <textarea class="" rows="3" id="user-intro" placeholder="输入详细地址"></textarea>
                                        <small>100字以内写出你的详细地址...</small>
                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <div class="am-u-sm-9 am-u-sm-push-3">
                                        <a id="save" class="am-btn am-btn-danger"
                                           style="display: inline;float: left ">保存</a>
                                        <a id="edit" class="am-btn am-btn-danger"
                                           style="display: none;float: left">修改</a>
                                        <a href="javascript: void(0)" id="cancel"
                                           class="am-close am-btn am-btn-danger"
                                           data-am-modal-close
                                           style="display: inline;float: left ">取消</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clear"></div>
        </div>
        <!--      底部      -->
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
                    <li class="active"><a href="${APP_PATH}/toAddress">收货地址</a></li>
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
                    <li><a href="${APP_PATH}/toBill">账单明细</a></li>
                </ul>
            </li>
        </ul>
    </aside>
</div>
</body>

</html>

<script type="text/javascript">

    $(function () {
        var isdefault = JSON.parse('${requestScope.isdefault}');
        console.log("isdefault: " + isdefault);

        $('.user-addresslist').each(function (i) {

            console.log("isdefault: " + isdefault[i]);

            if (isdefault[i] !== 1) {
                $(this).removeClass('defaultAddr');
            }
        });
    });


    $(document).ready(function () {
        $(".user-addresslist").click(function () {
            $(this).addClass("defaultAddr").siblings().removeClass("defaultAddr");
            var addressid = $(this).data('id');
            $.ajax({
                url: "${APP_PATH}/editDefault",
                type: "POST",
                data: {"addressid": addressid},
            })
        });
        var $ww = $(window).width();
        if ($ww > 640) {
            $("#doc-modal-1").removeClass("am-modal am-modal-no-btn")
        }
    });

    $("#cancel").click(function () {
        window.location.reload();
    });

    $("#save").click(function () {
        var useridFkAddress = "${sessionScope.user.userid}";
        var receiver = $('#user-name').val();
        var phone = $('#user-phone').val();
        var province = $('#selectprovince  option:selected').text();
        var city = $('#selectcity option:selected').text();
        var area = $('#selectarea option:selected').text();
        var detiladdress = $('#user-intro').val();
        $.ajax({
            url: "${APP_PATH}/toSaveAddress",
            type: "POST",
            data: {
                "receiver": receiver,
                "phone": phone,
                "province": province,
                "city": city,
                "area": area,
                "detiladdress": detiladdress,
                "useridFkAddress": useridFkAddress
            },
            success: function (result) {
                if (result.code === 100) {
                    $.toast({
                        heading: "success",
                        text: result.extend.success,
                        showHideTransition: 'slide',
                        position: 'top-right',
                        icon: 'success'
                    });
                    window.location.reload();
                }
                else {
                    $.toast({
                        heading: "fail",
                        text: result.extend.fail,
                        showHideTransition: 'slide',
                        position: 'top-right'

                    })
                }
            },
            error: function () {
                console.log("fail return");
            }
        })
    });

    $('.deladdress').click(function () {
        var addressid = $(this).data('id');
        $.ajax({
            url: "${APP_PATH}/toDelAddress",
            type: "POST",
            data: {
                "addressid": addressid
            },
            success: function () {
                window.location.reload();
            }
        })

    });

    $('.am-icon-edit').click(function () {
        var addressid = $(this).data('id');
        $('#edit').css({
            display: 'block'
        });

        $('#save').css({
            display: 'none'
        });

        $('#edit').attr("data-id", $(this).data('id'));

        $.ajax({
            url: "${APP_PATH}/editAddress",
            type: "POST",
            data: {
                "addressid": addressid
            },
            success: function (result) {

                $('#user-name').val(result.receiver);
                $('#user-phone').val(result.phone);
                $('#user-intro').val(result.detiladdress);
                new PCAS("user.province", "user.city", "user.area", result.province, result.city, result.area);
                //此处添加下拉框对应
            }
        })

    });


    $('#edit').click(function () {
        $(this).css({
            display: 'none'
        });

        var addressid = $(this).data('id');

        var userid = "${sessionScope.user.userid}";
        var receiver = $('#user-name').val();
        var phone = $('#user-phone').val();
        var province = $('#selectprovince  option:selected').text();
        var city = $('#selectcity option:selected').text();
        var area = $('#selectarea option:selected').text();
        var detiladdress = $('#user-intro').val();
        $.ajax({
            url: "${APP_PATH}/toReplaceAddress",
            type: "POST",
            data: {
                "receiver": receiver,
                "phone": phone,
                "province": province,
                "city": city,
                "area": area,
                "detiladdress": detiladdress,
                "userid": userid,
                "addressid": addressid
            },
            success: function (result) {
                if (result.code === 100) {
                    window.location.reload();
                }
                else {
                    $.toast({
                        heading: "fail",
                        text: result.extend.fail,
                        showHideTransition: 'slide',
                        hideAfter: false,
                        position: 'top-right'

                    })
                }
            },
            error: function () {
                console.log("fail return");
            }
        })

    });
</script>

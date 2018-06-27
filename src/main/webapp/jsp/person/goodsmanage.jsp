<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <title>商品管理</title>

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
            <li class="index"><a href="#">首页</a></li>
        </ul>
        <div class="nav-extra"><i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的潮积分 <i
                class="am-icon-angle-right" style="padding-left: 10px;"></i></div>
    </div>
</div>
<b class="line"></b>
<div class="center">
    <div class="col-main">
        <div class="main-wrap">
            <div class="user-order">
                <!--标题 -->
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">我的商品管理</strong> /
                        <small>Order</small>
                    </div>
                </div>
                <button id="addGoodsBtn" type="button" class="am-btn am-btn-primary am-btn-block">发布商品</button>
                <hr/>
                <table class="am-table am-table-striped am-table-hover">
                    <thead>
                    <tr>
                        <th style="font-size: 16px;font-weight: bold">商品编号</th>
                        <th style="font-size: 16px;font-weight: bold">商品名称</th>
                        <th style="font-size: 16px;font-weight: bold">商品价格</th>
                        <th style="font-size: 16px;font-weight: bold">库存</th>
                        <th style="font-size: 16px;font-weight: bold">图片信息</th>
                        <th style="font-size: 16px;font-weight: bold">详细信息</th>
                        <th style="font-size: 16px;font-weight: bold">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${requestScope.myGoods}" var="myg">
                        <tr>
                            <td>${myg.goodsid}</td>
                            <td>${myg.goodsname}</td>
                            <td>${myg.goodsprice}</td>
                            <td>${myg.goodsnumber}</td>
                            <td>
                                <img src="${APP_PATH}/${myg.image}" class="am-img-responsive">
                            </td>
                            <td>${myg.goodsinfo}</td>
                            <td>
                                <button data-id="${myg.goodsid}" type="button" class="am-btn am-btn-primary editGoods">
                                    编辑
                                </button>
                                <button data-id="${myg.goodsid}" type="button" class="am-btn am-btn-danger deleteGoods">
                                    删除
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
                    <li><a href="${APP_PATH}/toOrderItem">订单管理</a></li>
                </ul>
                <ul>
                    <li class="active"><a href="${APP_PATH}/toGoodsManage">管理我的商品</a></li>
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
<%--删除--%>
<div class="am-modal am-modal-confirm" tabindex="-1" id="deleteModal">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">
            确定删除
            <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
        </div>
        <div class="am-modal-bd">
            <span class="am-modal-bd-ico am-icon-exclamation-circle am-text-warning"></span>
            <p>你确定要永久的删除这些内容么？</p>
        </div>
        <div class="am-modal-footer">
            <button type="button" class="am-btn am-modal-btn am-btn-default am-btn-hollow" data-am-modal-cancel>取消
            </button>
            <button type="button" class="am-btn am-modal-btn am-btn-primary" data-am-modal-confirm>确定</button>
        </div>
    </div>
</div>
<%--编辑--%>
<div class="am-modal am-modal-prompt" tabindex="-1" id="editModal">
    <div class="am-modal-dialog" style="width: 400px">
        <div class="am-modal-hd">
            SimpleChange
            <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
        </div>
        <div class="am-modal-bd">
            <form id="addGoodsForm" class="am-form">
                    <div class="am-form-group">
                        <label for="goodsname">商品名称：</label>
                        <input type="text" id="goodsname" name="goodsname" placeholder="必填"
                               class="am-form-field" required/>
                    </div>

                    <div class="am-form-group">
                        <label for="classifyid">商品类别:</label>
                        <select id="classifyid" class="am-datepicker-select" data-am-selected>
                            <c:forEach items="${requestScope.classifyList}" var="classifyList">
                                <option value="${classifyList.classifyid}">${classifyList.classifyname}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="am-form-group">
                        <label for="goodsprice">商品价格：</label>
                        <input type="number" id="goodsprice" placeholder="必填" name="goodsprice" required/>
                    </div>

                    <div class="am-form-group">
                        <label for="goodsnumber">库存量：</label>
                        <input type="number" id="goodsnumber" name="goodsnumber" placeholder="必填" required/>
                    </div>

                    <div class="am-form-group">
                        <label for="goodsinfo">详细资料：</label>
                        <textarea id="goodsinfo" name="goodsinfo" minlength="10" maxlength="100"></textarea>
                    </div>
                    <div class="am-form-group am-form-file">
                        <button type="button" class="am-btn am-btn-danger am-btn-sm">
                            <i class="am-icon-cloud-upload"></i> 选择要上传的图片
                        </button>
                        <input id="imageFile" name="imageFile" type="file" multiple>
                        <div id="file-list"></div>
                    </div>
            </form>
        </div>
        <div class="am-modal-footer">
            <button type="button" class="am-btn am-modal-btn am-btn-default am-btn-hollow" data-am-modal-cancel>取消
            </button>
            <button type="button" class="am-btn am-modal-btn am-btn-primary" data-am-modal-confirm>确定</button>
        </div>
    </div>
</div>
</body>

</html>
<script>
    $('.deleteGoods').click(function () {
        var goodsid = $(this).data('id');
        console.log(goodsid);
        $('#deleteModal').modal({
            relatedTarget: this,
            onConfirm: function () {
                $.ajax({
                    url: '${APP_PATH}/deleteGoods',
                    type: 'POST',
                    data: {"goodsid": goodsid},
                    success: function (result) {

                        if (result.code === 100) {
                            $.toast({
                                heading: "Success",
                                text: 'Yes! 删除成功 <a href="${APP_PATH}/toGoodsManage">刷新</a>.',
                                showHideTransition: 'slide',
                                hideAfter: false,
                                position: 'top-right',
                                icon: 'success'
                            })
                        }
                    }
                });
            }
        });
    });

    $('.editGoods').click(function () {
        var goodsid = $(this).data('id');
        console.log(goodsid);
        $.ajax({
            url: '${APP_PATH}/getGoods',
            type: 'POST',
            data: {"goodsid": goodsid},
            success: function (result) {

                var id = result.classifyidFkGoods;
                console.log("id: "+id);

                $('#goodsname').val(result.goodsname);
                $('#goodsnumber').val(result.goodsnumber);
                $('#goodsinfo').val(result.goodsinfo);
                $('#goodsprice').val(result.goodsprice);
                // $('#classifyid').find('option').eq(id-1).prop('selected', true);
                $('#classifyid').find('option').eq(id-1).siblings().prop('selected', false);
                $('#classifyid').find('option').eq(id-1).prop('selected', true);
                var $a = $('#classifyid').find('option').eq(id-1);
                console.log($a);
                console.log($('#classifyid').find('option'));

                $('#editModal').modal({
                    relatedTarget: this,
                    onConfirm: function () {

                        // var form = new FormData(document.getElementById("addGoodsForm"));
                        // // $("#addGoodsForm").submit();
                        //
                        // var classifyidFkGoods = $("#classifyid option:selected").val();
                        // form.append('classifyid', classifyidFkGoods);
                        //
                        // $.ajax({
                        //     type: "post",
                        //     url: "/doPublish",
                        //     data: form,
                        //     processData: false,
                        //     contentType: false,
                        //     success: function (result) {
                        //         $("#addGoodsForm")[0].reset();
                        //         if (result.code === 100) {
                        //             $.toast({
                        //                 heading: "Success",
                        //                 text: result.extend.msg,
                        //                 showHideTransition: 'slide',
                        //                 icon: 'success',
                        //                 position: 'top-right'
                        //             })
                        //         } else {
                        //             $.toast({
                        //                 heading: "Fail",
                        //                 text: result.extend.msg,
                        //                 showHideTransition: 'fade',
                        //                 position: 'top-right'
                        //             })
                        //         }
                        //     }
                        // })
                    }
                });
            }
        });


    });

    $("#addGoodsBtn").click(function () {

        $('#editModal').modal({
            relatedTarget: this,
            onConfirm: function () {

                var form = new FormData(document.getElementById("addGoodsForm"));
                // $("#addGoodsForm").submit();

                var classifyidFkGoods = $("#classifyid option:selected").val();
                form.append('classifyid', classifyidFkGoods);

                $.ajax({
                    type: "post",
                    url: "/doPublish",
                    data: form,
                    // data: {
                    //     goodsname: goodsname,
                    //     classifyidFkGoods: classifyidFkGoods,
                    //     image: image,
                    //     goodsprice: goodsprice,
                    //     goodsnumber: goodsnumber
                    // },
                    processData: false,
                    contentType: false,
                    success: function (result) {
                        $("#addGoodsForm")[0].reset();
                        if (result.code === 100) {
                            $.toast({
                                heading: "Success",
                                text: result.extend.msg,
                                showHideTransition: 'slide',
                                icon: 'success',
                                position: 'top-right'
                            })
                        } else {
                            $.toast({
                                heading: "Fail",
                                text: result.extend.msg,
                                showHideTransition: 'fade',
                                position: 'top-right'
                            })
                        }
                    }
                })
            }
        });

    })
</script>

<script>
    $(function () {
        $('#imageFile').on('change', function () {
            var fileNames = '';
            $.each(this.files, function () {
                fileNames += '<span class="am-badge">' + this.name + '</span> ';
            });
            $('#file-list').html(fileNames);
        });
    });
</script>
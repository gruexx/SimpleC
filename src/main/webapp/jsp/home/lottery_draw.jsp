<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <title>幸运大转盘抽奖</title>

    <script src="${APP_PATH}/js/jquery-3.1.1.js"></script>

    <link href="${APP_PATH}/amazeui-3.0.0-alpha.beta/AmazeUIdemo/assets/css/amazeui.min.css" rel="stylesheet"
          type="text/css">
    <script src="${APP_PATH}/amazeui-3.0.0-alpha.beta/AmazeUIdemo/assets/js/amazeui.min.js"
            type="text/javascript"></script>

    <%--<link href="${APP_PATH}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet">--%>
    <%--<link href="${APP_PATH}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet">--%>


    <link rel="stylesheet" href="${APP_PATH}/css/demo.css" type="text/css"/>
    <script type="text/javascript" src="${APP_PATH}/js/awardRotate.js"></script>

    <script type="text/javascript">

        $(function () {

            var rotateTimeOut = function () {
                $('#rotate').rotate({
                    angle: 0,
                    animateTo: 2160,
                    duration: 8000,
                    callback: function () {
                        alert('网络超时，请检查您的网络设置！');
                    }
                });
            };
            var bRotate = false;

            var rotateFn = function (awards, angles, txt) {
                bRotate = !bRotate;
                $('#rotate').stopRotate();
                $('#rotate').rotate({
                    angle: 0,
                    animateTo: angles + 1800,
                    duration: 8000,
                    callback: function () {
                        alert(txt);
                        // window.location.reload();
                        bRotate = !bRotate;
                    }
                })
            };



            var int=self.setInterval(refresh(),100);

            function refresh(){


            $('.pointer').click(function () {
                if (parseInt(${sessionScope.user.userchaopoint}) >= 100) {
                    <%--var userchaopoint = ${sessionScope.user.userchaopoint};--%>
                    console.log(${sessionScope.user.userchaopoint});
                    $.ajax({
                        url: '${APP_PATH}/updateChaopoint',
                        type: 'POST',
                        data: {"chaoPoint": ${sessionScope.user.userchaopoint}},
                        success:function () {
                            // $('#chaoPonit').load('/toLotteryDraw #chaoPonit');
                        }
                    });

                    if (bRotate) return;
                    var item = rnd(0, 10000);
                    var x = 0;
                    // alert(item);
                    if (item < 1000)//90%
                    {
                        x = 0;
                    }
                    else if (item < 9100)//10%
                    {
                        x = 2;
                    }
                    else if (item < 9200)//10%
                    {
                        x = 3;
                    }
                    else if (item < 9500)//10%
                    {
                        x = 4;
                    }
                    else if (item < 9600)//10%
                    {
                        x = 5;
                    }
                    else if (item < 9800)//10%
                    {
                        x = 6;
                    } else if (item < 10000)//10%
                    {
                        x = 7;
                    } else if (item = 10000) {
                        x = 1;
                    }

                    switch (x) {
                        case 0:
                            //var angle = [26, 88, 137, 185, 235, 287, 337];
                            rotateFn(0, 337, '未中奖');
                            break;
                        case 1:
                            //var angle = [88, 137, 185, 235, 287];
                            rotateFn(1, 26, '免单4999元');
                            break;
                        case 2:
                            //var angle = [137, 185, 235, 287];
                            rotateFn(2, 88, '免单50元');
                            break;
                        case 3:
                            //var angle = [137, 185, 235, 287];
                            rotateFn(3, 137, '免单10元');
                            break;
                        case 4:
                            //var angle = [185, 235, 287];
                            rotateFn(4, 185, '免单5元');
                            break;
                        case 5:
                            //var angle = [185, 235, 287];
                            rotateFn(5, 185, '免单5元');
                            break;
                        case 6:
                            //var angle = [235, 287];
                            rotateFn(6, 235, '免分期服务费');
                            break;
                        case 7:
                            //var angle = [287];
                            rotateFn(7, 287, '奖励2点心潮积分');
                            break;
                    }

                    console.log(item);
                }
                else {
                    alert("积分值不足！");
                }

            });}
        });

        function rnd(n, m) {
            return Math.floor(Math.random() * (m - n + 1) + n)//(0~1)*(10000-0+1)+0 ===  0~10000
        }
    </script>

    <style type="text/css">
        .show-font {
            background: -webkit-linear-gradient(45deg, #dd2f26, #ff6c64, #f74a44, #fe8484, #bed5f5);
        -moz-linear-gradient(45 deg, #70f7fe, #fbd7c6, #fdefac, #bfb5dd, #bed5f5);
        -ms-linear-gradient(45 deg, #70f7fe, #fbd7c6, #fdefac, #bfb5dd, #bed5f5);
            color: transparent;
            /*设置字体颜色透明*/
            -webkit-background-clip: text;
            /*背景裁剪为文本形式*/
            animation: ran 10s linear infinite;
            /*动态10s展示*/
        }

        @keyframes ran {
            from {
                backgroud-position: 0 0;
            }
            to {
                background-position: 2000px 0;
            }
        }

        #js_climit_li li:hover {
            color: black;
        }
    </style>

    <%--<script>--%>
    <%--$(function () {--%>
    <%--var a=$("<p>1</p>");--%>
    <%--$("#test").append(a);--%>
    <%--})--%>
    <%--</script>--%>
</head>
<body style="background-color:#ffc40a;">
<div class="text" style="float: left;" id="chaoPonit">
    <p class="am-text-xxl am-text-truncate show-font" style="float: left;padding-left: 100px;padding-top: 60px;">
        积分大抽奖</p><br>
    <div id="test" style="float: left;padding-left: 60px;padding-top: 20px;">
        <p class="am-text-lg am-text-truncate">我的积分：</p>
        <p class="show-font am-text-lg am-text-truncate" >
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${sessionScope.user.userchaopoint}
            Point</p>
        <br>
        <br>
        <br>


        <button
                type="button"
                class="am-btn am-btn-danger"
                data-am-modal="{target: '#my-popup'}">
            Popup
        </button>
        <button
                type="button"
                class="am-btn am-btn-secondary"
                onclick="window.location.href='${APP_PATH}/toHome'"><!-- 后期改为跳到账户信息-->
            返回首页
        </button>
        <div class="am-popup" id="my-popup">
            <div class="am-popup-inner">
                <div class="am-popup-hd">
                    <h4 class="am-popup-title">我获得的奖品</h4>
                    <span data-am-modal-close
                          class="am-close">&times;</span>
                </div>
                <div class="am-popup-bd" style="background-color: black;">
                    <p>为你封了国境<br/>为你赦了罪<br/>为你撤了历史记载<br/>为你涂了装扮<br/>为你喝了醉<br/>为你建了城池围墙<br/>一颗热的心穿着冰冷外衣<br/>一张白的脸漆上多少褪色的情节<br/>在我的空虚身体里面<br/>爱上哪个肤浅的王位<br/>在你的空虚宝座里面<br/>爱过什麽女爵的滋味<br/>为你封了国境
                    </p>

                    <p>为你赦了罪<br/>为你撤了历史记载<br/>一颗热的心<br/>穿着冰冷外衣<br/>一张白的脸<br/>漆上多少褪色的情节<br/>在我的空虚身体里面<br/>爱上哪个肤浅的王位<br/>在你的空虚宝座里面<br/>爱过什麽女爵的滋味<br/>在我的空虚身体里面<br/>爱上哪个肤浅的王位<br/>在你的空虚宝座里面<br/>爱过什麽女爵的滋味
                    </p></div>
            </div>
        </div>
    </div>
</div>

<div class="turntable-bg" style="top: 50px;">
    <div class="pointer"><img src="${APP_PATH}/myimages/pointer.png" alt="pointer"/></div>
    <div class="rotate"><img id="rotate" src="${APP_PATH}/myimages/turntable.png" alt="turntable"/></div>
</div>


</body>
</html>
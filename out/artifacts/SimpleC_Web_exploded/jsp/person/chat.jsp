<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/4
  Time: 17:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script src="${APP_PATH}/js/jquery-3.1.1.js"></script>

<script src="${APP_PATH}/amazeui-3.0.0-alpha.beta/AmazeUIdemo/assets/js/amazeui.min.js"
        type="text/javascript"></script>

<script src="${APP_PATH}/js/ssx.js" type="text/javascript"></script>
<script type="text/javascript" src="${APP_PATH}/js/jquery.toast.min.js"></script>
<head>
    <meta charset="UTF-8">
    <title>聊天</title>
    <style>

        * {
            margin: 0;
            padding: 0;
            list-style: none;
            font-family: '', serif
        }

        #container {
            width: 450px;
            height: 780px;
            background: #eee;
            margin: 80px auto 0;
            position: relative;
            box-shadow: 20px 20px 55px #777;
        }

        .header {
            background: #000;
            height: 40px;
            color: #fff;
            line-height: 34px;
            font-size: 20px;
            padding: 0 10px;
        }

        .footer {
            width: 430px;
            height: 50px;
            background: #666;
            position: absolute;
            bottom: 0;
            padding: 10px;
        }

        .footer input {
            width: 275px;
            height: 45px;
            outline: none;
            font-size: 20px;
            text-indent: 10px;
            position: absolute;
            border-radius: 6px;
            right: 80px;
        }

        .footer span {
            display: inline-block;
            width: 62px;
            height: 48px;
            background: #ccc;
            font-weight: 900;
            line-height: 45px;
            cursor: pointer;
            text-align: center;
            position: absolute;
            right: 10px;
            border-radius: 6px;
        }

        .footer span:hover {
            color: #fff;
            background: #999;
        }

        #user_face_icon {
            display: inline-block;
            background: red;
            width: 60px;
            height: 60px;
            border-radius: 30px;
            position: absolute;
            bottom: 6px;
            left: 14px;
            cursor: pointer;
            overflow: hidden;
        }

        img {
            width: 60px;
            height: 60px;
        }

        .content {
            font-size: 20px;
            width: 435px;
            height: 662px;
            overflow: auto;
            padding: 7.5px;
        }

        .content li {
            margin-top: 10px;
            padding-left: 10px;
            width: 412px;
            display: block;
            clear: both;
            overflow: hidden;
        }

        .content li img {
            float: left;
        }

        .content li span {
            background: #7cfc00;
            padding: 10px;
            border-radius: 10px;
            float: left;
            margin: 6px 10px 0 10px;
            max-width: 310px;
            border: 1px solid #ccc;
            box-shadow: 0 0 3px #ccc;
        }

        .content li img.imgleft {
            float: left;
        }

        .content li img.imgright {
            float: right;
        }

        .content li span.spanleft {
            float: left;
            background: #fff;
        }

        .content li span.spanright {
            float: right;
            background: #7cfc00;
        }
    </style>
    <script>
        window.onload = function () {
            if (typeof WebSocket === undefined) {
                alert("not support websocket")
            }

            var num = 0;
            var iNow = -1;
            var icon = document.getElementById('user_face_icon').getElementsByTagName('img');
            var btn = document.getElementById('btn');
            var text = document.getElementById('text');
            var content = document.getElementsByTagName('ul')[0];
            var img = content.getElementsByTagName('img');
            var span = content.getElementsByTagName('span');

            //连接后台
            var ws;
            var wsUri = "ws://"+'${requestScope.ip}'+":8080/chat";
            ws = new WebSocket(wsUri);
            name1 = '${requestScope.name1}';
            name2 = '${requestScope.name2}';
            console.log(name1);
            console.log(name2);


            var arrIcon = ['${APP_PATH}/${sessionScope.user.image}', '${APP_PATH}/${requestScope.image2}'];

            //初始化
            ws.onopen = function () {
                // n=prompt('请给自己取一个昵称：');
                // window.alert("this");
                //m=m.substr(0,16);
                //ws.send(n);
                ws.send(name1 + " " + name2);//在服务端必须由OnMessage接收此消息
            };

            //正则表达式方法火球URL中的参数
            function getQueryString(name) {
                var reg = new RegExp('(^|&)' + name + '=([^&]*)(&|$)', 'i');
                var r = window.location.search.substr(1).match(reg);
                if (r != null) {
                    return unescape(r[2]);
                }
                return null;
            }

            //处理连接后的信息处理
            ws.onmessage = function (message) {
                writeToScreen(message.data);
            };

            function writeToScreen(message) {
                var x = new Array();
                x = message.split(" ");
                if (x[0] == (name1)) {
                    num = 0;
                    content.innerHTML += '<li><img src="' + arrIcon[num] + '"><span>' + x[1] + '</span></li>';
                    iNow++;
                    img[iNow].className += 'imgright';
                    span[iNow].className += 'spanright';
                    content.scrollTop = content.scrollHeight;
                }else if(x[0] == "系统"){
                    var apppath = '${APP_PATH}';
                    content.innerHTML += '<li><img src="' + apppath + '/static/picture/logoPro.png"><span>' + x[1] + '</span></li>';
                    iNow++;
                    img[iNow].className += 'imgright';
                    span[iNow].className += 'spanright';
                    content.scrollTop = content.scrollHeight;
                }
                else {
                    num = 1;
                    content.innerHTML += '<li><img src="' + arrIcon[num] + '"><span>' + x[1] + '</span></li>';
                    iNow++;
                    img[iNow].className += 'imgleft';
                    span[iNow].className += 'spanleft';
                    content.scrollTop = content.scrollHeight;
                }
            }


            //发生错误时，处理错误
            ws.onerror = function (evt) {
                writeToScreen('<span style="color:red;">ERROR:</span>' + evt.data);
                ws.close();
            };
            //当关闭页面时执行ws.close
            window.onbeforeunload = function () {
                ws.close();
            };


            btn.onclick = function () {
                if (text.value == '') {
                    alert('发送消息不为空');
                } else {
                    //num=0;
                    content.innerHTML += '';
                    ws.send(text.value);

                    text.value = '';

                    content.scrollTop = content.scrollHeight;
                }
            }
        }

    </script>
</head>
<body>
<div id="container">
    <div class="header">
        <span style="float: left;"></span>
        <span style="float: right;"><%
            Date d = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String now = df.format(d);
            out.println(now);
        %></span>
    </div>
    <ul class="content" style="background-image:url(${APP_PATH}/chatBackground/bg1.jpg);">

    </ul>
    <div class="footer">
        <div id="user_face_icon">
            <img src="${APP_PATH}/${sessionScope.user.image}" alt="">
        </div>
        <input id="text" type="text">
        <span id="btn">发送</span>
    </div>
</div>
</body>
</html>

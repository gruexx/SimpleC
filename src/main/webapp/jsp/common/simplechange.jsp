<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/scInstruction/style.css">
    <title>心潮工作室</title>
</head>
<body>
<div class="tab">
    <div class="box">
        <ul class="menus">
            <li class="bg">心潮工作室</li>
            <li>工作室历史</li>
            <li>认识我们</li>
            <li>了解我们</li>
            <li>了解我们</li>
            <li>加入我们</li>
            <li onclick="window.location.href='${APP_PATH}/toHome'">返回主页</li>
        </ul>
        <div class="right">
            <div class="scroll">

                <div class="tab_right">
                    <img src="${APP_PATH}/scInstruction/sc.png" alt="">
                </div>
                <div class="tab_right">
                    <img src="${APP_PATH}/scInstruction/introduction.png" alt="">
                </div>
                <div class="tab_right">
                    <img src="${APP_PATH}/scInstruction/1.jpg" alt="">
                </div>
                <div class="tab_right">
                    <img src="${APP_PATH}/scInstruction/2.jpg" alt="">
                </div>
                <div class="tab_right">
                    <img src="${APP_PATH}/scInstruction/3.jpg" alt="">
                </div>
                <div class="tab_right">
                    <img src="${APP_PATH}/scInstruction/invite.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>
<script src="${APP_PATH}/js/jquery-3.1.1.js"></script>
<script type="text/javascript" src="${APP_PATH}/scInstruction/index.js"></script>
</body>
</html>
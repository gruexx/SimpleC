<%--
  Created by IntelliJ IDEA.
  User: cie
  Date: 2018/7/3
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
<head>
    <title>SC账号激活</title>
</head>
<body style="background: url(${APP_PATH}/myimages/active.jpg) center no-repeat">

<script>
    function delayURL(url) {
        var delay = document.getElementById("time").innerHTML;
        if (delay > 0) {
            delay--;
            document.getElementById("time").innerHTML = delay;
        } else {
            window.top.location.href = url;
        }
        setTimeout("delayURL('" + url + "')", 1000);
    }

</script>
<h1>${requestScope.msg}</h1>

<div style="padding-top: 250px;text-align: center">
    <h1 style="font-size: 35px;">${requestScope.msg}</h1>

    <span id="time" style="background: #37ff87;font-size: 30px ;| bolder;">100</span><span
        style="font-size: 30px ;| bolder;">秒钟后自动跳转，如果不跳转，请</span><a href="${APP_PATH}/toLogin"
                                                                    style="font-size: 30px ;| bolder;color: white">点击这里</a>
</div>

<script type="text/javascript">
    delayURL("http://" + '${requestScope.ip}' + ":8080/toLogin");
</script>
</body>
</html>

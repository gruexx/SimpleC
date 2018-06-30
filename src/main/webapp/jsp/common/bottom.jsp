<%--
  Created by IntelliJ IDEA.
  User: ZhouXiaoyu
  Date: 2018/6/27
  Time: 9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<div class="footer ">
    <div class="footer-hd ">
        <p><a href="#">心潮工作室</a> <b>|</b> <a href="${APP_PATH}/toHome">商城首页</a> <b>|</b> <a
                href="#">支付宝</a> <b>|</b> <a href="#">物流</a></p>
    </div>
    <div class="footer-bd ">
        <p><a href="#">关于心潮</a> <a href="#">合作伙伴</a> <a href="#">联系我们</a> <a href="#">网站地图</a> <em>©
            2018-2038
            SimpleChange.com 版权所有.</em></p>
    </div>
</div>

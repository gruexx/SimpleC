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
        <p><a href="${APP_PATH}/jsp/common/simplechange.jsp">心潮工作室</a>
            <b>|</b>
            <a href="${APP_PATH}/toHome">商城首页</a>
            <b>|</b>
            <a data-am-smooth-scroll="{speed: 1000}" href="#">返回顶部</a>
        </p>
    </div>
    <div class="footer-bd ">
        <p><a href="${APP_PATH}/jsp/common/simplechange.jsp">关于心潮</a>
            <a href="${APP_PATH}/jsp/common/simplechange.jsp">联系我们</a>
            <em>©
                2018-2038
                SimpleChange.com 版权所有.
            </em>
        </p>
    </div>
</div>

<div data-am-smooth-scroll="{speed: 1000}" class="returnToTop" style="
            top: 650px; margin-left: 40px;
            padding-left: 40px;position: fixed;">
    <a href="#" title="回到顶部" class="am-icon-btn am-icon-arrow-up am-active"
       style="opacity: 0.8;width: 100%;height: 100%;"></a>
</div>


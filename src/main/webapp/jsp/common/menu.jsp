<%--
  Created by IntelliJ IDEA.
  User: ZhouXiaoyu
  Date: 2018/6/27
  Time: 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<div class=tip>
    <div id="sidebar">
        <div id="wrap">
            <div id="prof" class="item ">
                <a href="${APP_PATH}/toUserInfo"> <span class="setting "></span> </a>
                <div class="mp_tooltip "> 个人中心 <i class="icon_arrow_right_black "></i></div>
            </div>
            <div id="shopCart " class="item ">
                <a href="# "> <span class="message "></span> </a>
                <p> 购物车 </p>
                <p class="cart_num ">0</p>
            </div>
            <div id="asset " class="item ">
                <a href="# "> <span class="view "></span> </a>
                <div class="mp_tooltip "> 我的资产 <i class="icon_arrow_right_black "></i></div>
            </div>
            <div id="broadcast " class="item ">
                <a href="# "> <span class="chongzhi "><img src="${APP_PATH}/images/chongzhi.png "/></span> </a>
                <div class="mp_tooltip "> 我要充值 <i class="icon_arrow_right_black "></i></div>
            </div>
            <div class="quick_toggle ">
                <li class="qtitem "><a href="# "><span class="kfzx "></span></a>
                    <div class="mp_tooltip ">客服中心<i class="icon_arrow_right_black "></i></div>
                </li>
                <li class="qtitem ">
                    <a data-am-smooth-scroll="{speed: 2000}" class="return_top "><span class="top "></span></a>
                </li>
            </div>
        </div>
    </div>
</div>

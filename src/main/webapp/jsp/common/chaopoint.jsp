<%--
  Created by IntelliJ IDEA.
  User: ZhouXiaoyu
  Date: 2018/6/27
  Time: 22:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<style type="text/css">
    #show-font {
        font-weight: 600;
        font-size: 28px;
        background: -webkit-linear-gradient(45deg, #70f7fe, #fbd7c6, #fdefac, #bfb5dd, #bed5f5);
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

<div class="nav-extra" data-am-offcanvas="{target: '#chaoPoint', effect: 'push'}">
    <i class="am-icon-user-secret am-icon-md nav-user"></i>
    <b></b>我的潮积分
    <i class="am-icon-angle-right" style="padding-left: 10px;"></i>
</div>


<div id="chaoPoint" class="am-offcanvas">
    <div class="am-offcanvas-bar am-offcanvas-bar-flip">
        <div class="am-offcanvas-content">
            <div class="this-title"
                 style="height: 5%;text-align: center;font-weight: bold;font-size: 18px;color: #ab2e2b">积分详情
            </div>
            <div class="this-account" style="height: 10%;font-size: 15px;color: #ab2e2b">积分值:<br><span
                    id="show-font">${sessionScope.user.userchaopoint} Point</span></div>
            <div class="award" style="height:55%;font-size: 15px;color: #ab2e2b">积分抽奖<br>
                <div style="height: 90%;">
                    <table>
                        <tr><img src="${APP_PATH}/myimages/phone/2.jpg" class="am-img-responsive"
                                 style="height: 100px;width: auto;"/></tr>
                        <tr><img src="${APP_PATH}/myimages/phone/3.jpg" class="am-img-responsive"
                                 style="height: 100px;width: auto;"/></tr>
                        <tr><img src="${APP_PATH}/myimages/book/2.jpg" class="am-img-responsive"
                                 style="height: 100px;width: auto;"/></tr>
                    </table>
                    <p style="font-size: 15px;">更多精美礼品等着你！</p>
                </div>
                <div style="height: 10%;">
                    <button onclick="window.location.href='${APP_PATH}/toLotteryDraw'" type="button"
                            class="am-btn am-btn-primary am-btn-block">去抽奖
                    </button>
                </div>
            </div>
        </div>
        <div class="rules" style="height: 30%;font-size: 15px;color: #ffffff;padding: 15px">积分规则
            <p>
                1.通过心潮网站消费或销售商品均可获得潮积分。<br>
                2.交易额每增加10元可获得1点潮积分。<br>
                3.可使用100点潮积分进行一次抽奖。
            </p>
        </div>
    </div>
</div>
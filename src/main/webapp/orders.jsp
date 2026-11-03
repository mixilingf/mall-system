<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的订单 - 简易商城</title>
<style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body { background: #f5f6fa; font-family: "Microsoft YaHei", sans-serif; }
    .topbar {
        background: #fff;
        padding: 14px 40px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        border-bottom: 1px solid #eee;
    }
    .topbar .logo { font-size: 20px; color: #333; }
    .topbar .nav a {
        color: #4a90d9;
        text-decoration: none;
        margin-left: 20px;
        font-size: 14px;
    }
    .container { max-width: 900px; margin: 30px auto; padding: 0 20px; }
    .order-box { background: #fff; border-radius: 8px; padding: 24px; margin-bottom: 20px; }
    .order-head {
        display: flex;
        justify-content: space-between;
        padding-bottom: 12px;
        margin-bottom: 12px;
        border-bottom: 1px solid #f0f0f0;
        font-size: 14px;
        color: #666;
    }
    table { width: 100%; border-collapse: collapse; }
    th, td { padding: 10px; text-align: center; font-size: 14px; border-bottom: 1px solid #f5f5f5; }
    th { color: #999; font-weight: normal; }
    .order-total { text-align: right; padding: 12px 0 0; font-size: 15px; }
    .order-total .amount { color: #e74c3c; font-size: 18px; }
    .empty { text-align: center; color: #999; padding: 40px 0; background: #fff; border-radius: 8px; }
    .empty a { color: #4a90d9; text-decoration: none; }
</style>
</head>
<body>
<div class="topbar">
    <div class="logo">简易商城</div>
    <div class="nav">
        <span style="color:#666;font-size:14px;">欢迎，${sessionScope.user.username}</span>
        <a href="products">继续购物</a>
        <a href="cart">购物车</a>
        <a href="profile">个人中心</a>
        <a href="logout">退出登录</a>
    </div>
</div>
<div class="container">
    <c:choose>
        <c:when test="${empty orders}">
            <div class="empty">
                还没有订单，<a href="products">去下单</a>
            </div>
        </c:when>
        <c:otherwise>
            <c:forEach items="${orders}" var="o">
                <div class="order-box">
                    <div class="order-head">
                        <span>订单号：${o.id}</span>
                        <span>下单时间：${o.createTimeText}</span>
                    </div>
                    <table>
                        <tr>
                            <th>商品</th>
                            <th>单价</th>
                            <th>数量</th>
                            <th>小计</th>
                        </tr>
                        <c:forEach items="${o.items}" var="oi">
                            <tr>
                                <td>${oi.productName}</td>
                                <td>￥${oi.price}</td>
                                <td>${oi.quantity}</td>
                                <td>￥${oi.subtotal}</td>
                            </tr>
                        </c:forEach>
                    </table>
                    <div class="order-total">
                        <div style="text-align:right;font-size:13px;color:#999;margin-bottom:8px;">
                            收货人：${o.receiver}（${o.phone}） | ${o.address} | 支付方式：${o.payment}
                        </div>
                        订单总价：<span class="amount">￥${o.totalPrice}</span>
                    </div>
                </div>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>

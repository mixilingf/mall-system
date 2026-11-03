<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>下单成功 - 简易商城</title>
<style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body {
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        background: #f5f6fa;
        font-family: "Microsoft YaHei", sans-serif;
    }
    .box {
        background: #fff;
        border-radius: 8px;
        padding: 40px 50px;
        text-align: center;
        box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    }
    .box h2 { color: #27ae60; font-size: 22px; margin-bottom: 14px; font-weight: normal; }
    .box p { color: #666; font-size: 14px; margin-bottom: 8px; }
    .box .amount { color: #e74c3c; font-size: 18px; }
    .box a { color: #4a90d9; text-decoration: none; font-size: 14px; margin: 0 10px; }
    .box .links { margin-top: 20px; }
</style>
</head>
<body>
<div class="box">
    <h2>下单成功</h2>
    <p>订单号：${order.id}</p>
    <p>订单金额：<span class="amount">￥${order.totalPrice}</span></p>
    <p>收货人：${order.receiver}（${order.phone}）</p>
    <p>收货地址：${order.address}</p>
    <p>支付方式：${order.payment}</p>
    <div class="links">
        <a href="order?action=list">查看我的订单</a>
        <a href="products">继续购物</a>
    </div>
</div>
</body>
</html>

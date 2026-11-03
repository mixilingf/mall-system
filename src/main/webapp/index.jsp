<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品列表 - 简易商城</title>
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
    .topbar .nav span { color: #666; font-size: 14px; }
    .container { max-width: 1000px; margin: 30px auto; padding: 0 20px; }
    .product-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 20px;
    }
    .product-card {
        background: #fff;
        border-radius: 8px;
        padding: 20px;
        text-align: center;
        box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    }
    .product-card h3 { font-size: 16px; color: #333; margin-bottom: 8px; font-weight: normal; }
    .product-card .price { color: #e74c3c; font-size: 18px; margin-bottom: 6px; }
    .product-card .desc { color: #999; font-size: 12px; margin-bottom: 14px; }
    .product-card button {
        padding: 8px 20px;
        background: #4a90d9;
        color: #fff;
        border: none;
        border-radius: 4px;
        font-size: 14px;
        cursor: pointer;
    }
    .product-card button:hover { background: #3d7cc0; }
</style>
</head>
<body>
<div class="topbar">
    <div class="logo">简易商城</div>
    <div class="nav">
        <span>欢迎，${sessionScope.user.username}</span>
        <a href="cart">购物车</a>
        <a href="order?action=list">我的订单</a>
        <a href="profile">个人中心</a>
        <a href="logout">退出登录</a>
    </div>
</div>
<div class="container">
    <div class="product-grid">
        <c:forEach items="${products}" var="p">
            <div class="product-card">
                <h3><a href="products?action=detail&id=${p.id}" style="color:#333;text-decoration:none;">${p.name}</a></h3>
                <div class="price">￥${p.price}</div>
                <div class="desc">${p.description}（库存 ${p.stock}）</div>
                <form action="cart" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="add"/>
                    <input type="hidden" name="id" value="${p.id}"/>
                    <button type="submit">加入购物车</button>
                </form>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>

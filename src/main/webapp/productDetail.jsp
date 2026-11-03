<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${product.name} - 简易商城</title>
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
    .topbar .nav a { color: #4a90d9; text-decoration: none; margin-left: 20px; font-size: 14px; }
    .topbar .nav span { color: #666; font-size: 14px; }
    .container { max-width: 900px; margin: 30px auto; padding: 0 20px; }
    .detail-box {
        background: #fff;
        border-radius: 8px;
        padding: 36px;
        display: flex;
        gap: 36px;
    }
    .detail-left {
        width: 200px;
        height: 200px;
        background: #eef3fb;
        border-radius: 8px;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 64px;
        color: #4a90d9;
        flex-shrink: 0;
    }
    .detail-right { flex: 1; }
    .detail-right h2 { font-size: 24px; color: #333; font-weight: normal; margin-bottom: 14px; }
    .category-tag {
        display: inline-block;
        background: #eef3fb;
        color: #4a90d9;
        font-size: 12px;
        padding: 3px 10px;
        border-radius: 10px;
        margin-bottom: 14px;
    }
    .detail-right .price { color: #e74c3c; font-size: 26px; margin-bottom: 14px; }
    .detail-right .info { color: #666; font-size: 14px; line-height: 1.9; margin-bottom: 10px; }
    .detail-right .stock { color: #999; font-size: 13px; margin-bottom: 24px; }
    .btn {
        display: inline-block;
        padding: 10px 30px;
        background: #4a90d9;
        color: #fff;
        border: none;
        border-radius: 4px;
        font-size: 15px;
        cursor: pointer;
        text-decoration: none;
    }
    .btn:hover { background: #3d7cc0; }
    .back { color: #4a90d9; text-decoration: none; font-size: 14px; margin-left: 16px; }
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
    <div class="detail-box">
        <div class="detail-left">
            <c:choose>
                <c:when test="${product.category == '数码'}">📱</c:when>
                <c:when test="${product.category == '书籍'}">📚</c:when>
                <c:when test="${product.category == '零食'}">🍫</c:when>
                <c:otherwise>🥤</c:otherwise>
            </c:choose>
        </div>
        <div class="detail-right">
            <h2>${product.name}</h2>
            <span class="category-tag">${product.category}</span>
            <div class="price">￥${product.price}</div>
            <div class="info">商品编号：${product.id}</div>
            <div class="info">商品描述：${product.description}</div>
            <div class="stock">库存数量：${product.stock} 件</div>
            <form action="cart" method="post" style="display:inline;">
                <input type="hidden" name="action" value="add"/>
                <input type="hidden" name="id" value="${product.id}"/>
                <button class="btn" type="submit">加入购物车</button>
            </form>
            <a class="back" href="products">← 返回商品列表</a>
        </div>
    </div>
</div>
</body>
</html>

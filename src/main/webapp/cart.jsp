<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>购物车 - 简易商城</title>
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
    .cart-box { background: #fff; border-radius: 8px; padding: 24px; }
    .cart-box h2 { font-size: 20px; color: #333; margin-bottom: 20px; font-weight: normal; }
    table { width: 100%; border-collapse: collapse; }
    th, td { padding: 12px 10px; text-align: center; font-size: 14px; border-bottom: 1px solid #f0f0f0; }
    th { color: #999; font-weight: normal; }
    .qty-input { width: 50px; padding: 4px; text-align: center; border: 1px solid #ccc; border-radius: 3px; }
    .btn {
        padding: 5px 12px;
        border: none;
        border-radius: 3px;
        cursor: pointer;
        font-size: 13px;
    }
    .btn-blue { background: #4a90d9; color: #fff; }
    .btn-red { background: #e74c3c; color: #fff; }
    .btn-gray { background: #ddd; color: #555; }
    .total-row { text-align: right; padding: 16px 0; font-size: 16px; }
    .total-row .amount { color: #e74c3c; font-size: 20px; }
    .actions { text-align: right; margin-top: 10px; }
    .actions .btn { padding: 10px 26px; font-size: 15px; margin-left: 10px; }
    .empty { text-align: center; color: #999; padding: 40px 0; }
    .empty a { color: #4a90d9; text-decoration: none; }
</style>
</head>
<body>
<div class="topbar">
    <div class="logo">简易商城</div>
    <div class="nav">
        <span style="color:#666;font-size:14px;">欢迎，${sessionScope.user.username}</span>
        <a href="products">继续购物</a>
        <a href="order?action=list">我的订单</a>
        <a href="profile">个人中心</a>
        <a href="logout">退出登录</a>
    </div>
</div>
<div class="container">
    <div class="cart-box">
        <h2>我的购物车</h2>
        <c:choose>
            <c:when test="${empty sessionScope.cart or empty sessionScope.cart.items}">
                <div class="empty">
                    购物车是空的，<a href="products">去逛逛</a>
                </div>
            </c:when>
            <c:otherwise>
                <table>
                    <tr>
                        <th>商品</th>
                        <th>单价</th>
                        <th>数量</th>
                        <th>小计</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${sessionScope.cart.items}" var="item">
                        <tr>
                            <td>${item.product.name}</td>
                            <td>￥${item.product.price}</td>
                            <td>
                                <form action="cart" method="post" style="display:inline;">
                                    <input type="hidden" name="action" value="update"/>
                                    <input type="hidden" name="id" value="${item.product.id}"/>
                                    <input class="qty-input" type="text" name="qty" value="${item.quantity}"/>
                                    <button class="btn btn-blue" type="submit">修改</button>
                                </form>
                            </td>
                            <td>￥${item.subtotal}</td>
                            <td>
                                <form action="cart" method="post" style="display:inline;">
                                    <input type="hidden" name="action" value="remove"/>
                                    <input type="hidden" name="id" value="${item.product.id}"/>
                                    <button class="btn btn-red" type="submit">删除</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <div class="total-row">
                    共 ${sessionScope.cart.totalCount} 件商品，合计：<span class="amount">￥${sessionScope.cart.totalPrice}</span>
                </div>
                <div class="actions">
                    <form action="cart" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="clear"/>
                        <button class="btn btn-gray" type="submit">清空购物车</button>
                    </form>
                    <a href="order?action=checkout" class="btn btn-blue"
                       style="display:inline-block;padding:10px 26px;text-decoration:none;">去结算</a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>
</body>
</html>

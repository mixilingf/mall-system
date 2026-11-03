<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>结算 - 简易商城</title>
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
    .container { max-width: 800px; margin: 30px auto; padding: 0 20px; }
    .box { background: #fff; border-radius: 8px; padding: 30px; margin-bottom: 20px; }
    .box h2 { font-size: 18px; color: #333; font-weight: normal; margin-bottom: 20px; }
    .addr-item {
        border: 1px solid #eee;
        border-radius: 6px;
        padding: 14px 16px;
        margin-bottom: 10px;
    }
    .addr-item input { margin-right: 10px; }
    .addr-item .name { font-size: 15px; color: #333; }
    .addr-item .detail { font-size: 13px; color: #999; margin-top: 4px; }
    .pay-row { margin-bottom: 12px; font-size: 15px; color: #333; }
    .pay-row input { margin-right: 10px; }
    table { width: 100%; border-collapse: collapse; }
    th, td { padding: 10px; text-align: center; font-size: 14px; border-bottom: 1px solid #f5f5f5; }
    th { color: #999; font-weight: normal; }
    .total-row { text-align: right; padding: 16px 0 0; font-size: 16px; }
    .total-row .amount { color: #e74c3c; font-size: 22px; }
    .btn {
        padding: 11px 34px;
        background: #4a90d9;
        color: #fff;
        border: none;
        border-radius: 4px;
        font-size: 15px;
        cursor: pointer;
    }
    .btn:hover { background: #3d7cc0; }
    .submit-row { text-align: right; margin-top: 16px; }
    .empty { text-align: center; color: #999; padding: 20px 0; }
    .empty a { color: #4a90d9; text-decoration: none; }
</style>
</head>
<body>
<div class="topbar">
    <div class="logo">简易商城</div>
    <div class="nav">
        <span>欢迎，${sessionScope.user.username}</span>
        <a href="cart">返回购物车</a>
        <a href="products">商品列表</a>
        <a href="logout">退出登录</a>
    </div>
</div>
<div class="container">
    <form action="order" method="post">
        <input type="hidden" name="action" value="create"/>
        <div class="box">
            <h2>选择收货地址</h2>
            <c:choose>
                <c:when test="${empty addresses}">
                    <div class="empty">
                        还没有收货地址，请先到<a href="address?action=add">添加地址</a>
                    </div>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${addresses}" var="a" varStatus="st">
                        <div class="addr-item">
                            <input type="radio" name="addressId" value="${a.id}"
                                   ${a.isDefault || st.first ? 'checked' : ''}/>
                            <span class="name">${a.receiver}</span>
                            <span style="color:#999;font-size:13px;">（${a.phone}）</span>
                            <c:if test="${a.isDefault}"><span class="tag" style="background:#4a90d9;color:#fff;font-size:12px;padding:2px 8px;border-radius:8px;">默认</span></c:if>
                            <div class="detail">${a.address}</div>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="box">
            <h2>选择支付方式</h2>
            <div class="pay-row">
                <input type="radio" name="payment" value="支付宝" checked/>支付宝
            </div>
            <div class="pay-row">
                <input type="radio" name="payment" value="微信支付"/>微信支付
            </div>
            <div class="pay-row">
                <input type="radio" name="payment" value="货到付款"/>货到付款
            </div>
        </div>
        <div class="box">
            <h2>订单商品</h2>
            <table>
                <tr>
                    <th>商品</th>
                    <th>单价</th>
                    <th>数量</th>
                    <th>小计</th>
                </tr>
                <c:forEach items="${sessionScope.cart.items}" var="item">
                    <tr>
                        <td>${item.product.name}</td>
                        <td>￥${item.product.price}</td>
                        <td>${item.quantity}</td>
                        <td>￥${item.subtotal}</td>
                    </tr>
                </c:forEach>
            </table>
            <div class="total-row">
                应付总额：<span class="amount">￥${sessionScope.cart.totalPrice}</span>
            </div>
            <div class="submit-row">
                <button class="btn" type="submit"
                        ${empty addresses ? 'disabled style="background:#ccc;cursor:not-allowed;"' : ''}>提交订单</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>

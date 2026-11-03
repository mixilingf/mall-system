<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>收货地址 - 简易商城</title>
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
    .container { max-width: 700px; margin: 30px auto; padding: 0 20px; }
    .box { background: #fff; border-radius: 8px; padding: 30px; }
    .box h2 { font-size: 18px; color: #333; font-weight: normal; margin-bottom: 20px; }
    .addr-item {
        border: 1px solid #eee;
        border-radius: 6px;
        padding: 16px;
        margin-bottom: 14px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .addr-item.default { border-color: #4a90d9; background: #f8fbff; }
    .addr-info .name { font-size: 15px; color: #333; margin-bottom: 6px; }
    .addr-info .detail { font-size: 13px; color: #999; }
    .tag {
        background: #4a90d9;
        color: #fff;
        font-size: 12px;
        padding: 2px 8px;
        border-radius: 8px;
        margin-left: 8px;
    }
    .addr-actions a { color: #4a90d9; text-decoration: none; font-size: 13px; margin-left: 12px; }
    .addr-actions a.del { color: #e74c3c; }
    .add-btn {
        display: inline-block;
        padding: 10px 26px;
        background: #4a90d9;
        color: #fff;
        border-radius: 4px;
        text-decoration: none;
        font-size: 14px;
        margin-top: 6px;
    }
    .empty { text-align: center; color: #999; padding: 30px 0; }
</style>
</head>
<body>
<div class="topbar">
    <div class="logo">简易商城</div>
    <div class="nav">
        <span>欢迎，${sessionScope.user.username}</span>
        <a href="products">商品列表</a>
        <a href="cart">购物车</a>
        <a href="profile">个人中心</a>
        <a href="logout">退出登录</a>
    </div>
</div>
<div class="container">
    <div class="box">
        <h2>收货地址管理</h2>
        <c:choose>
            <c:when test="${empty addresses}">
                <div class="empty">还没有收货地址</div>
            </c:when>
            <c:otherwise>
                <c:forEach items="${addresses}" var="a">
                    <div class="addr-item ${a.isDefault ? 'default' : ''}">
                        <div class="addr-info">
                            <div class="name">
                                ${a.receiver}
                                <c:if test="${a.isDefault}"><span class="tag">默认</span></c:if>
                            </div>
                            <div class="detail">${a.phone}</div>
                            <div class="detail">${a.address}</div>
                        </div>
                        <div class="addr-actions">
                            <c:if test="${not a.isDefault}">
                                <a href="address?action=default&id=${a.id}">设为默认</a>
                            </c:if>
                            <a href="address?action=edit&id=${a.id}">编辑</a>
                            <a class="del" href="address?action=delete&id=${a.id}"
                               onclick="return confirm('确定删除该地址吗？')">删除</a>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        <a class="add-btn" href="address?action=add">+ 新增收货地址</a>
    </div>
</div>
</body>
</html>

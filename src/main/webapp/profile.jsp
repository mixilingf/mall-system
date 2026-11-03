<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>个人中心 - 简易商城</title>
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
    .box { background: #fff; border-radius: 8px; padding: 30px; margin-bottom: 20px; }
    .box h2 { font-size: 18px; color: #333; font-weight: normal; margin-bottom: 20px; }
    .info-row { font-size: 14px; color: #666; padding: 8px 0; border-bottom: 1px solid #f5f5f5; }
    .info-row:last-child { border-bottom: none; }
    .info-row .label { display: inline-block; width: 100px; color: #999; }
    .links { margin-top: 16px; }
    .links a {
        display: inline-block;
        padding: 8px 18px;
        background: #eef3fb;
        color: #4a90d9;
        border-radius: 4px;
        text-decoration: none;
        font-size: 14px;
        margin-right: 10px;
    }
    .form-row { margin-bottom: 14px; }
    .form-row label { display: inline-block; width: 90px; font-size: 14px; color: #666; }
    .form-row input[type="password"] {
        width: 260px;
        padding: 9px 12px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 14px;
        outline: none;
    }
    .form-row input[type="password"]:focus { border-color: #4a90d9; }
    .btn {
        padding: 9px 26px;
        background: #4a90d9;
        color: #fff;
        border: none;
        border-radius: 4px;
        font-size: 14px;
        cursor: pointer;
    }
    .btn:hover { background: #3d7cc0; }
    .msg { font-size: 14px; margin-bottom: 12px; }
    .msg.ok { color: #27ae60; }
    .msg.err { color: #e74c3c; }
</style>
</head>
<body>
<div class="topbar">
    <div class="logo">简易商城</div>
    <div class="nav">
        <span>欢迎，${sessionScope.user.username}</span>
        <a href="products">商品列表</a>
        <a href="cart">购物车</a>
        <a href="order?action=list">我的订单</a>
        <a href="logout">退出登录</a>
    </div>
</div>
<div class="container">
    <div class="box">
        <h2>基本信息</h2>
        <div class="info-row"><span class="label">用户名</span>${sessionScope.user.username}</div>
        <div class="links">
            <a href="address">收货地址管理</a>
            <a href="order?action=list">我的订单</a>
        </div>
    </div>
    <div class="box">
        <h2>修改密码</h2>
        <c:if test="${not empty msg}">
            <div class="msg ${msg == '密码修改成功' ? 'ok' : 'err'}">${msg}</div>
        </c:if>
        <form action="profile" method="post">
            <input type="hidden" name="action" value="password"/>
            <div class="form-row">
                <label>原密码</label>
                <input type="password" name="oldPassword"/>
            </div>
            <div class="form-row">
                <label>新密码</label>
                <input type="password" name="newPassword"/>
            </div>
            <div class="form-row">
                <label>确认新密码</label>
                <input type="password" name="confirm"/>
            </div>
            <button class="btn" type="submit">确认修改</button>
        </form>
    </div>
</div>
</body>
</html>

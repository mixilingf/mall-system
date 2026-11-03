<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${empty addr ? '新增' : '编辑'}收货地址 - 简易商城</title>
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
    .container { max-width: 600px; margin: 30px auto; padding: 0 20px; }
    .box { background: #fff; border-radius: 8px; padding: 30px; }
    .box h2 { font-size: 18px; color: #333; font-weight: normal; margin-bottom: 24px; }
    .form-row { margin-bottom: 16px; }
    .form-row label { display: inline-block; width: 80px; font-size: 14px; color: #666; }
    .form-row input[type="text"] {
        width: 320px;
        padding: 9px 12px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 14px;
        outline: none;
    }
    .form-row input[type="text"]:focus { border-color: #4a90d9; }
    .btn {
        padding: 9px 30px;
        background: #4a90d9;
        color: #fff;
        border: none;
        border-radius: 4px;
        font-size: 14px;
        cursor: pointer;
        margin-left: 84px;
    }
    .btn:hover { background: #3d7cc0; }
    .back { color: #4a90d9; text-decoration: none; font-size: 14px; margin-left: 14px; }
    .error { color: #e74c3c; font-size: 13px; margin-bottom: 12px; }
</style>
</head>
<body>
<div class="topbar">
    <div class="logo">简易商城</div>
    <div class="nav">
        <span style="color:#666;font-size:14px;">欢迎，${sessionScope.user.username}</span>
        <a href="address">返回地址列表</a>
    </div>
</div>
<div class="container">
    <div class="box">
        <h2>${empty addr ? '新增收货地址' : '编辑收货地址'}</h2>
        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>
        <form action="address" method="post">
            <input type="hidden" name="id" value="${empty addr ? '0' : addr.id}"/>
            <div class="form-row">
                <label>收货人</label>
                <input type="text" name="receiver" value="${addr.receiver}"/>
            </div>
            <div class="form-row">
                <label>联系电话</label>
                <input type="text" name="phone" value="${addr.phone}"/>
            </div>
            <div class="form-row">
                <label>详细地址</label>
                <input type="text" name="address" value="${addr.address}"/>
            </div>
            <button class="btn" type="submit">保存</button>
            <a class="back" href="address">取消</a>
        </form>
    </div>
</div>
</body>
</html>

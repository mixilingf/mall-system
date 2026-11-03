<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录 - 简易商城</title>
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
    .login-form { width: 300px; }
    .login-form h2 {
        text-align: center;
        font-size: 24px;
        color: #333;
        margin-bottom: 30px;
        font-weight: normal;
    }
    .login-form input[type="text"],
    .login-form input[type="password"] {
        width: 100%;
        padding: 10px 12px;
        margin-bottom: 14px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 14px;
        outline: none;
    }
    .login-form input[type="text"]:focus,
    .login-form input[type="password"]:focus { border-color: #4a90d9; }
    .login-form input[type="submit"] {
        width: 100%;
        padding: 10px;
        margin-top: 6px;
        background: #4a90d9;
        color: #fff;
        border: none;
        border-radius: 4px;
        font-size: 15px;
        cursor: pointer;
    }
    .login-form input[type="submit"]:hover { background: #3d7cc0; }
    .error { color: #e74c3c; text-align: center; font-size: 13px; margin-bottom: 10px; }
    .tip { text-align: center; font-size: 13px; color: #999; margin-top: 16px; }
    .tip a { color: #4a90d9; text-decoration: none; }
</style>
</head>
<body>
<div class="login-form">
    <h2>简易商城</h2>
    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>
    <form action="login" method="post">
        <input type="text" name="username" placeholder="用户名"/>
        <input type="password" name="password" placeholder="密码"/>
        <input type="submit" value="登录"/>
    </form>
    <div class="tip">还没有账号？<a href="register.jsp">去注册</a></div>
</div>
</body>
</html>

package com.mall.web;

import com.mall.dao.UserDao;
import com.mall.entity.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ProfileServlet extends HttpServlet {
    private UserDao userDao = new UserDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/profile.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("password".equals(action)) {
            User user = (User) req.getSession().getAttribute("user");
            String oldPassword = req.getParameter("oldPassword");
            String newPassword = req.getParameter("newPassword");
            String confirm = req.getParameter("confirm");
            if (newPassword == null || newPassword.isEmpty()) {
                req.setAttribute("msg", "新密码不能为空");
            } else if (!newPassword.equals(confirm)) {
                req.setAttribute("msg", "两次输入的新密码不一致");
            } else if (userDao.changePassword(user.getUsername(), oldPassword, newPassword)) {
                req.setAttribute("msg", "密码修改成功");
            } else {
                req.setAttribute("msg", "原密码错误");
            }
            req.getRequestDispatcher("/profile.jsp").forward(req, resp);
        }
    }
}

package com.mall.web;

import com.mall.dao.AddressDao;
import com.mall.entity.Address;
import com.mall.entity.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddressServlet extends HttpServlet {
    private AddressDao addressDao = new AddressDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        String action = req.getParameter("action");
        if ("add".equals(action)) {
            req.getRequestDispatcher("/addressForm.jsp").forward(req, resp);
        } else if ("edit".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            req.setAttribute("addr", addressDao.findById(id));
            req.getRequestDispatcher("/addressForm.jsp").forward(req, resp);
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            addressDao.delete(id);
            resp.sendRedirect(req.getContextPath() + "/address");
        } else if ("default".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            addressDao.setDefault(user.getUsername(), id);
            resp.sendRedirect(req.getContextPath() + "/address");
        } else {
            req.setAttribute("addresses", addressDao.findByUsername(user.getUsername()));
            req.getRequestDispatcher("/addressList.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        String idStr = req.getParameter("id");
        String receiver = req.getParameter("receiver");
        String phone = req.getParameter("phone");
        String addressText = req.getParameter("address");
        if (receiver == null || receiver.trim().isEmpty()
                || phone == null || phone.trim().isEmpty()
                || addressText == null || addressText.trim().isEmpty()) {
            req.setAttribute("error", "收货人、电话、地址都不能为空");
            if (idStr != null && !idStr.isEmpty()) {
                req.setAttribute("addr", addressDao.findById(Integer.parseInt(idStr)));
            }
            req.getRequestDispatcher("/addressForm.jsp").forward(req, resp);
            return;
        }
        if (idStr == null || idStr.isEmpty() || "0".equals(idStr)) {
            Address address = new Address(user.getUsername(), receiver.trim(), phone.trim(), addressText.trim());
            address.setIsDefault(addressDao.findByUsername(user.getUsername()).isEmpty());
            addressDao.add(address);
        } else {
            Address address = addressDao.findById(Integer.parseInt(idStr));
            address.setReceiver(receiver.trim());
            address.setPhone(phone.trim());
            address.setAddress(addressText.trim());
            addressDao.update(address);
        }
        resp.sendRedirect(req.getContextPath() + "/address");
    }
}

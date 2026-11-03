package com.mall.web;

import com.mall.dao.AddressDao;
import com.mall.dao.OrderDao;
import com.mall.entity.Address;
import com.mall.entity.Cart;
import com.mall.entity.CartItem;
import com.mall.entity.Order;
import com.mall.entity.OrderItem;
import com.mall.entity.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrderServlet extends HttpServlet {
    private OrderDao orderDao = new OrderDao();
    private AddressDao addressDao = new AddressDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("list".equals(action)) {
            User user = (User) req.getSession().getAttribute("user");
            req.setAttribute("orders", orderDao.findByUsername(user.getUsername()));
            req.getRequestDispatcher("/orders.jsp").forward(req, resp);
        } else if ("checkout".equals(action)) {
            User user = (User) req.getSession().getAttribute("user");
            Cart cart = (Cart) req.getSession().getAttribute("cart");
            if (cart == null || cart.getItems().isEmpty()) {
                resp.sendRedirect(req.getContextPath() + "/cart");
                return;
            }
            req.setAttribute("addresses", addressDao.findByUsername(user.getUsername()));
            req.getRequestDispatcher("/checkout.jsp").forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/cart");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        HttpSession session = req.getSession();
        if ("create".equals(action)) {
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null || cart.getItems().isEmpty()) {
                resp.sendRedirect(req.getContextPath() + "/cart");
                return;
            }
            User user = (User) session.getAttribute("user");
            int addressId = Integer.parseInt(req.getParameter("addressId"));
            String payment = req.getParameter("payment");
            Address address = addressDao.findById(addressId);
            if (address == null || payment == null) {
                resp.sendRedirect(req.getContextPath() + "/order?action=checkout");
                return;
            }
            List<OrderItem> orderItems = new ArrayList<OrderItem>();
            for (CartItem item : cart.getItems()) {
                orderItems.add(new OrderItem(item.getProduct().getName(),
                        item.getProduct().getPrice(), item.getQuantity()));
            }
            String id = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
            Order order = new Order(id, user.getUsername(), orderItems, cart.getTotalPrice(),
                    address.getReceiver(), address.getPhone(), address.getAddress(), payment);
            orderDao.addOrder(order);
            cart.clear();
            req.setAttribute("order", order);
            req.getRequestDispatcher("/order_success.jsp").forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/cart");
        }
    }
}

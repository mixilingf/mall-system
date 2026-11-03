package com.mall.web;

import com.mall.dao.ProductDao;
import com.mall.entity.Cart;
import com.mall.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class CartServlet extends HttpServlet {
    private ProductDao productDao = new ProductDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/cart.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        String action = req.getParameter("action");
        if ("add".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            Product product = productDao.findById(id);
            if (product != null) {
                cart.add(product);
            }
        } else if ("update".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            int qty = Integer.parseInt(req.getParameter("qty"));
            cart.update(id, qty);
        } else if ("remove".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            cart.remove(id);
        } else if ("clear".equals(action)) {
            cart.clear();
        }
        resp.sendRedirect(req.getContextPath() + "/cart");
    }
}

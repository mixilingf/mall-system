package com.mall.web;

import com.mall.dao.ProductDao;
import com.mall.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ProductServlet extends HttpServlet {
    private ProductDao productDao = new ProductDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("detail".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            Product product = productDao.findById(id);
            if (product == null) {
                resp.sendRedirect(req.getContextPath() + "/products");
                return;
            }
            req.setAttribute("product", product);
            req.getRequestDispatcher("/productDetail.jsp").forward(req, resp);
        } else {
            req.setAttribute("products", productDao.findAll());
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }
}

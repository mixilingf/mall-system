package com.mall.dao;

import com.mall.entity.Order;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class OrderDao {
    private static List<Order> orders = new ArrayList<Order>();

    public void addOrder(Order order) {
        orders.add(order);
    }

    public List<Order> findByUsername(String username) {
        List<Order> result = new ArrayList<Order>();
        for (Order order : orders) {
            if (order.getUsername().equals(username)) {
                result.add(order);
            }
        }
        Collections.reverse(result);
        return result;
    }
}

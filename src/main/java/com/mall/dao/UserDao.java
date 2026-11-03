package com.mall.dao;

import com.mall.entity.User;

import java.util.HashMap;
import java.util.Map;

public class UserDao {
    private static Map<String, User> users = new HashMap<String, User>();

    static {
        users.put("admin", new User("admin", "123456"));
        users.put("zhangsan", new User("zhangsan", "123456"));
    }

    public User findByUsername(String username) {
        return users.get(username);
    }

    public boolean checkLogin(String username, String password) {
        User user = users.get(username);
        return user != null && user.getPassword().equals(password);
    }

    public boolean addUser(User user) {
        if (users.containsKey(user.getUsername())) {
            return false;
        }
        users.put(user.getUsername(), user);
        return true;
    }

    public boolean changePassword(String username, String oldPassword, String newPassword) {
        User user = users.get(username);
        if (user != null && user.getPassword().equals(oldPassword)) {
            user.setPassword(newPassword);
            return true;
        }
        return false;
    }
}

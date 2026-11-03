package com.mall.dao;

import com.mall.entity.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductDao {
    private static Map<Integer, Product> products = new HashMap<Integer, Product>();

    static {
        products.put(1, new Product(1, "无线蓝牙耳机", 299.00, "降噪蓝牙耳机 续航30小时 支持快充", "数码", 100));
        products.put(2, new Product(2, "机械键盘", 399.00, "87键 RGB背光 青轴 全键无冲", "数码", 80));
        products.put(3, new Product(3, "游戏鼠标", 199.00, "16000DPI 电竞鼠标 可编程按键", "数码", 120));
        products.put(4, new Product(4, "4K显示器", 1599.00, "27英寸 IPS面板 4K分辨率 广色域", "数码", 50));
        products.put(5, new Product(5, "智能手表", 899.00, "心率监测 血氧检测 多种运动模式", "数码", 60));
        products.put(6, new Product(6, "移动电源", 129.00, "20000mAh 22.5W快充 双向快充", "数码", 200));
        products.put(7, new Product(7, "《Java核心技术》", 99.00, "Java经典入门书籍 卷I 基础知识", "书籍", 150));
        products.put(8, new Product(8, "《三体》全集", 68.00, "刘慈欣科幻小说 三册全集", "书籍", 200));
        products.put(9, new Product(9, "《活着》", 35.00, "余华长篇小说 经典文学", "书籍", 180));
        products.put(10, new Product(10, "薯片", 8.50, "原味薯片 大包装 香脆可口", "零食", 500));
        products.put(11, new Product(11, "巧克力", 25.90, "牛奶巧克力 100g 丝滑口感", "零食", 300));
        products.put(12, new Product(12, "辣条", 5.00, "经典辣条 5连包 麻辣鲜香", "零食", 800));
        products.put(13, new Product(13, "可乐", 3.50, "330ml 罐装可乐 冰镇更佳", "饮料", 1000));
        products.put(14, new Product(14, "雪碧", 3.50, "330ml 罐装雪碧 清爽柠檬味", "饮料", 1000));
        products.put(15, new Product(15, "橙汁", 6.00, "100%鲜榨橙汁 500ml 无添加", "饮料", 400));
    }

    public List<Product> findAll() {
        return new ArrayList<Product>(products.values());
    }

    public Product findById(int id) {
        return products.get(id);
    }
}

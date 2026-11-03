# mall-system

网络商城（MallDemo）—— 基于 Java Web（Servlet + JSP + JSTL）的简易网络商城，使用 Maven 构建，打包为 WAR 后部署到 Tomcat 运行。

## 功能

- 用户注册 / 登录 / 个人中心
- 商品浏览与详情查看
- 购物车、结算、订单
- 收货地址管理

## 技术栈

- Java 8
- Servlet 4.0 / JSP / JSTL 1.2
- Maven（WAR 打包）
- Tomcat（运行/部署环境）

## 目录结构

```
mall-system/
├── pom.xml                  # Maven 依赖与构建配置
├── src/main/webapp/         # 前端页面（JSP）
│   ├── index.jsp           # 首页
│   ├── login.jsp           # 登录
│   ├── register.jsp        # 注册
│   ├── cart.jsp            # 购物车
│   ├── checkout.jsp         # 结算
│   ├── orders.jsp          # 订单
│   ├── productDetail.jsp   # 商品详情
│   ├── profile.jsp         # 个人中心
│   ├── addressForm.jsp     # 地址表单
│   ├── addressList.jsp     # 地址列表
│   ├── order_success.jsp   # 下单成功
│   └── WEB-INF/web.xml     # 部署描述符
└── src/main/java/          # Servlet 控制器
    ├── com/mall/dao/       # 数据访问层
    ├── com/mall/entity/    # 实体类
    └── com/mall/web/       # Servlet / Filter
```

## 运行方式

1. 用 IntelliJ IDEA 打开本项目（推荐安装 SmartTomcat 插件一键部署）
2. 或执行打包命令生成 war 包：
   ```bash
   mvn clean package
   ```
3. 将生成的 `target/MallDemo.war` 放入 Tomcat 的 `webapps` 目录，启动 Tomcat
4. 浏览器访问 `http://localhost:8080/MallDemo`

## 作者

mixilingf

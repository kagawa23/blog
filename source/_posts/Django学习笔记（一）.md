---
title: Django学习笔记（一）
date: 2017-05-08 08:37:53
tags:
---

今天开始正式学习Django，奉上一张学习曲线
![图片注释](/images/学习曲线.png "如何学习一门技术")

<!--more-->
## 是什么？

### 百科定义

Django是一个开放源代码的**Web应用框架**，由Python写成。采用了MVC的软件设计模式。

### 对比同类型的技术

#### 优点：
1. 完美的文档
2. 全套解决方案
3. 强大的URL路由配置
4. 自助管理后台

#### 缺点：

1. 系统紧耦合
2. Django自带的ORM远不如SQLAlchemy强大
3. Template功能比较弱，不能插入Python代码，要写复杂一点的逻辑需要另外用Python实现Tag或Filter。
4. URL配置虽然强大，但全部要手写
5. Python文件做配置文件，而不是更常见的ini、xml或yaml等形式。
6. Django的auth跟其它模块结合紧密，功能也挺强的，就是做的有点过了 

[浅谈python web框架](https://feilong.me/2011/01/talk-about-python-web-framework)
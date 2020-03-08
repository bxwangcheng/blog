---
title: 对虚拟内存的一些思考
date: 2020-02-15 01:10:00
categories: 
- 技术
tags:
- C++
- 操作系统
- Linux
---

浅析C++内存与操作系统内存管理

![7b3b331544f4f1a141549943a1401bf6660fd90b.jpg](https://i.loli.net/2020/03/02/uF25BUQXekfIzgH.jpg)

<!-- more -->

------

## C++内存管理

栈：存储局部变量、函数返回值等，由操作系统管理
堆：用户使用`new/delete`管理
自由存储区：用户使用`malloc/free`管理
全局/静态存储区
常量存储区



## Linux虚拟地址空间

内核空间
栈：局部变量
映射区
堆：用户分配的
未初始化数据.bss 未初始化的全局/静态变量常量
初始化数据.data 初始化的全局/静态变量常量
代码段.text



## 对应关系





------

## 参考文献

[1] [C/C++内存管理详解](https://chenqx.github.io/2014/09/25/Cpp-Memory-Management/)

[2] [Linux 进程虚拟地址空间布局](https://blog.csdn.net/K346K346/article/details/45592329)
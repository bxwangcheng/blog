---
title: 深拷贝与浅拷贝
date: 2020-02-19 22:21:21
categories: 
- 技术
tags:
- C++
- 操作系统
---

说说深拷贝与浅拷贝

![45162fa8a8a1e94b4ba8e7ca3a0cdc14d0cd4762.png](https://i.loli.net/2020/03/04/VemrSuhfjTI7gDX.png)

<!-- more -->

------

# 浅拷贝&深拷贝操作

**浅拷贝**

仅拷贝数据成员的值，即使数据成员为指针，也只拷贝该地址
C++中拷贝函数的默认行为是浅拷贝



**深拷贝**

在浅拷贝的基础上，同时拷贝其指针成员所指向的资源
即申请新的内存地址存放原地址的资源



# 引申

对诸如shared_ptr这样的资源管理类的copying行为<sup>[注1]</sup>，其深拷贝是指一并拷贝其包覆的资源，而非引用计数等其它行为

[注1] copying行为指copy构造函数和**copy assignment操作符**



------

# 参考文献

[1] Effective C++ 条款14
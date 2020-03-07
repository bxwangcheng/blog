---
title: 从WireShark抓包开始
date: 2020-03-05 23:37:44
categories:
- 技术
- 教程
tags:
- 网络
---

<!-- more -->

------

想自己编写一个http服务器作为个人小项目的起点，首先得对http请求解析对吧。

http请求具体是什么样的呢？WireShark抓个包看看吧

假设我http服务器的ip是192.168.1.55

设置一下WireShark的过滤器：

`ip.src == 192.168.1.55 or ip.dst == 192.168.1.55 `


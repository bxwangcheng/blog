---
title: HTTP1.0、1.1、2.0
date: 2020-02-23 16:42:00
categories: 
- 技术
tags:
- 网络
- HTTP
---

HTTP1.0到HTTP1.1再到HTTP2.0的演化

![3462de7aba4629d2d1ce2fccf91870d0a6eba75c.jpg](https://i.loli.net/2020/03/02/56kMrRL83NsquX1.jpg)

<!-- more -->

------

超文本传输协议，用于客户端也就是浏览与服务器交互的应用层协议

常基于TCP连接，因为TCP具有可靠传输的特性；也可以基于UDP，只是需要客户端与服务器在应用层手动实现可靠传输

HTTP中客户端与服务器的沟通模式是请求-响应模式

客户端发送request报文，服务器返回response报文

报文结构分3段，请求/响应行，请求/响应头，请求/响应消息体

客户端的请求方式主要有：GET获取资源，PUT上传资源，PATCH部分上传资源，DELETE删除资源，HEAD请求头部，CONNECT与代理服务器建立隧道，POST传输数据，OPTION查询支持的请求方法

服务器的响应码主要有：	1xx 目前为止正常；2xx 操作成功；3xx 重定向；4xx 客户端错误； 5xx 服务器错误


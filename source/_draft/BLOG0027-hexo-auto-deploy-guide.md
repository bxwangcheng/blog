---
title: 自建服务器部署个人博客
date: 2020-03-05 01:47:57
categories:
- 教程
tags:
- git
- nginx
---

![hexo.png](https://i.loli.net/2020/03/05/obwXyBMQJuSrTlZ.png)

<!-- more -->

------

`ssh-copy-id -i /path/to/id_rsa git@my_server_ip`

`ssh-keygen -t rsa -C "你的公司或个人邮箱"`

ssh配置完之后仍然需要密码的原因

1. /home/git/.ssh/文件夹权限问题
2. git连接方式问题https改成ssh

https://zhuanlan.zhihu.com/p/68916423

https://www.cnblogs.com/chjbbs/p/5748369.html


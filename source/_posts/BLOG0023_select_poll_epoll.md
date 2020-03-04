---
title: 事件驱动型I/O三连
date: 2020-03-03 01:46:02
categories: 
- 技术
tags:
- Unix
- Linux
- I/O复用
---

![事件驱动IO —— select__,poll__,epoll__.png](https://i.loli.net/2020/03/04/BsZ6lAuo4FW8Cfn.png)

<!-- more -->

------

关键字：同步，阻塞I/O，I/O服用，事件驱动，并发

5种常见的I/O分类什么的就不啰嗦了...
先来看看接口吧……C的接口真是不友好啊

```C
#include <sys/select.h>
#include <sys/time.h>
int select(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exceptfds, struct timeval *timeout);

# include <poll.h>
int poll(struct pollfd *fds, nfds_t nfds, int timeout);

#include <sys/epoll.h>
int epoll_create(int size);
int epoll_ctl(int epfd, int op, int fd, struct epoll_event *event);
int epoll_wait(int epfd, struct epoll_event * events, int maxevents, int timeout);
```



# select

调用`select()`的用户进程！告诉内核！监听多个事件！任意一个返回！就唤醒自己！

`int nfds`：监听多少个文件描述符

`fd_set *readfds`：需要监听可读状态的文件描述符集合

`fd_set *writefds`：需要监听可写状态的文件描述符集合

`fd_set *exceptfds`：需要监听异常状态的文件描述符集合

`struct timeval *timeout`：调用完`select()`后等多久离开：一直等睡眠等待唤醒/睡眠一段时间等待唤醒/不睡眠直接走，下次有机会再来看看有没有fd好了



# poll

调用`poll()`的用户进程！告诉内核！监听多个事件！任意一个返回！就唤醒自己！说完就睡眠了！

`struct pollfd *fds`：要监听的文件描述符 + 要监听的事件 + 实际发生的事件（输出）

`nfds_t nfds`：监听多少个文件描述符

`int timeout`：调用完`poll()`后等多久离开：负值一直等睡眠等待唤醒/正值睡眠一段时间（单位ms）等待唤醒/0不睡眠直接走，下次有机会再来看看有没有fd好了



# epoll


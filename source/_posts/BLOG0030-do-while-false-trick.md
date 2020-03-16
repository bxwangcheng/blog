---
title: do...while(false)的妙用
date: 2020-03-09 00:38:02
categories:
- 技术
tags:
- C++
- 技巧
---

`do...while(false)`是一个只执行一次的循环

由于是一个循环，可以借由`break`直接跳过后面的语句，跳到循环外

有点`goto`的意思

```C++
void func() {
    do {
        if () {
            break;
        }
        if () {
            break;
        }
        if () {
            break;
        }
    }while(false);
   // 做一些别的事情
}
```


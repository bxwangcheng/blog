---
title: sizeof()的一些问题
categories: 
- 技术
tags:
- C++
---

`sizeof()`是运算符

![123.png](https://i.loli.net/2020/03/04/sVczPIRbZjaQLmh.png)

<!-- more -->

------

`sizeof()`在编译期确定一个 类型 或 表达式 等的长度
经过编译期替换后成为一个编译期常量
很简单，但是牵扯到一些C++的细节问题，如下：

```C++
// Visual Studio 2019 x86
cout << sizeof("123456789") << endl;
cout << sizeof("123456789" + 1) << endl;
cout << "123456789" + 1 << endl;
```

运行结果：

```
10
4
23456789
```

几个细节：

`"123456789"`的类型为`const char[10]`；包括结尾的`'\0'`一共10个字符
`sizeof(const char[10])`等价于`sizeof(const char) * 10`
字面值的字符串是字符串常量

`"123456789"`在与操作符`+`运算时，隐式转换为了`char*`
`char* + 1`表示指针移动到下一个字符的位置，仍然是指针


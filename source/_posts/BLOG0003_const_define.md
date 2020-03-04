---
title: const 与 define
categories: 
- 技术
tags:
- C++
---

尽量不要使用`#define`

![69f6be6b56a37ec464160de0e97d6c4fe11ccdf9.png](https://i.loli.net/2020/03/04/vGkuKzdRhJbpyDr.png)

<!-- more -->

------

## 尽量不要使用`#define`

常见用法：

```C++
#define PI 3.14 //建议用const/enum替换
#define MAX(a, b) (a) > (b) ? (a) : (b) //建议用inline替换
```

改进：

```C++
const double pi = 3.14;
enum { pi = 3.14 };
inline int Max(const int& a, const int& b) {
    return a > b ? a : b;
}
```



## 使用`#define`可能引发的问题

`#define`在**预处理阶段**处理；而`const` `enum` `inline` 在**编译阶段**处理

1. 可能导致`#define`的内容没有进入记号表，编译器不会提示替换前的记号
例如上述代码中，编译器报错只会提示`3.14`不会提示`PI`

2. 可能导致`#define`的内容出现多份
例如上述代码中，多个`PI`出现的地方，就会出现多个`3.14`

3. `#define`无视作用域，只能`#undef`解除
  没有C++的封装特性


------

## 参考文献

[1] Effective C++ 改善程序与设计的55个具体做法
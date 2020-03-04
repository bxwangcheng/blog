---
title: STL英雄传 —— vector
categories: 
- 技术
tags:
- C++
- STL英雄传
---

![vector.png](https://i.loli.net/2020/03/04/Z1v4nfACH7Tmgpx.png)

<!-- more -->

------

**关键字**：连续内存，动态分配，快速随机访问

```c++
// 获取属性
iterator begin();
iterator end();
size_type size();
size_type capacity();
size_type max_size();
bool empty();

// 获取元素
reference operator[](size_type);
reference front();
reference front();

// 构造操作
vector<T> container(size_type n, T value);
void push_back(value);

// 元素操作
void pop_back();
iterator erase(iterator first, iterator last);
iterator erase(iterator position);
void clear() {erase(begin(), end())};
```

------

# 细节

## `vector`最多能放多少元素？

做个实验吧！

```C++
// Windows 10 x64, Visual Studio 2019 x86
vector<int> int_arr;
cout << int_arr.max_size() << endl;
cout << INT32_MAX / 2 << endl;

vector<float> flt_arr;
cout << flt_arr.max_size() << endl;
cout << INT32_MAX / 2 << endl;

vector<double> double_arr;
cout << double_arr.max_size() << endl;
cout << INT32_MAX / 4 << endl;
```

运行结果：

```
1073741823
1073741823

1073741823
1073741823

536870911
536870911
```

看起来和`vector`存放的元素有关，再做个实验：

```C++
cout << sizeof(int) << endl;
cout << sizeof(float) << endl;
cout << sizeof(double) << endl;
```

运行结果：

```
4
4
8
```

目前看到的规律：

```
sizeof(T) * vector<T>.max_size() == INT32_MAX / 2
```

到64位程序下验证一下：

```C++
// Windows 10 x64, Visual Studio 2019 x64
vector<int> int_arr;
cout << int_arr.max_size() << endl;
cout << INT64_MAX / 2 << endl;
cout << sizeof(int) << endl;

vector<float> flt_arr;
cout << flt_arr.max_size() << endl;
cout << INT64_MAX / 2 << endl;
cout << sizeof(float) << endl;

vector<double> double_arr;
cout << double_arr.max_size() << endl;
cout << INT64_MAX / 4 << endl;
cout << sizeof(double) << endl;
```

运行结果：

```
4611686018427387903
4611686018427387903
4
4611686018427387903
4611686018427387903
4
2305843009213693951
2305843009213693951
8
```

有相同的规律：

```
sizeof(T) * vector<T>.max_size() == INT64_MAX / 2
```




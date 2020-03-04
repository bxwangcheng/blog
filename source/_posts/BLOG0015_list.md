---
title: STL英雄传 —— list
categories: 
- 技术
tags:
- C++
- STL英雄传
---

![list.png](https://i.loli.net/2020/03/02/1FeqP5G8cS64rdA.png)

<!-- more -->

------

关键字：精准把握空间，内存非连续，快速插入与删除，其实是个环💫

```C++
// 串起list的node
template <class T>
struct node {
    node* prev;
    node* next;
    T data;
}
```

挑一个`node`作为空节点就可以打破这个环，成为一个双向链表！

```C++
// 获取属性
iterator begin() {return node->next};
iterator end() {return node};
bool empty();

// 获取元素
reference front();
reference back();

// 构造操作

// 元素操作
void push_back(const T& x);
void push_front(const T& x);
void pop_back();
void pop_front();
iterator erase(iterator position);
void clear();
void remove(const T& value);
void unique(); // 去重

// 基于transefer()的元素接合操作
void splice();
void merge();
void reverse();
void sort();
```


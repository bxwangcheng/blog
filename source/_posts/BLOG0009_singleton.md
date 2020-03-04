---
title: 设计模式 —— 单例
categories: 
- 技术
tags:
- 设计模式
---

简而言之，一个类只有一个实例。

![1b58ef6e3d36a42e01992accf5c52d6eea244353.jpg](https://i.loli.net/2020/03/02/oviMP64GcENXe8u.jpg)

<!-- more -->

------

**懒汉式**：第一次调用时才初始化（延迟初始化）
多线程环境下，多个线程同时发生第一次调用时，产生不确定行为
因此懒汉式又衍生出几种线程安全的版本

**饿汉式**：创建时就初始化
创建之初已经初始化，不会在任何一个线程中执行创建初始化动作，绝对的线程安全

（为了展示纯粹的单例模式代码，本文暂不考虑内存泄漏的问题）

------

## 原始版本

### 懒汉式 - 线程不安全

```C++
class Singleton {
    static Singleton* _instance;
    Singleton() {}
    ~Singleton() {}
    
public:
    static Singleton* getInstance();
};

Singleton* Singleton::_instance = nullptr;
Singleton* Singleton::getInstance() {
    if (_instance == nullptr) {
        Singleton::_instance = new Singleton();
    }
    return _instance;
}
```



### 饿汉式 - 线程安全

```C++
class Singleton {
    static Singleton* _instance;
    Singleton() {}
    ~Singleton() {}
    
public:
    static Singleton* getInstance();
};

Singleton* Singleton::_instance = new Singleton();
Singleton* Singleton::getInstance() {
    return _instance;
}
```

------

## 改进的懒汉式

### 懒汉式 - 加锁实现线程安全

```C++
class Singleton {
    static Singleton* _instance;
    Singleton() {}
    ~Singleton() {}
    
public:
    static Singleton* getInstance();
};

Singleton* Singleton::_instance = nullptr;
Singleton* Singleton::getInstance() {
    if (_instance == nullptr) {
        Lock lock;
    }
    if (_instance == nullptr) {
        Singleton::_instance = new Singleton();
    }
    
    return _instance;
}
```



### 懒汉式 - C++11之 local static 实现线程安全

```C++
class Singleton {
    Singleton() {}
    ~Singleton() {}
    
public:
    static Singleton* getInstance();
};

Singleton* Singleton::getInstance() {
    static Singleton* _instance;
    return _instance;
}
```
---
title: 全排列中的数学方法
categories: 
- 技术
tags:
- 算法
- 数学
- 字符串
---

**字典序**法与**迭代**法解决全排列问题

![0841881c44e2956f6fedf41a0ca46e174e6379a3.png](https://i.loli.net/2020/03/03/H74KmTORES9AvbV.png)

<!-- more -->

------

# 字典序

## 问题1：寻找字典序全排列下的下一个字符串

定义p是[1,n]的某个全排列中的字符串，p<sub>n</sub>是处于n位置的字符

p = p<sub>1</sub>p<sub>2</sub>p<sub>3</sub>...p<sub>n </sub>

p = p<sub>1</sub>p<sub>2</sub>...p<sub>j-1</sub>p<sub>j</sub>p<sub>j+1</sub>...p<sub>k-1</sub>p<sub>k</sub>p<sub>k+1</sub>...p<sub>n</sub>

步骤一：从后往前一位一位找，找到第一个开始下降的位置 j - 1

步骤二：从 j - 1 往后一位一位找，找到最后一个大于 j - 1 位置的数的位置 k

步骤三：交换 j - 1 和 k 位置的数

步骤四：从 j 开始到最后位置逆序



```C++
string getNextPermutation(const string& str) {
    const int N = str.size();
    int dropIndex = N - 2;
    while (dropIndex >= 0 && str[dropIndex] > str[dropIndex + 1]) {
        dropIndex--;
    }
    int nextCharIndex = dropIndex;
    while (nextCharIndex < N && str[nextCharIndex + 1] > str[dropIndex]) {
        nextCharIndex++;
    }
    string next(str);
    swap(next, dropIndex, nextCharIndex);
    reverse(next, dropIndex + 1, N);
    return next;
}

void swap(string& str, const int a, const int b) {
    if (a == b) {
        return;
    }
    char tmp = str[a];
    str[a] = str[b];
    str[b] = tmp;
}

void reverse(string& str, const int start, const int end) {
    if (start < end) {
        int p1 = start;
        int p2 = end - 1;
        while (p1 < p2) {
            swap(str, p1++, p2--);
        }
    }
}
```



# 递归法

## 问题2：12345的全排列共有哪些？

想法：

1开头的 + 2开头的 + 3开头的 + 4开头的 + 5开头的

那么：

1开头的话：2345的全排列怎么求？

2开头的话：1345的全排列怎么区？

……

### 以此来递归

```C++
void process(vector<int>& nums, vector<vector<int>>& result, const int position) {
    if (position == nums.size() - 1) {
        result.push_back(nums);
        return;
    }
    for (int i = position; i < nums.size(); i++) {
        swap(nums, position, i); // 尝试以nums[i]开头的情况
        process(nums, result, position + 1); // 下一个位置开始的序列同样进行全排列
        swap(nums, position, i); // 尝试完了要还原
    }
}

vector<vector<int>> permute(vector<int>& nums) {
    vector<vector<int>> result;
    process(nums, result, 0);
    return result;
}
```

### 输入序列有重复值怎么办

若一个数第二次出现，则不与它交换，增加一个判断

```C++
void process(vector<int>& nums, vector<vector<int>>& result, const int position) {
    if (position == nums.size() - 1) {
        result.push_back(nums);
        return;
    }
    for (int i = position; i < nums.size(); i++) {
        if (isRepeat(arr, i, position)) {
            continue;
        }
        swap(nums, position, i);
        process(nums, result, position + 1);
        swap(nums, position, i);
    }
}

bool isRepeat(vector<int>& arr, const int start, const int end) {
    for (int i = start; i < end; i++) {
        if (arr[i] == arr[end]) {
            return false;
        }
    }
    return true;
}
```


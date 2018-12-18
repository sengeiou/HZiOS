//
//  Function.c
//  C语言基础
//
//  Created by 华天杰 on 2018/10/28.
//  Copyright © 2018年 BQ. All rights reserved.
//

#include "Function.h"


/*
   递归的优缺点
   优点：为某些编程问题提供简单的解决方案
   缺点：消耗计算机的内存资源
 */

void up_and_down(int n){
    printf("Level %d: n location %p\n",n,&n);
    if (n < 4){
        up_and_down(n + 1);
    }
    printf("Level %d: n location %p\n",n,&n);
}

/*
 
 Level 1: n location 0x7ffeefbff54c
 Level 2: n location 0x7ffeefbff52c
 Level 3: n location 0x7ffeefbff50c
 Level 4: n location 0x7ffeefbff4ec
 Level 4: n location 0x7ffeefbff4ec
 Level 3: n location 0x7ffeefbff50c
 Level 2: n location 0x7ffeefbff52c
 Level 1: n location 0x7ffeefbff54c
 
 */

// 分别使用递归和循环来实现阶乘 【尾部递归】

long fact(int n){
    long resut = 1;
    for (int i = 1;i <= n ; i++) {
        resut *=i ;
    }
    return resut;
}

/*
  f(4) = 4 * f(3)
  f(3) = 3 * f(2)
  f(2) = 2 * f(1)
  f(1) = 1
 */

long rfact(int n){
    long result = 1;
    if (n > 1) {
        result = n * rfact(n - 1);
    }else{
        result = 1;
    }
    return result;
}

// 将十进制整数转化为二进制并打印
void to_binary(int n){
    if(n < 0){
        return;
    }
    int r;
    r = n % 2;
    if(n >= 2){
        to_binary(n / 2);
    }
    r==0?printf("0"):printf("1");
}

// 输入制定的进制数b，将整数n转化
void to_base_n(int n ,int b){
    int r = n % b;
    if (n >= b) {
         to_base_n(n / b, b);
    }
    r==0?printf("0"):printf("%d",r);
}

// 将0.1累加100次 ==> 结果为：10.000002
void sum_hundred_float(){
    float sum = 0.0;
    for (int i=0; i<100; i++) {
        sum +=0.1;
    }
    printf("%f\n",sum);
}


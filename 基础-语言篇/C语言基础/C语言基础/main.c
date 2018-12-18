//
//  main.c
//  C语言基础
//
//  Created by 华天杰 on 2018/4/7.
//  Copyright © 2018年 BQ. All rights reserved.
//

#include <stdio.h>
#include "Message.h"
#include "Function.h"



/*
  （1）C语言程序的运行
    1> 编译 :  xx.c
       语法检查、预编译指令导入函数库、编译为二进制文件 ==》xx.obj
    2> 链接 :
       将xx.obj与C语言函数库组合形成可执行的xx.exe文件
 
  （2） 编译时报duplicate symbol for ... 的提示信息error
     1> 项目中存在重复的代码文件
 或者 2> 引入了.c或者.m文件造成的
 
   (3)数据类型
      1> 整型： int long long long
      2> 浮点类型: float double 
      3> 基本数据类型要理解 各种类型的取值范围限制， 【1字节（B）= 8位（bits）】
 
   (4) 运算符
      + - * / %
   (5) 流程控制
     if ... else
     switch(){ case }
     for();
     while();
     do{}while();
    (6) 函数
   （7） 数组
   （8） 字符串
   （9） 指针
   （10）结构体
   （11）
 
 */



int main(int argc, const char * argv[]) {
    
    //to_base_n(129, 8);
    //to_binary(9);
    sum_hundred_float();
    return 0;
}

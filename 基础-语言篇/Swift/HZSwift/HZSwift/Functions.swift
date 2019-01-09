//
//  Functions.swift
//  Swift_Start
//
//  Created by dafy on 16/1/19.
//  Copyright © 2016年 Dafy. All rights reserved.
/*
   Swift的函数理解：
   （1）函数作为一种数据类型，可作为入参和返回值
 
 */

import Cocoa

class Functions: NSObject {
    
    func greet(person:String) -> String {
        return "hello" + person
    }
    
    func pressAction(tag:Int) -> Void {
        callFriends(friendsName: "li")
        sayHelloe(personName1: "Li")
    }
 
    // 函数定义与调用
    func sayHelloe(personName1 personName:String){

    }
    
    func callFriends(friendsName name:String) -> Void {
        print(name)
    }
    
    
    func sayHellos() ->String{
        
      callFriends(friendsName: "huatianjie")
        
      return greet(person: "hua")
    }
    
    func sayHello(_ personName:String)->String{
        let greeting = "hello" + personName + "!";
        return greeting;
    }
    
    // 默认参数值
    func someFunction(another:Int,_ parameterWithDefault:Int = 12){
    
    }
    
    // 可变参数(一个函数最多只有一个可变参数)
    func arithmeticMean(_ numbers:Double...)->Double{
        var total:Double = 0.0
        for number in numbers{
           total += number
        }
        return total / Double(numbers.count)
    }
    
    
    // 常量参数和变量参数（函数的内部想改变入参的值）
    func alignRight(_ str:String)->String{
        var str = str
        str = "hello say"
        return str
    }
    
    
    // 输入输出参数：一个参数在函数体内修改后，在函数作用域外想要保持修改，就把此参数定义为输入输出参数
    // 类似C语言中的函数的入参是指针类型
    
    func swapTwoInt(_ a:inout Int,b:inout Int){
        let tempInt = a
               a=b
               b=tempInt
    }
    /*
       let a = 3
       let b = 107
       swapTwoInt(&a,&b)
    */
    
    
    
    //函数类型 ：由函数的参数类型和返回类型组成
    func addTwoInts(_ a:Int,b:Int)->Int{
        return a+b
    }
    func mutiplyTwoInts(_ a:Int,b:Int)->Int{
        return a*b
    }
    // 上面两个函数的类型是 （Int,Int）->Int
    
   // 使用函数类型
   // var mathFunction:(Int,Int)->Int = addTwoInt
    
    // 函数类型作为参数类型
    func printMathResult(_ mathFunction:(Int,Int)->Int,a:Int,b:Int){
       print(mathFunction(a,b))
    }
    
    // 函数类型作为返回类型
    func backwardStep(input:Int)->Int{
      return input - 1
    }
    
    func forwardStep(input:Int)->Int{
      return input + 1
    }
    
    func chooseStepFunction(backStep:Bool)->(Int)->Int{
       return backStep ? backwardStep : forwardStep;
    }
    
    /*
     
     */
}


    

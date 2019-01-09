//
//  BasicOperators.swift
//  Swift_Start
//
//  Created by dafy on 16/1/18.
//  Copyright © 2016年 Dafy. All rights reserved.
/*
   运算符：检查、改变、合并值的特殊符号或短语！
 */

import Cocoa

class BasicOperators: NSObject {
    // 基础数据类型
    var int:Int? // 取值范围：（21亿）
    var float:Float? // 32位浮点型 6位小数
    var double:Double? // 64位浮点型 15位小数
    var bool:Bool?// 布尔类型
    var string:String?
    var array:Array<String>?
    var set:Set<String>?
    var dictionary:Dictionary<String,String>?
    // 元组 tuple =>
    var http404error:(Int,String)?
    
    // 类型安全 :  编译阶段检查你使用的变量类型，避免类型使用错误
    // 类型推断 ： 根据对变量的赋值，推断出变量的实际类型
    
    
    func test(){
        
        
        let pi = 3.14
        var userName = "Tom"
        print(pi)
        userName = "Jim"
        print(userName)
        
        let httpErrorCode = ("PageNotFound",404) // 元组
        print(httpErrorCode.0)
        
        let isAlreadyLogin = true
        print(isAlreadyLogin)
        
        var bankCardNumber:String? // 使用安全【未初始化的变量，直接使用会引发异常】
        bankCardNumber = "15151456161616"
        // 可选绑定
        if let tempBankCardNumber = bankCardNumber {
            print(tempBankCardNumber)
        }else{
            print("bankCardNumber is nil")
        }
        // 隐式解析 (一个可选类型一旦知道他一定有值就不需要再继续采用可选绑定继续判断)
        let  userBankCardNumber = bankCardNumber!
        print(userBankCardNumber)
        
        /*
    基本数据类型
         Int：
         Float/Double：
         Bool：true/ false
         String:
    
    集合类型:
         Array:
         Set:
         Dictionary:
    问题1 ：Array和Dictionary两种数据类型的选择？
         （1）集合存储数据并且数据的操作涉及查找，优先选择Array；
         （2）集合存储数据并且数据操作涉及增删改，优先选择Dictionary
         
         */
        
      /*
          nil 问题
         ： Swift 的 nil 和 Objective-C 中的 nil 并不一样。在 Objective-C 中，nil 是一个指向不存在对象的指针。在 Swift 中，nil 不是指针——它是一个确定的值，用来表示值缺失。任何类型的可选状态都可以被设置为 nil，不只是对象类型。
         */
        
        // 赋值运算符
        // 算术运算符(四则运算)
        
        
        // 空合运算符：针对可选类型进行判空的操作
        let defaultColorName = "red"
        var userDefinedColorName:String?
        userDefinedColorName = "yellow"
        let colorNameToUse = userDefinedColorName ?? defaultColorName //
        print(colorNameToUse)
        
        
        // 闭区间运算符
        for index in 1...5{
          print("\(index) * 5 = \(index*5)")
        }
        
        
        // 半开区间运算符
        let names = ["Anna","Alex","Brian","Jack"]
        
        //遍历数组
        for name in names {
            print(name)
        }
        
        let dic = ["key":"value","key1":"value2"];
        let count = names.count
        for i in 0..<count{
           print("第\(i+1)个人叫\(names[i])")
        }
        
        print(dic)
        
        // 可能抛出异常的函数处理 error handling
        do{
           try canThrowAnError()
        }catch{
            
        }
    }
    
    func canThrowAnError() throws{
        print(" 函数 ")
    }
}

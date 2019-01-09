//
//  StringsAndCharacters.swift
//  Swift_Start
//
//  Created by dafy on 16/1/18.
//  Copyright © 2016年 Dafy. All rights reserved.


/*
   Unicode：为每种语言的每个字符设定了统一并唯一的二进制编码，以满足跨语言、跨平台的要求
   8bit = 1 byte  ==> 一个 1 byte最大表示的整数为256
 
   0 ~ 255 用来表示大小写字母、数字、符号，这种编码称为ASCII编码
 
 Unicode ：{
    1> 给所有的字符指定一个唯一对应的数字
    2> 怎么把字符对应的数字保存在计算机中,这才涉及到实际在计算机中占多少字节空间
 }
 
 UTF-8 : 用一个或者两个或者最多三个 表示字符
 UTF-16 : 用两个字节表示字符
 */

import Cocoa

class StringsAndCharacters: NSObject {
    
    func test(){
        
        /*
          Swift的字符串是值类型
         
          值类型：  赋值操作内存中会分配新的地址【深拷贝】
          引用类型： 赋值操作内存中不会分配地址，只是指针赋值
         
         */
        
       //字符串字面量
        let tempString = "qwer"
        let someString = "some string \(tempString) literal value"
        print(someString)
        
        // 初始化一个空字符串
        var emptyString = ""
        var anotherEmptyString = String()
        
        if emptyString.isEmpty{
            emptyString = "123456"
        }else{
            anotherEmptyString = "6789"
            print(anotherEmptyString)
        }
        //字符串的可变性
        var variableString = "Horse"
        variableString += "and carriage"
        print(variableString)
        
        //字符串是值类型
       // 任何情况下都是对已有字符串创建新副本
        
        //使用字符
        let dogName = "annely"
        let containsA = dogName.contains("a")
        print(containsA)
        
        //声明一个字符
        let oneCharacter:Character = "!"
        print(oneCharacter)
        
        let catCharacters:[Character] = ["c","a","t","!"]
        let catString = String(catCharacters)
        print(catString)
        
        //链接字符串和字符
        let string1 = "hello"
        let string2 = "there"
        var welcome = string1 + string2
        print(welcome)
        
        welcome.append(oneCharacter)
        print(welcome)
        
        // 字符串插值
        let multiplier = 3
        let message = "\(multiplier) times 2.5 is \(Double(multiplier)*2.5)"
        print(message)
        
        //Unicode :用于文本的编码和表示 （一个国际标准）
        
        //访问和修改字符串
        let greeting = "Guten Tag!"
        let index = greeting.characters.index(greeting.startIndex, offsetBy: 7)
        let char = greeting[index]
        print(char)
        
        //字符串的插入和删除操作
        
        // 插入字符
        var welcomeCustomer = "welcome"
        welcomeCustomer.insert("!", at: welcomeCustomer.endIndex)
        print(welcomeCustomer)
        
        // 插入字符串
        let there = "there"
        welcomeCustomer.insert(contentsOf: there.characters, at: welcomeCustomer.characters.index(before: welcomeCustomer.endIndex))
        print(welcomeCustomer)
        
        // 字符串的比较
        let compareStr1 = "test"
        let compareStr2 = "test"
        if compareStr1 == compareStr2{
           // 判断两个字符串是否相等
        }else{
           
        }
        
        // 字符串的前缀和后缀
        let perfix = "http://www.baidu.com"
        let suffix = "index.htm"
        let isHttp = perfix.hasPrefix("http")
        let isHtm  = suffix.hasSuffix("htm")
        if isHttp && isHtm{
        
        }else{
        
        }
        
        let testString = "testString"
        let endIndex = testString.count
        print(testString + "length:\( endIndex + 1)")
        
        // 格式化输出字符串
        let totalMoney = 123.456789
        let totalMoneyString = String(format:"%.2f",totalMoney)
        print(totalMoneyString)
                 
    }
    // 格式化输出字符串
    func numberFormat(){
        let format = NumberFormatter()
        format.numberStyle = .decimal
        let formatString = format.string(from: NSNumber(value:12345678.98989))
        print(formatString!)
        /*
         //显示样式和输出样式
         numberStyle:
         public enum Style : UInt {
         
         case none //1234567.89
         
         case decimal //1,234,567.89
         
         case currency //￥1,234,567.89
         
         case percent //123,456,789%
         
         case scientific //1.23456789E6
         
         case spellOut //一百二十三万四千五百六十七点八九
         
         @available(iOS 9.0, *)
         case ordinal //第123,4568
         
         @available(iOS 9.0, *)
         case currencyISOCode //CNY1,234,567.89
         
         @available(iOS 9.0, *)
         case currencyPlural//1,234,567.89人民币
         
         @available(iOS 9.0, *)
         case currencyAccounting//￥1,234,567.89
         }
         
         //输入123456789分别输出
         // 123456789
         // 123,456,789
         //￥123,456,789.00
         //12345678900%
         //1.23456789E8
         //一亿二千三百四十五万六千七百八十九
         //第1,2345,6789
         //CNY123,456,789.00
         //123,456,789.00人民币
         //￥123,456,789.00
         */
    }
}

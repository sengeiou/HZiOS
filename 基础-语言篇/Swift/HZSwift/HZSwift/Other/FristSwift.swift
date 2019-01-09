//
//  FristSwift.swift
//  HZSwift
//
//  Created by apple on 16/10/27.
//  Copyright © 2016年 HZ. All rights reserved.
//

import Cocoa

class FristSwift: NSObject {
    // 类的属性声明
    var name: String?// 在类型后面加一个问号来标记这个变量的值是可选的
    var address:String?//可能有值可能为nil
    
    // 属性的get 和 set 方法
    var age:Int {
        get{
          return self.age
        }
        set{
           self.age = newValue
        }
    }
    
    //  初始化构造器
    init(name:String,address:String) {
        self.name = name
        self.address = address
    }
    
    // 函数的使用
    func firstSwiftTestFuc() -> Void {
        /*
         数组的创建
         (1) 和OC相比较而言swift中的数组中存储的类型是确定，这样保证了类型安全
         (2) 数组的可变和不可变是根据你声明数组是常量还是变量来决定的
         */
        var items = [String]() // 使用特定类型构建空数组
        items.append("1")
        items.append("2")
        // 在数组的第一个位置插入数据项
        items.insert("first", at: 0)
        // 遍历数组
        for item in items {
            print(item)
        }
//        for(index,value) in enumer{
//           
//        }
        // 移除数据
        items.removeFirst()
        // 数组提供默认的构造函数
        var threeDoubles = [Double](repeating:0.0,count:3)
        threeDoubles[0] = 1.1
        // 使用 + 可以将两个存储相同数据类型的数组 组合
        let  anotherDoublesArray = [Double](repeating:0.0,count:3)
        var sixDoubles = threeDoubles + anotherDoublesArray
        sixDoubles[0] = 2.1
        
        /*
          集合：
            没有特定顺序，确保每个元素只出现一次
         */
        var letters  = Set<Character>()
        letters.insert("a")
        var favouriteGenres:Set<String> = ["Rock","Class","Hip hop"];
        favouriteGenres.insert("MingYao")
        
        // 字典
        var bankDictionary = [String:String]()
        bankDictionary["bank1"] = "bank1Logo"
        bankDictionary["bank2"] = "bank2Logo"
        bankDictionary.updateValue("bank3Logo", forKey: "bank3Logo")
        for (value,key) in bankDictionary {
            print(value,key)
        }
        // 字典的初始化
        var blankDic = Dictionary<String,String>()
        blankDic.updateValue("test", forKey: "test")
        
        // 元组的使用  
        let httpStatus = (code:400,message:"ok")
        print(httpStatus.code)
    }
    
    /*
      swift的函数使用
     */
    func sayHelloAgain(personName:String)->String{
       return "Hello again," + personName + "!"
    }
    // 多重返回值函数(函数的返回值是一个元组)
    func countNumber(string:String) -> (para1:Int,para2:Int) {
        return (1,2);
    }
    func containsCharacter(paraNameEx1 paraName1: String , paraNameEx2 paramName2: String) -> Void {
        
    }
    func arithmeticMean(numbers: Double...) -> Void {
        // 接收可变参数
    }
    
    func swapTwoInts( a:inout Int, b:inout Int) -> Void {
        let temporaryA = a
        a  = b
        b = temporaryA
    }
    // 函数类型  
    func  addTwoInt1(a:Int,b:Int)->Int{
       return a + b
     }
    
    /*
       闭包
     */
    func closureFuc(){
        let names = ["tom","div","jim"];
        let reversed = names.sorted(by: {
            (string1:String,string2:String)->Bool in
            string1 > string2
        })
        print(reversed)
    }
    
    // 泛型函数  
    func repeatData<ItemType>(item:ItemType,times:Int) -> [ItemType] {
        var tempItems = [ItemType]()

        for _ in 0 ..< times {
            tempItems.append(item)
        }
        return tempItems
    }
    
}

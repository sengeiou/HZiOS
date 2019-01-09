//
//  Genericity.swift
//  HZSwift
//
//  Created by 华天杰 on 2017/3/27.
//  Copyright © 2017年 HZ. All rights reserved.
//

import Foundation
/*
 泛型：在强类型语言中使用占位类型，等待具体使用时再指定具体的类型
 */

class GenericityTest{
    // 交换两个参数的位置 泛型函数
    func SwapTwoValues<T>(_ a: inout T,_ b: inout T){
        let tempValues = a;
        a = b;
        b = tempValues;
    }
    
    func testSwap(){
        var aString = "hello"
        var bString = "world"
        SwapTwoValues(&aString, &bString)
    }
}

/*
 
   类型参数：无实际意义可以使用T,U这种；有实际意义可以定义 Dictionary<key,value>
   类型约束：制定类型参数是某个类的子类或是遵守某项协议；
 */

func findIndex<T:Equatable>(of valueToFind:T,in array:[T])->Int?{
    // T 必须遵守Equatable协议
    for (index,value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}


/*
   自定义泛型类型；
   像Swift中的Array和Dictionary，可以存储多种数据类型的值
 */
struct Stack<ItemsType> {
    var items = [ItemsType]()
     mutating func pop()->ItemsType{
     return items.removeLast()
    }
    mutating func push(item:ItemsType){
      items.append(item)
    }
}

/*
   扩展一个参数类型；
  在扩展中可以直接使用泛型中的类型参数
 */

extension Stack{
    var topItem:ItemsType?{
        return items.isEmpty ? nil : items[items.count - 1]
    }
}


/*
   关联类型：声明协议中使用associatedtype定义关联类型；在实际遵守协议的类中指定即可
 */

protocol Container {
    associatedtype ItemType
    mutating func append(_ item:ItemType)
    var count:Int{get}
    subscript(i:Int)->ItemType{get}
}

struct IntStack:Container {
    var items =  [Int]()
    
    mutating func push(_ item:Int){
       items.append(item)
    }
    mutating func pop()->Int {
      return items.removeLast()
    }
    
    mutating func append(_ item:Int) {
        self.push(item)
    }
    var count: Int{
      return items.count
    }
    subscript(i:Int)->Int{
       return items[i]
    }
}

/*
   通过扩展一个存在的类型来指定关联类型
 */

extension Array:Container{}


/*
   泛型 where语句,可以对类型参数做一些强制要求
 */

func allItemsMatch<C1:Container,C2:Container>(_ someContainer:C1,_ anotherContainer:C2)->Bool
where C1.ItemType == C2.ItemType ,C1.ItemType:Equatable
{
    if someContainer.count != anotherContainer.count {
        return false
    }
    for i in 0..<someContainer.count{
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    
    return true
}




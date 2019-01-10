//
//  CollectionTypes.swift
//  Swift_Start
//
//  Created by dafy on 16/1/18.
//  Copyright © 2016年 Dafy. All rights reserved.
//

import Cocoa

class CollectionTypes: NSObject {
    func test(){
        // swift中集合是否可变 取决于集合声明为常量还是变量
        
        //---------数组（Arrays）有序数据的集合----------
        var someInts = [Int]()
        someInts[0] = 1
        someInts[1] = 2
        someInts.append(3)
        print("someInts count is \(someInts.count)")
        
        //创建带默认值的数组
        let tempIntegers = [1,2,3,4,5]
        print(tempIntegers)
        
        var names = [String](repeatElement("hua", count: 3))
        names.append("li")
        print(names)
        var threeDoubles = [Double](repeating: 3.0, count: 3)
        threeDoubles.append(3.0)
        print(threeDoubles)
        
        
        //通过两个数组相加构建一个数组
        let anotherThreeDoubles = [Double](repeating: 3.0, count: 3)
        let newDoubles = threeDoubles + anotherThreeDoubles
        print(newDoubles)
        
        // 使用字面量创建数组
        var shoppingList:[String] = ["oranges","apple","banana"]
        shoppingList.append("salt")
        shoppingList.append("milk")
        
        let nextShoppingList = ["milk","eggs"]
        print(nextShoppingList)
        
        // 访问和修改数组
        print("shoppinglist count is \(shoppingList.count)")
        shoppingList += ["bread"]//添加数据类型相同的数据项
        //数组判空操作
        if shoppingList.isEmpty{
        
        }else{
        
        }
        // 获取制定index下的值
        let fristObject = shoppingList[0]
        print(fristObject)
        
        //遍历数组
        for item in shoppingList{
            print(item)
        }
        for(index,value)in shoppingList.enumerated(){
          print("\(index) value is \(value)")
        }
        
        shoppingList.remove(at: 0)
        shoppingList.insert("flour", at: 1)
        
        var dataSource = [String]()
        let name = ["1","2","3"];
        dataSource += name // 使用+=向数组中添加单个或多个相同数据类型的元素
        dataSource.removeAll()
        
        
       //集合（Sets）无序无重复数据的集合
        var normalSet = Set<String>()
        normalSet.insert("1")
        normalSet.insert("2")
        normalSet.remove("2")
        print(normalSet)
        let favouriteGenres:Set<String> = ["rock","classic","hip hop"]
        let newSets:Set = ["1","2","3"]
        print(favouriteGenres)
        print(newSets)
        
        
        
        //字典（Dictionary）无序键值对的数据的集合
        var namesOfIntegers = [String:Int]()
        namesOfIntegers["first"] = 1

        
        //字面量定义字典
        var items:[String:String] = [:];
        items["key1"] = "value1";
        
        var newDic:[String:String] = ["frist":"1","second":"2"]
        newDic["thrid"] = "3"
        newDic.updateValue("4", forKey: "forth")//存在key就更新value，不存在就新增
        
        let userInfo = ["name":"hua"]
        let name1 = userInfo["name"] ?? "" // 保证获取的值为空时，有默认值
        print(name1)
        
        //字典的遍历
        for(key,value)in newDic{
          print("\(key) of value is \(value)")
        }
        let keys =  newDic.keys.sorted()
        print(keys)
    }
}

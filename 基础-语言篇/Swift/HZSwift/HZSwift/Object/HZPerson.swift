//
//  HZPerson.swift
//  HZSwift
//
//  Created by 华天杰 on 2018/9/26.
//  Copyright © 2018年 HZ. All rights reserved.
//

import Cocoa

class HZPerson: NSObject {
    var name: String?
    var sex: Int?
    var age: Int?
    var address: String?
    var graduateSchool: [String]?
    var cookTool: Set<String>?
    var book: Array<String>?
    var airports: Dictionary<String,String>?
    
    
    override init() {
        
    }
    
    init(name:String,sex:Int,age:Int,address:String,graduateSchool:[String]){
        self.name = name
        self.sex = sex
        self.age = age
        self.address = address
        self.graduateSchool = graduateSchool
    }
    
    func run() -> Void {
        self.airports?.updateValue("TY", forKey: "Tokoy")
        
        var numberOfInteger = Dictionary<Int , String>()
        numberOfInteger[16] = "sixteen"
        numberOfInteger = [:] // 将字典设置为空
        numberOfInteger.updateValue("first", forKey: 1)
        numberOfInteger.removeValue(forKey: 1)
        // 字典的遍历
        for (key,value) in numberOfInteger{
            print("\(key) + \(value)")
        }
        
        var photos = Array<String>()
        photos.append("animal")
        photos = [] //
    }
    
    func cook() -> Void {
        var shoppingList: [String] = ["milk","banana"]
        shoppingList.append("apple")
        shoppingList.append("orange")
        for item in shoppingList {
            print(item)
        }
        
        var cookTool = Set<String>()
        cookTool.insert("")
    }
}

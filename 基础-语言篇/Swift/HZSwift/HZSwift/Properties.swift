//
//  Properties.swift
//  Swift_Start
//
//  Created by dafy on 16/1/21.
//  Copyright © 2016年 Dafy. All rights reserved.
//

import Cocoa

class Properties: NSObject {
    func test(){
        //
        var rangeOfThreeItems = FixedLengthRange(fristValue: 10, length: 3)
        rangeOfThreeItems.fristValue = 20
        //rangeOfThreeItems.length = 30(lengh 为常量初始化后不能修改)
        
        let rangeOfThourItems = FixedLengthRange(fristValue: 10, length: 4)
        //rangeOfThourItems.fristValue = 20 （实例为常量，属性值不能修改）
        print(rangeOfThourItems)
    }
}

// 存储属性
struct FixedLengthRange{
    // 存储在特定类或结构体的实例里的一个常量或是变量
    var fristValue:Int
    let length    :Int
    
    var width:Int{
        get{
           return 1
        }
        set{
            
        }
    }
}

// 延迟存储属性(第一次调用的时候才会计算属性的值)

class DataImporter {
    var fileName = "data.txt"
}
class DataManger {
    lazy var importer = DataImporter()
    var data  =  [String]()
}


//计算属性(不直接存储值，而是提供一个setter和getter方法)

class Person1 {
    // 存储属性
    var firstName : String?
    var lastName : String?
    var address : String?
    // 类型属性
    static var commonID : String?
    //计算属性
    var name : String{
        get{
           return firstName! + lastName!
        }
        set{
            self.name = newValue
        }
    }
    // 属性观察器
    var weight : Float = 0.0{
        willSet(newValue){
            
        }
        didSet{
            print(oldValue)
        }
        
    }
    
    func run() -> Void {
        print("run !!!")
    }
}


// 属性观察器 

class StepCount {
    var totalSteps:Int = 0{
        willSet(newTotalSteps){
           // 新赋值可以获取
        }
        didSet{
            if totalSteps > oldValue{
                
            }
        }
    }
}

// 类型属性（实例可以共享的值可以定义为类型属性（使用关键字static））

// 类型属性的获取是通过（类型.类型属性）的方式访问的


// 子类重写父类的类型属性 （使用class关键字）

class AudioChannel {
    
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel:Int = 0{
        didSet{
            if currentLevel > AudioChannel.thresholdLevel{
               currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels{
               currentLevel = AudioChannel.maxInputLevelForAllChannels
            }
        }
    }
    
}





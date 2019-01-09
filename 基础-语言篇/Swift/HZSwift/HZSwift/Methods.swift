//
//  Methods.swift
//  Swift_Start
//
//  Created by dafy on 16/1/21.
//  Copyright © 2016年 Dafy. All rights reserved.
//

import Cocoa

class Methods: NSObject {
    var count:Int = 0
    // 实例方法
    func increment(){
        count += 1
    }
    func incrementBy(_ amount:Int){
        count += amount
    }
    func reset(){
        count = 0
    }
    
    // 类型方法【静态方法】
    class func sum() -> Void{
        
    }
   
}


class testClass {
    
    var testCount = 0
    func testFun(){
        
       let method = Methods()
       method.increment()
       method.incrementBy(10)
       print(method)
        
    }
    
    func increment(){
       // self 属性
        self.testCount = 30;
        print(self.testCount)
    }
    
    struct Point {
        var x = 0.0, y = 0
        func isToTheRightOfX(_ x:Double)->Bool{
           return self.x > x
        }
    }
    
    // 值类型的属性在实例方法中不能被修改（但是确实需要可以在方法前添加 mutating）
    struct Points {
        var x = 0.0,y = 0.0
        mutating func moveByX(_ deltaX:Double,y deltaY:Double){
           x += deltaX
           y += deltaY
        }
    }

    
}


class someClass {
       // 类型方法（使用static修饰，）
    static func SomeTypeClass(){
    
    }
    /*
         如果子类需要重写父类的 类型方法 需要添加关键字（class）
    */
    
}

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    
    static func isUnlocked(_ level: Int) -> Bool{
        return level <= highestUnlockedLevel
    }
    
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}


class Player1 {
    var tracker = LevelTracker()
    let playerName : String
    
    func complete(level:Int){
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    
    init(name:String) {
        playerName = name
    }
}











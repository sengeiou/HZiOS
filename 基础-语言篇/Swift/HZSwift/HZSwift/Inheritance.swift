//
//  Inheritance.swift
//  Swift_Start
//
//  Created by dafy on 16/1/21.
//  Copyright © 2016年 Dafy. All rights reserved.
//

import Cocoa

class Inheritance: NSObject {

}

class Vehicle {
    var currentFeed = 0.0
    var description:String{
      return "traveling at \(currentFeed)miles per hour"
    }
    func makeNoise(){
    
    }
}

class Bicycle: Vehicle {
    let hasBasket = false
    // 重写方法
    override func makeNoise() {
        print("子类重写父类的方法！！！")
    }
}


class Car: Vehicle {
    var gear = 1
    // 重写属性
    override var description:String{
       return super.description + "in gear \(gear)"
    }
}
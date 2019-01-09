//
//  OptionalChaining.swift
//  Swift_Start
//
//  Created by dafy on 16/1/26.
//  Copyright © 2016年 Dafy. All rights reserved.

/*
 可选链式调用：
 调用方法、属性、下标等当前值为nil则能调用成功，为nil则失败；
 当调用形成链式，如果其中有一个值为nil，则调用中断，避免的是运行时发生错误
 
 person.residence?.address?.buildingIdentifier()
 
 如果residence或者address中有一个值为空则方法调用失败！
 */

import Cocoa

class OptionalChaining: NSObject {
  
}

class Person2 {
    var residence: Residence?
}

class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int{
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get{
            return rooms[i]
        }
        set{
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}


class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        }else if buildingNumber != nil && street != nil{
            return "\(String(describing: buildingNumber))\(String(describing: street))"
        }else{
            return nil
        }
    }
}

class Room{
    let name :String
    init(name: String) {
        self.name = name
    }
}

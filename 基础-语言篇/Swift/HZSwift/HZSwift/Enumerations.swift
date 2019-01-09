//
//  Enumerations.swift
//  Swift_Start
//
//  Created by dafy on 16/1/20.
//  Copyright © 2016年 Dafy. All rights reserved.
//

import Cocoa

class Enumerations: NSObject {
    
    //  枚举定义
    enum CompassPoint:Int{
        case east
        case west
        case north
        case south
    }
    
    // 关联值
    enum BarCode{
        case upla(Int,Int,Int,Int)
        case qrCode(String)
    }
    
    // 原始值
    enum ASCIIContorlCharacter:Character{
        case tab = "\t"
        case lineFeed = "\n"
        case carriageReturn = "\r"
    }
    
    // 初始化枚举实例
    let possibleCompass = CompassPoint(rawValue: 1)
    
    //递归枚举
    

}

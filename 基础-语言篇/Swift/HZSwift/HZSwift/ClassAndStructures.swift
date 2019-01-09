//
//  ClassAndStructures.swift
//  Swift_Start
//
//  Created by dafy on 16/1/20.
//  Copyright © 2016年 Dafy. All rights reserved.
//

import Cocoa

class ClassAndStructures: NSObject {
    
    // 创建结构体的实例
    let someResolution = Resolution()
    //结构体特有的逐一构造器
    let someResolution1 = Resolution(width: 10, height: 10)
    
    // 创建类的实例
    let someVideoMode  = VideoMode()
    
    // 访问属性
    func test(){
       let width = someResolution.width
       print(width)
        //
        
       let name = someVideoMode.name
       print(name!)
    }
    
}


// 定义结构体和定义类
struct Resolution {
    var width  = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name:String?
}

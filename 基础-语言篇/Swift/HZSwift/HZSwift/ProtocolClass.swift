//
//  ProtocolClass.swift
//  HZSwift
//
//  Created by apple on 17/1/13.
//  Copyright © 2017年 HZ. All rights reserved.
//

import Foundation

@objc protocol AnotherProtocol {
    // 定义属性
    var idCardNumber:String{get set }
    
    func move(name:String) -> Void
    // 可选协议必须使用@objc optional 关键字修饰，同时协议也必须添加 @objc关键字修饰
    @objc optional func sing(songName:String)->Void
    // 对于结构体和枚举协议定义的函数中改变成员变量则需要添加 mutating关键字
    func eatAction(foodName:String) -> Void
}

// -------  protocol --------------

protocol FirstProtocol {
    func first() -> Void
}

class FirstDelegate: NSObject {
    var delegate:FirstProtocol?
    func start() -> Void {
        delegate = FirstClass()
        delegate?.first()// print first func
    }
}

// -------  protocol --------------


class FirstClass: NSObject ,FirstProtocol{
    func first() {
        print("first func")
    }
}



//闭包类型的声明
typealias  CompleteHandler = (String)->Void

class NewProtocol : NSObject{
    var name: String?
    var age:Int = 0
    var delegate:AnotherProtocol?
    var  completeHandler:CompleteHandler?
    
    
    override init() {
        name = "tim"
    }
    func wantMove(){
        completeHandler!("testBlock")
        delegate?.move(name: self.name!)
    }
}

class HelpNewProtocol:NSObject,AnotherProtocol{
    var idCardNumber: String // 遵循协议的属性不能声明为可选，同时必须在构造器中初始化
    var helpName:String?
    override init(){
       idCardNumber = ""
    }
    
    func move(name:String) -> Void{
       print(name)
    }
    func eatAction(foodName: String) {
        self.helpName = "David"
    }
}


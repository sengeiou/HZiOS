//
//  Extensions.swift
//  Swift_Start
//
//  Created by dafy on 16/1/27.
//  Copyright © 2016年 Dafy. All rights reserved.
//

import Cocoa

class Extensions: NSObject {

    
    func testFunc(){
       let phoneNumber = "18518487767"
        if phoneNumber.validatePhoneNumber() {
            print("输入的手机号合法")
        }
    }
}


// 计算性属性扩展
// 扩展可以为已有类型添加
extension Double{
    var km:Double{return self * 1000.0}
    var m :Double{return self}
    var cm:Double{return self/100.0}
    var mm:Double{return self/1000.0}
    var ft:Double{return self/3.28084}
}


//方法的扩展
extension Int {
    func repetitopns(task: () -> Void) -> Void {
        for _ in 0..<self{
            task()
        }
    }
}


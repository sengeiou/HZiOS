//
//  Closure.swift
//  HZSwift
//
//  Created by 华天杰 on 2018/9/27.
//  Copyright © 2018年 HZ. All rights reserved.
//

import Cocoa

class Closure: NSObject {
    // 定义属性为闭包类型
    var handler: (([String]) -> Void)?
    
    func testHandler() -> Void {
        let closure = Closure()
        // 闭包赋值
        closure.handler = {
            (result) -> Void in
            print(result)
        }
        
        // 调用闭包
        if closure.handler != nil{
            closure.handler!(["11","22","33"])
        }
    }
    
    
    func requestFeed(){
        loadServerData { (result) in
            print(result)
        }
    }
    // 函数的入参为闭包类型
    func loadServerData(compelteHandler: @escaping (([String]) -> Void)){
        DispatchQueue.global().async {// 模拟数据请求
            Thread.sleep(forTimeInterval: 2.0)
            DispatchQueue.main.async {
                compelteHandler(["11","22","33"]);
            }
        }
    }
}

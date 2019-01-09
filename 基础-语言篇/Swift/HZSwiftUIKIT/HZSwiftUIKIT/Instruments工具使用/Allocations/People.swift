//
//  People.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2018/10/25.
//  Copyright © 2018年 HZ. All rights reserved.
//

import UIKit

class People: NSObject {
    var name :String
    var pet :Pet?
    
    init(name:String) {
        self.name = name
        print("People被初始化")
    }
    
    deinit {
        print("People 被销毁")
    }
}

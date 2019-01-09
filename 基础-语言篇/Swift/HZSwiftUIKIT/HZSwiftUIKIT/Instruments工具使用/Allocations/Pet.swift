//
//  Pet.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2018/10/25.
//  Copyright © 2018年 HZ. All rights reserved.
//

import UIKit

class Pet: NSObject {
    var name :String
    var master:People?
    
    init(name:String) {
        self.name = name
        print("Pet 被初始化")
    }
    deinit {
        print("Pet 被销毁")
    }
}

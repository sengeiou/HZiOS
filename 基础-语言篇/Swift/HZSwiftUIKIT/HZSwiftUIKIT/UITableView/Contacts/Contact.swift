//
//  Contact.swift
//  HZSwiftUIKIT
//
//  Created by KB on 2018/7/23.
//  Copyright © 2018年 HZ. All rights reserved.
//

import UIKit

class Contact: NSObject {
    var firstName:String?
    var lastName:String?
    var phoneNum:String?
    
    // 类的构造函数
    init(firstName:String,lastName:String,phoneNum:String) {
        super.init()
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNum = phoneNum
    }
    
    func userName() -> String{
        return self.lastName! + self.firstName!
    }
}

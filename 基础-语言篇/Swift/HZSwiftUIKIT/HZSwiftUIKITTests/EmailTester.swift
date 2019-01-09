//
//  EmailTester.swift
//  HZSwiftUIKITTests
//
//  Created by 华天杰 on 2018/10/25.
//  Copyright © 2018年 HZ. All rights reserved.
//

import UIKit
import XCTest

@testable import HZSwiftUIKIT

class EmailTester: XCTestCase {
    func testEmail() {
        let emailUtil = EmailUtil()
        let result = emailUtil.validateEmail(email: "support@163.com")
        XCTAssert(result,"邮箱不正确")
    }
    
    /*
     性能测试:
     */
    func testPerformanceExample() {
        self.measure {
//            for _ in 0 ... 1000{
//                let path = Bundle.main.path(forResource: "desktop", ofType: ".png")
//                let image = UIImage(contentsOfFile: path!)
//                print(image?.size as AnyObject)
//            }
        }
    }
}

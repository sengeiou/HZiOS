//
//  HZSwiftUIKITTests.swift
//  HZSwiftUIKITTests
//
//  Created by apple on 16/10/31.
//  Copyright © 2016年 HZ. All rights reserved.
//

import XCTest
@testable import HZSwiftUIKIT

class HZSwiftUIKITTests: XCTestCase {
    
    // 在testExample()运行前被调用，可以在setUp()中进行一些初始化之类的预操作
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
   // 在testExample()运行后被调用，tearDown意为拆除，可以进行一些清理操作，如关闭网络连接等
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // 一个测试用例
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
       let peopleID = "370403199002105670"
       let count = peopleID.count
        // XCTAssert是一种断言
       XCTAssert(count == 15 || count == 18,"错误身份证号")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

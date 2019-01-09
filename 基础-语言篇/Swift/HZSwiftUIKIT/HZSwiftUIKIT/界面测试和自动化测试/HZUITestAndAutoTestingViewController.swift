//
//  HZUITestAndAutoTestingViewController.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2018/10/25.
//  Copyright © 2018年 HZ. All rights reserved.
/*
   http://www.cocoachina.com/ios/20170401/18995.html
 */

import UIKit

class HZUITestAndAutoTestingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.edgesForExtendedLayout = []
        uiTests()
    }
    
    // UI自动化测试
    func uiTests() -> Void {
        let rect = CGRect(x: 30, y: 50, width: 200, height: 200)
        let view = UIView(frame: rect)
        view.backgroundColor = UIColor.brown
        
        let btnAdd = UIButton(frame: CGRect(x: 30, y: 350, width: 80, height: 30))
        btnAdd.backgroundColor = UIColor.gray
        btnAdd.setTitle("Add", for: UIControlState())
        btnAdd.addTarget(self, action: #selector(addView(_ :)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btnAdd)
        
        let btnBack = UIButton(frame: CGRect(x: 120, y: 350, width: 80, height: 30))
        btnBack.backgroundColor = UIColor.gray
        btnBack.setTitle("Switch", for: UIControlState())
        btnBack.addTarget(self, action: #selector(bringViewBack(_ :)), for:  UIControlEvents.touchUpInside)
        self.view.addSubview(btnBack)
        
        
        let btnRemove = UIButton(frame: CGRect(x: 210, y: 350, width: 80, height: 30))
        btnRemove.backgroundColor = UIColor.gray
        btnRemove.setTitle("Switch", for: UIControlState())
        btnRemove.addTarget(self, action: #selector(removeView(_ :)), for:  UIControlEvents.touchUpInside)
        self.view.addSubview(btnRemove)
    }
    
    @objc func addView(_ view:UIView) -> Void {
        let rect = CGRect(x: 60, y: 90, width: 200, height: 200)
        let view = UIView(frame: rect)
        view.backgroundColor = UIColor.purple
        view.tag = 1
        self.view.addSubview(view)
    }
    
    @objc func bringViewBack(_ view:UIView) -> Void {
        let view = self.view.viewWithTag(1)
        if let view1 = view {
            self.view.sendSubview(toBack: view1)
        }
    }
    
    @objc func removeView(_ view:UIView) -> Void {
        let view = self.view.viewWithTag(1)
        view?.removeFromSuperview()
    }

}

/*
   <1>单元测试
  1> 在单元测试中使用测试用例对各个功能点和方法进行测试，以减少应用程序在开发环境以外出现的bug
  2> 单元测试测试属于白盒测试
  3> Xcode 8.0以后单元测试是由XCTest框架进行的
  4> 最小可测部件：基类、抽象类或者子类的方法
 
  <2> Xcode做单元测试的步骤；【已测试某一类中的方法为例子】
   1> 在当前 targetName_Tests 文件夹下创建继承自XCTestCase的类
   2> 添加 import XCTest 和 @testable import targetName
   3> 创建测试用例方法 以test为开头
   4> 在测试用例方法中编写测试用例逻辑
   5> 点击函数左侧执行按钮，运行测试用例
 
  <3> Xcode做性能测试：
    在测试类文件中使用
    testPerformanceExample方法，执行获取函数的执行时间
  <4> UI Testing界面测试
   将光标放在targetName_UITests的
   testExample()中，点击下方的录制按钮;此时Xcode会自动生成UI自动化测试的代码
 */

//
//  HZThreadOperationViewController.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2018/10/22.
//  Copyright © 2018年 HZ. All rights reserved.
/*
  Operation相比Thread的好处
  （1） 控制线程并发的数量
  （2） 设置线程之间的依赖
 */

import UIKit

class HZThreadOperationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let blockOperation = BlockOperation {
            
        }
        let queue = OperationQueue()
        queue.addOperation(blockOperation)
        queue.maxConcurrentOperationCount = 0
    }

}

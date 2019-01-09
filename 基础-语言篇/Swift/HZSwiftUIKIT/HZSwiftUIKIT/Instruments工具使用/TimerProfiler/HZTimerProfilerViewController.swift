//
//  HZTimerProfilerViewController.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2018/10/25.
//  Copyright © 2018年 HZ. All rights reserved.
//

import UIKit

class HZTimerProfilerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        for _ in 0 ... 1000{
            let path = Bundle.main.path(forResource: "desktop", ofType: ".png")
            let image = UIImage(contentsOfFile: path!)
            print(image?.size as AnyObject)
        }
    }
    

    /*
      <1> Timer Profiler
        + 使用Timer Profiler分析代码的执行时间，查出程序变慢的原因
        + Time Profiler分析原理：
           它按照固定的时间间隔来跟踪每一个线程的堆栈信息，
           通过统计比较时间间隔之间的堆栈状态，来推算某个方法执行了多久，并获得一个近似值。
    
      <2>使用Timer Profiler需要注意的事项
        + 真机模式下
        + 应用程序在release模式下
     
     */

}

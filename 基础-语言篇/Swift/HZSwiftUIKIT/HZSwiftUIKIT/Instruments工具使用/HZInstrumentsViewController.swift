//
//  HZInstrumentsViewController.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2018/10/25.
//  Copyright © 2018年 HZ. All rights reserved.
//

import UIKit

class HZInstrumentsViewController: HZListTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.dataSource = ["HZAllocationsViewController",
                           "HZLeaksViewController",
                           "HZTimerProfilerViewController",
                            "HZCoreAnimationToolViewController"]
    }
    
    /*
        Instruments是一个工具集，可以跟踪和检测一个或多个进程，检测和收集实时数据，让开发者更好的理解应用程序的行为和性能；
        并且可以动态跟踪和分析代码
     
      
     */
}

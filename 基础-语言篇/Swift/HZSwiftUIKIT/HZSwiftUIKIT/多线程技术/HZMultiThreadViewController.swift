//
//  HZMultiThreadViewController.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2018/10/19.
//  Copyright © 2018年 HZ. All rights reserved.
//

import UIKit

class HZMultiThreadViewController: HZListTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = ["HZThreadDetailViewController",
                           "HZThreadLockViewController",
                           "HZThreadOperationViewController",
                           "HZGCDViewController"]
    }
    

}

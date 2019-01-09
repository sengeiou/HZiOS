//
//  HZCoreTextViewController.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2018/10/22.
//  Copyright © 2018年 HZ. All rights reserved.
//

import UIKit

class HZCoreTextViewController: HZListTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.dataSource = ["HZCoreTextSampleViewController","HZTextKitViewController"]
    }

}

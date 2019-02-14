//
//  HZTableViewController.swift
//  HZSwiftUIKIT
//
//  Created by apple on 16/10/31.
//  Copyright © 2016年 HZ. All rights reserved.
/*
   
 */

import UIKit

class HZTableViewController: HZListTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

         self.dataSource = ["TableViewInCellViewController","SimpleTableViewController","HZContactsViewController","HZTableBaseViewController"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

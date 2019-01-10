//
//  ViewController.swift
//  HZThreeParty
//
//  Created by KB on 2018/7/3.
//  Copyright © 2018年 BQ. All rights reserved.
/*
   关于导航栏与控制器顶部遮蔽问题
 
   <1> 控制器会自动将UIScrollview及其子类的内容显示区域自动调整到导航栏以下；
     可通过以下代码设置禁止自动调整
     if #available(iOS 11.0, *) {
     self.tableView?.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentBehavior.never
     }else  {
     self.automaticallyAdjustsScrollViewInsets = false;
     }
 
 */

import UIKit

class ViewController: HZListViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = ["HZAlamofireViewController"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


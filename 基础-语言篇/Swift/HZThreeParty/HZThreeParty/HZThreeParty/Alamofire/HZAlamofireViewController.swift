//
//  HZAlamofireViewController.swift
//  HZThreeParty
//
//  Created by 华天杰 on 2018/10/19.
//  Copyright © 2018年 BQ. All rights reserved.
//

import UIKit

class HZAlamofireViewController: HZListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dataSource = ["AlamofireViewController","HZAlamofireReachabilityViewController"]
    }


}

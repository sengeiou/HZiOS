//
//  HZDataPersistenceViewController.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2018/10/19.
//  Copyright © 2018年 HZ. All rights reserved.
//

import UIKit

class HZDataPersistenceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   // plist文件
    func loadPlist() -> Void {
        let filePath = Bundle.main.path(forResource: "userInfo", ofType: "plist") ?? ""
        let userInfo = NSMutableDictionary(contentsOfFile: filePath)
        print(userInfo!["name"] as Any)
    }

}

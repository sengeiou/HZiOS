//
//  HZLableViewController.swift
//  HZSwiftUIKIT
//
//  Created by apple on 17/1/13.
//  Copyright © 2017年 HZ. All rights reserved.
//

import UIKit

class HZLableViewController: UIViewController {
    var userNameLabel:UILabel?
    var pwdLabel:UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        testLabelFirst()
    }
    
    func testLabelFirst()  {
        let nameLable:UILabel = UILabel()
        nameLable.frame = CGRect(x: 20, y: 80, width: 100, height: 50)
        nameLable.font = UIFont.systemFont(ofSize: 14.0)
        nameLable.text = "userName can show"
        nameLable.numberOfLines = 0
        nameLable.textAlignment = NSTextAlignment.center
        nameLable.backgroundColor = UIColor.orange
        self.view.addSubview(nameLable)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

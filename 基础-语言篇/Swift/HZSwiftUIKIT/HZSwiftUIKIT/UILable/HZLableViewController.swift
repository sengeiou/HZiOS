//
//  HZLableViewController.swift
//  HZSwiftUIKIT
//
//  Created by apple on 17/1/13.
//  Copyright © 2017年 HZ. All rights reserved.
//

import UIKit

class HZLableViewController: UIViewController {
    var userNameLabel:HZLabel?
    var pwdLabel:UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        testLabelFirst()
        
        // 
        let pushSwitchLabelColorVCBtn = UIButton(type: UIButtonType.system)
        pushSwitchLabelColorVCBtn.frame = CGRect(x: 20, y: 200, width: 200, height: 50)
        pushSwitchLabelColorVCBtn.setTitle("pushSwitchLabelColorVC", for: UIControlState.normal)
        pushSwitchLabelColorVCBtn.addTarget(self, action: #selector(gotoSwitchLabelColorVC), for: UIControlEvents.touchUpInside)
        self.view.addSubview(pushSwitchLabelColorVCBtn)
        
    }
    
    func testLabelFirst()  {
        let nameLable:HZLabel = HZLabel()
        nameLable.frame = CGRect(x: 20, y: 80, width: 200, height: 50)
        nameLable.hzTextAlignment = .bottom
        nameLable.font = UIFont.systemFont(ofSize: 14.0)
        nameLable.text = "userName can show"
        nameLable.numberOfLines = 0
        
        nameLable.backgroundColor = UIColor.orange
        self.view.addSubview(nameLable)
    }
    
    @objc func gotoSwitchLabelColorVC(){
        self.navigationController?.pushViewController(HZSwitchLabelColorViewController(), animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    /*
      (1) 指定文本的宽度，显示多行文本内容，涉及到动态计算文本的高度
     （2） 显示富文本内容
     
     */
}

//
//  HZSwitchLabelColorViewController.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2019/2/10.
//  Copyright © 2019年 HZ. All rights reserved.
//

import UIKit

class HZSwitchLabelColorViewController: UIViewController {
    var showTextLabel:UILabel?
    let titleColors = [UIColor.orange,UIColor.red,UIColor.blue]
    
    override func loadView() {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
    }
    
    func setUpUI() -> Void {
        let margin:CGFloat = 20.0
        //
        showTextLabel = UILabel(frame: CGRect(x: margin, y: 100, width:(self.view.width - margin*2), height: 30))
        showTextLabel?.text = "text on label"
        showTextLabel?.textAlignment = NSTextAlignment.center
        self.view.addSubview(showTextLabel!)
        
        let btnWidth = (self.view.width - margin*4)/3
        let titles = ["orange","red","blue"]
        
        for index in 0 ..< 3{
            let switchColorBtn = UIButton(type: UIButtonType.custom)
            switchColorBtn.frame = CGRect(x: margin+(btnWidth + margin) * CGFloat(index), y: (showTextLabel?.frame.maxY)! + 50.0, width: btnWidth, height: 30)
            switchColorBtn.setTitle(titles[index], for: UIControlState.normal)
            switchColorBtn.setTitleColor(titleColors[index], for: UIControlState.normal)
            switchColorBtn.addTarget(self, action: #selector(switchShowTextLabelColor(switchBtn:)), for: UIControlEvents.touchUpInside)
            switchColorBtn.tag = index
            self.view.addSubview(switchColorBtn)
        }
    }

    @objc func switchShowTextLabelColor(switchBtn:UIButton){
        showTextLabel?.textColor = titleColors[switchBtn.tag]
    }
    
}

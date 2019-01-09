//
//  HZRoundView.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2018/10/8.
//  Copyright © 2018年 HZ. All rights reserved.
//

import UIKit

class HZRoundView: UIView {
    var color = UIColor.orange
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    // Core Graphics
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.clear(self.frame)
        context?.setFillColor(color.cgColor)
        context?.fillEllipse(in: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  HZLabel.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2019/1/10.
//  Copyright © 2019年 HZ. All rights reserved.
/*
 
   实现文字 top bottom 
 */

import UIKit

public class HZLabel: UILabel {
    
    public enum HZTextAlignment : Int {
        case top
        case middle
        case bottom
    }

    var hzTextAlignment:HZTextAlignment = HZTextAlignment.middle
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override public func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
       var textRect =  super.textRect(forBounds: bounds, limitedToNumberOfLines: numberOfLines)
        switch (self.hzTextAlignment) {
        case .top:
            textRect.origin.y = bounds.origin.y
        case .bottom:
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height
        case .middle:
            fallthrough
        default:
            textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height)/2.0
        }
        return textRect
    }
    
    override public func drawText(in rect: CGRect) {
       let actualRect =   textRect(forBounds: rect, limitedToNumberOfLines: self.numberOfLines)
        super.drawText(in: actualRect)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

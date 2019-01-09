//
//  CTImageView.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2018/10/22.
//  Copyright © 2018年 HZ. All rights reserved.
//

import UIKit

let picWidth = CGFloat(200.0)
let picHeight = CGFloat(133.0)

class CTImageView: UIView {
    override func draw(_ rect: CGRect) {
        UIColor.brown.setFill()
        UIRectFill(rect)
        
        var stRunCallBack = CTRunDelegateCallbacks(version: kCTRunDelegateVersion1, dealloc: { (refCon) in
            
        }, getAscent: { (refCon) -> CGFloat in
            return picHeight
        }, getDescent: { (refCon) -> CGFloat in
            return 0
        }) { (refCon) -> CGFloat in
            return picWidth
        }
        
        var picture = "coffee"
        let crRunDelegate = CTRunDelegateCreate(&stRunCallBack, &picture)
        let placeHolder = NSMutableAttributedString(string: "")
        placeHolder.addAttribute(NSAttributedStringKey(rawValue: kCTRunDelegateAttributeName as String), value: crRunDelegate!, range: NSMakeRange(0, 1))
        placeHolder.addAttribute(NSAttributedStringKey(rawValue: "pictureName"), value: crRunDelegate!, range: NSMakeRange(0, 1))
    }
}

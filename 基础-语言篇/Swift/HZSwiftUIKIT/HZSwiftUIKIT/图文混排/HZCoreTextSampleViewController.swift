//
//  HZCoreTextSampleViewController.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2018/10/22.
//  Copyright © 2018年 HZ. All rights reserved.
/*
 
   由attributedString ---> 创建CTFrameSetter对象 ---> 通过CGPath ----> 生成CTFrame ---> 由CTFrameDraw进行富文本的渲染
 
   一个CTframe由若干行的CTLine组成，也可以从CTFrame中直接取出CTLine使用CTLineDraw进行绘制，
 
   CTLine中还包含CTRun对象，CTRun是字形绘制的最小单位
 
   Core Text ： 出于性能考虑可以直接将文本内容渲染到图形上下文（Graphics context）
 */

import UIKit

import CoreText

class HZCoreTextSampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func textAttribute() -> Void {
        let lable = UILabel(frame: CGRect(x: 20, y: 150, width: 300, height: 30))
        self.view.addSubview(lable)
        
        //
        let string = NSMutableAttributedString(string: "Interactive tutorials for Xcode")
        let font = CTFontCreateWithName(("CourierNewPS-BoldMT" as CFString?)!, 22, nil)
        string.addAttribute(NSAttributedStringKey(rawValue: kCTFontAttributeName as String) , value: font, range: NSRange(location: 0, length: 11))
        
        var number = 3
        let cfNumber = CFNumberCreate(kCFAllocatorDefault, CFNumberType.sInt8Type, &number)
        string.addAttribute(NSAttributedStringKey(rawValue: kCTStrokeWidthAttributeName as String) , value:cfNumber! , range: NSRange(location: 12, length: 9))
        
        let italicFont = UIFont.italicSystemFont(ofSize: 14)
        let fontValue = CTFontCreateWithName(italicFont.fontName as CFString, 14, nil)
        string.addAttribute(NSAttributedStringKey(rawValue: kCTFontAttributeName as String) , value:fontValue , range: NSRange(location: 22, length: 3))
        string.addAttribute(NSAttributedStringKey(rawValue: kCTUnderlineStyleAttributeName as String) , value:NSNumber(value: 1) , range: NSRange(location: 26, length: 5))
        
        lable.attributedText = string
    }

}

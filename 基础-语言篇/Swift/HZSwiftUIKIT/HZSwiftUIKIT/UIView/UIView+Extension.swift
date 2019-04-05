//
//  UIView+Extension.swift
//  HZSwiftUIKIT
//
//  Created by KB on 2018/7/26.
//  Copyright © 2018年 HZ. All rights reserved.
//

import UIKit

extension UIView{
    public var x: CGFloat{
        get{
            return self.frame.origin.x
        }
        set{
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    public var y: CGFloat{
        get{
            return self.frame.origin.y
        }
        set{
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    public var width: CGFloat{
        get{
            return self.frame.size.width
        }
        set{
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    
    public var height: CGFloat{
        get{
            return self.frame.size.height
        }
        set{
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    
    public var size: CGSize{
        get{
            return self.frame.size
        }
        set{
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
    }
    
    public var origin: CGPoint{
        get{
            return self.frame.origin
        }
        set{
            var frame = self.frame
            frame.origin = newValue
            self.frame = frame
        }
    }
    
   static public func adjustScrollViewFrame(_ viewController:UIViewController) -> CGRect {
        let statusHeight = UIApplication.shared.statusBarFrame.size.height // iPhone X series： 44
        let navHeight = viewController.navigationController?.navigationBar.frame.size.height // 44
        let statusAndNavHeight = statusHeight + navHeight!
        // iphoneX系列的底部安全区域
        var bottomAdjust:CGFloat = 0.0
        if #available(iOS 11.0, *) {
            let safeArea = UIApplication.shared.keyWindow?.safeAreaInsets
            bottomAdjust = safeArea!.bottom
        }
        var frame = viewController.view.frame
        frame.size.height = frame.size.height  - statusAndNavHeight - bottomAdjust
        return frame
    }
    
    static public func textHeight(_ text:String,textWidth:CGFloat,fontSize:CGFloat)->CGFloat{
        let font = UIFont.systemFont(ofSize: fontSize)
        let rect = NSString(string: text).boundingRect(with: CGSize(width: textWidth, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        return ceil(rect.height)
    }
    
}


extension UIButton {
    public func hzCornerRaduis(cornerRadius:CGFloat,size:CGSize,backgroudColor:UIColor){
        UIGraphicsBeginImageContextWithOptions(size, false, 0);
        let cxt = UIGraphicsGetCurrentContext();
        cxt!.setFillColor(backgroudColor.cgColor)
        cxt!.setStrokeColor(UIColor.clear.cgColor)
        cxt!.move(to: CGPoint(x: 0, y: 0))
        
        // 左上角
        cxt!.addArc(tangent1End: CGPoint(x: 0, y: 0), tangent2End: CGPoint(x: cornerRadius, y: 0), radius: cornerRadius)
        // 右上角
        cxt!.addArc(tangent1End: CGPoint(x: size.width, y: 0), tangent2End: CGPoint(x: size.width, y: cornerRadius), radius: cornerRadius)
        // 右下角
        cxt!.addArc(tangent1End: CGPoint(x: size.width, y: size.height), tangent2End: CGPoint(x:size.width - cornerRadius, y: size.height), radius: cornerRadius)
        // 左下角
        cxt!.addArc(tangent1End: CGPoint(x: 0, y: size.height), tangent2End: CGPoint(x: 0, y:  size.height - cornerRadius), radius: cornerRadius)
        cxt!.closePath();
        cxt!.drawPath(using: CGPathDrawingMode.fillStroke)
        let image = UIGraphicsGetImageFromCurrentImageContext();
        self.setBackgroundImage(image, for: UIControlState.normal)
        UIGraphicsEndImageContext();
        
    }
}

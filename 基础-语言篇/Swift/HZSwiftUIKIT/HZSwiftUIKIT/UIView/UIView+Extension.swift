//
//  UIView+Extension.swift
//  HZSwiftUIKIT
//
//  Created by KB on 2018/7/26.
//  Copyright © 2018年 HZ. All rights reserved.
//

import Foundation
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
}

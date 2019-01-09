//
//  Image+Extenssion.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2018/10/25.
//  Copyright © 2018年 HZ. All rights reserved.
//

import UIKit

extension UIImage{
    func blendColor(_ color:UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        color.setFill()
        UIRectFill(rect)
        let blendmode = CGBlendMode.destinationIn
        draw(in: rect, blendMode: blendmode, alpha: 1.0)
        
        let blendImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return blendImage!
    }
}

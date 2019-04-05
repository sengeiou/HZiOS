//
//  HZNewsFrame.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2019/3/13.
//  Copyright © 2019年 HZ. All rights reserved.
//

import UIKit

class HZNewsFrame: NSObject {
    public var avatarFrame:CGRect?
    public var titleFrame:CGRect?
    public var showImageFrame:CGRect?
    public var contentFrame:CGRect?
    public var confirmFrame:CGRect?
    public var cellHeight:CGFloat?
    var screenWidth = UIScreen.main.bounds.size.width
    var margin:CGFloat = 10.0
    
    public var news:HZNews?{
        willSet(new){
            // 头像
            avatarFrame = CGRect(x: margin, y: margin, width: 40, height: 40)
            // 标题
            titleFrame = CGRect(x: avatarFrame!.maxX + margin, y: margin, width: 80, height: 40)
            // 右侧确认按钮
            confirmFrame = CGRect(x: screenWidth - 60 - margin , y:margin, width: 60, height: 40)
            // 展示图片的frame
            var contentY = titleFrame!.maxY;
            if (new?.avatar_image_url) != nil {
                showImageFrame = CGRect(x: margin, y: titleFrame!.maxY + 20.0, width: screenWidth - margin*2, height: 80)
                contentY = showImageFrame!.maxY
            }else{
                showImageFrame = CGRect.zero
            }
            // 内容
            let contentHeight = UIView.textHeight(new?.content ?? "", textWidth: screenWidth - margin*2, fontSize: 15)
            contentFrame = CGRect(x: margin, y: contentY + 15.0, width: screenWidth - margin*2, height: contentHeight + 5.0)
            
            cellHeight = contentFrame!.maxY + margin;
        }
    }
    
    
}

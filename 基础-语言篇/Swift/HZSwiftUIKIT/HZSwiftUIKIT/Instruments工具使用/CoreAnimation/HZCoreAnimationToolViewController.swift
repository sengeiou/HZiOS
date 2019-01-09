//
//  HZCoreAnimationViewController.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2018/10/25.
//  Copyright © 2018年 HZ. All rights reserved.
//

import UIKit

class HZCoreAnimationToolViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.edgesForExtendedLayout = []
        
        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        label.text = "label text "
        label.backgroundColor = UIColor.orange
        label.layer.cornerRadius = 25
        label.clipsToBounds = true
        self.view.addSubview(label)
    }
    

    /*
      + Color Blended Layers (图层混合)：ViewA颜色为红色、透明度为0.5，ViewB颜色为黄色，GPU会重新计算显示Layer的颜色
       就会引发GPU资源消耗；
       尽量设置控件为不透明
      + Color Hits Green and Misses Red（光栅化）
        设置layer的shouldRasterize属性为YES，就开启了光栅化
        光栅化是将Layer预先渲染成位图再加入到缓存中，成功缓存layer会显示为绿色，失败则显示为红色
        适用场景：
        图像内容不变的情况下
      + Color Misaligned Images(图片大小)
         image大小和imageView大小是否吻合，不吻合显示为黄色
      + Color Offscreen-Rendered Yellow（离屏渲染）
        离屏渲染Off-Screen Rendering 指的是GPU在当前屏幕缓冲区以外新开辟一个缓冲区进行渲染操作
     
     （1）阴影绘制shadow:使用ShadowPath来替代shadowOffset等属性的设置
     imageViewLayer.shadowPath = CGPathCreateWithRect(imageRect, NULL);
     （2）利用GraphicsContex生成一张带圆角的图片或者view
    */

}

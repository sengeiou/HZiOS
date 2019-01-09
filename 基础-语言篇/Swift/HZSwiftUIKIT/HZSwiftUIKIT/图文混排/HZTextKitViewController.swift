//
//  HZTextKitViewController.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2018/10/22.
//  Copyright © 2018年 HZ. All rights reserved.
/*
 
 Text Kit : UITextView ===> 能够实现分栏和圆角图片的混排效果
 */

import UIKit


class HZTextKitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = []
        // 获取显示文本的内容
        
        let textView = UITextView(frame: CGRect(x: 20, y: 40, width: 280, height: 500))
        textView.backgroundColor = UIColor.brown
        self.view.addSubview(textView)
        
        let textStorage = textView.textStorage //存储控件中的文本信息和属性
        textStorage.replaceCharacters(in: NSRange(location: 0, length: 0), with: showText())
        
        let image = UIImage(named: "desktop")
        let imageView = UIImageView(frame: CGRect(x: 80, y: 80, width: 150, height: 150))
        imageView.image = image!
        
        imageView.layer.cornerRadius = 75
        imageView.layer.masksToBounds = true
       // imageView.layer.borderWidth = 10
        self.view.addSubview(imageView)

        
        var frame = textView.convert(imageView.bounds, from: imageView)
        frame.origin.x -= textView.textContainerInset.left
        frame.origin.y -= textView.textContainerInset.top
        
        // textContainer : 文本视图的显示区域，
        let path = UIBezierPath(ovalIn: frame)
        //exclusionPaths 通过设置该属性，文字排列可以跳过该区域
        textView.textContainer.exclusionPaths = [path]
}

    func showText() -> String{
        return "茶，（学名：Camellia sinensis (L.) O. Ktze.），灌木或小乔木，嫩枝无毛。叶革质，长圆形或椭圆形，先端钝或尖锐，基部楔形，上面发亮，下面无毛或初时有柔毛，边缘有锯齿，叶柄无毛。花白色，花柄有时稍长；萼片阔卵形至圆形，无毛，宿存；花瓣阔卵形，基部略连合，背面无毛，有时有短柔毛；子房密生白毛；花柱无毛。蒴果3球形或1-2球形，高1.1-1.5厘米，每球有种子1-2粒。花期10月至翌年2月。野生种遍见于中国长江以南各省的山区，为小乔木状，叶片较大，常超过10厘米长，长期以来，经广泛栽培，毛被及叶型变化很大。茶叶可作饮品，含有多种有益成分，并有保健功效。"
    }
}

//
//  HZCALayerViewController.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2018/10/9.
//  Copyright © 2018年 HZ. All rights reserved.
/*
    【QuartzCore框架】
 
 */

import UIKit

class HZCALayerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = []

        setViewGradient()
    }
    
    // 设置View的边框和颜色
    func setViewBorder() -> Void {
        let view = UIView(frame: CGRect(x: 50, y: 50, width: 200, height: 200))
        view.backgroundColor = UIColor.orange
        view.layer.borderColor = UIColor.red.cgColor
        view.layer.borderWidth = 2.0
        self.view.addSubview(view)
    }

    // 设置View的阴影
    func setViewShadow() -> Void {
        let view = UIView(frame: CGRect(x: 50, y: 50, width: 200, height: 200))
        view.backgroundColor = UIColor.orange
        view.layer.shadowColor = UIColor.red.cgColor
        view.layer.shadowOffset = CGSize(width: 10.0, height: 10.0)// 水平向右偏10，水平向下偏10
        view.layer.shadowOpacity = 0.6
        view.layer.shadowRadius  = 5.0
        self.view.addSubview(view)

    }
    
    // 设置圆角
    func setViewCornerRadius() -> Void {
        let view = UIView(frame: CGRect(x: 50, y: 50, width: 200, height: 200))
        view.backgroundColor = UIColor.orange
        view.layer.cornerRadius = 40.0
        view.layer.masksToBounds = true
        
        let subView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        subView.backgroundColor = UIColor.yellow
        view.addSubview(subView)
        
        self.view.addSubview(view)
        
    }
    
    // CALayer的渐变
    func setViewGradient() -> Void {
        let gradientView = UIView(frame: CGRect(x: 20, y: 60, width: 200, height: 240))
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = gradientView.frame
        
        let fromColor = UIColor.yellow.cgColor
        let midColor = UIColor.blue.cgColor
        let toColor = UIColor.red.cgColor
        
        gradientLayer.colors = [fromColor,midColor,toColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.locations = [0,0.3,1] // 0.3 代表蓝色位于渐变线30%的位置
        
        gradientView.layer.addSublayer(gradientLayer)
        self.view.addSubview(gradientView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

//
//  HZUIViewViewController.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2018/10/8.
//  Copyright © 2018年 HZ. All rights reserved.

/*
 【UIView】:
      a. 负责渲染视图矩阵区域中的内容
         【UIView真正绘图的部分是由CALayer类来管理的，它更像一个CALayer的管理器，设置UIView的一些行为属性，其实质是设置CALayer的相关属性】
      b. 响应该区域中发生的触碰事件
 【CALayer】:
   通过操作CALayer可以方面的改变UIView的阴影、圆角大小、边框宽度和颜色等；
 【UIWindow】: iOS程序启动第一个创建视图控件就是UIWindow
   窗口为内容显示提供背景平台
 
 ---------
 NSObject：所有类的根类，为派生类提供基本方法：alloc、init
 UIResponder：继承此类的子类可以响应设备的触摸事件，可能多个对象响应同一个事件，iOS通过事件响应链将事件向上传递。
 UIWindow：提供一个管理和显示视图的窗口，一个应用程序只有一个窗口
 UIControl控件类: 几乎所有交互控件的父类，按钮、滑块、文本框
 
 
 涉及视图渲染的层级关系
                UIKIT
             Core Animation
           OpenGL ES   Core Graphics
           GPU         CPU
 
 
 */

import UIKit

class HZUIViewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
           edgesForExtendedLayout:在控制器中存在NavgationBar和Tabbar时视图的布局位置
           设置self.edgesForExtendedLayout = []，只是将控制器的View左上角坐标从导航栏的左下角开始，并不影响View的宽高
         */
        self.edgesForExtendedLayout = []
        
       // customerView()
      //   testTransform()

        let caLayerBtn = UIButton(type: UIButtonType.custom)
        caLayerBtn.frame = CGRect(x: 50, y: 50, width: 100, height: 50)
        caLayerBtn.backgroundColor  = UIColor.orange
        caLayerBtn.addTarget(self, action: #selector(pushToCALayerVC), for: UIControlEvents.touchUpInside)
        self.view.addSubview(caLayerBtn)
    }
    
    @objc func pushToCALayerVC(){
        let caLayerVC = HZCALayerViewController()
        self.navigationController?.pushViewController(caLayerVC, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // UIView视图的基本属性
    func test1() -> Void {
        let view = UIView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
        view.backgroundColor = UIColor.orange
        view.clipsToBounds = true // 子视图超过的区域将被剪切掉
        /*
         如果视图的alpha设置为0:
         a. 视图以及子视图都会被隐藏
         b. 当前视图会被从响应链中被移除
         */
        view.alpha = 0.7
        self.view.addSubview(view)
        
        let subView = UIView(frame: CGRect(x: 10, y: 10, width: 100, height: 100))
        subView.backgroundColor = UIColor.red
        view.addSubview(subView)
        
        
        // ---------------  --------------------------------------
        
        // 获取状态栏 + 导航栏的高度
        let statusHeight = UIApplication.shared.statusBarFrame.size.height
        let navHeight = self.navigationController?.navigationBar.frame.size.height
        
        let statusAndNavHeight = statusHeight + navHeight!
        
        // iphoneX系列的底部安全区域
        var bottomAdjust:CGFloat = 0.0
        if #available(iOS 11.0, *) {
            let safeArea = UIApplication.shared.keyWindow?.safeAreaInsets
            bottomAdjust = safeArea!.bottom
        }
        
        
        print("===>\(statusHeight + navHeight!)")
        let viewBottom = UIView(frame: CGRect(x: 50, y: self.view.height - 110 - statusAndNavHeight - bottomAdjust, width: 100, height: 100))
        // 使用图片设置UIView的背景色
        //        let image = UIImage(named: "")
        //        UIColor.init(patternImage:image!)
        viewBottom.backgroundColor = UIColor.blue
        self.view.addSubview(viewBottom)
    }
    
    // ------ UIView 的位置属性 ---
    func testPosition() -> Void {
        let frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        let view = UIView(frame: frame)
        // 设置bounds的origin属性只是修改View自身的坐标系原点，进而会影响子视图的布局
        view.bounds = CGRect(x: -50, y: -50, width: 200, height: 200)
        view.backgroundColor = UIColor.orange
        
        let subView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        subView.backgroundColor = UIColor.red
        view.addSubview(subView)
        
        self.view.addSubview(view)
        
        //subView 坐标在控制器视图上的位置
        let point =  subView.convert(subView.frame.origin, to: self.view)
        print(point)
    }
    
    // ----- UIView的层次关系 和交互属性 ----
    func testViewLevel() -> Void {
        // 调整视图显示的层次结构
         //self.view.insertSubview(<#T##view: UIView##UIView#>, at: <#T##Int#>)
        
        // self.view.exchangeSubview(at: <#T##Int#>, withSubviewAt: <#T##Int#>)
        
        // 视图的交互属性
        self.view.isUserInteractionEnabled = true
        
        let frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.orange
        self.view.addSubview(view)
        
        let guseture = UITapGestureRecognizer(target: self, action: #selector(singleTap))
        view.addGestureRecognizer(guseture)
    }
    
    @objc func singleTap(){
        print("tap ...")
    }
    
    // ---- UIView 缩放、旋转、位移 ----  CGAffineTransform仿射转换结构体【代表一种仿射变换矩阵】
    func testTransform() -> Void {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        view.center = self.view.center
        view.backgroundColor = UIColor.orange
        self.view.addSubview(view)
        
        // 首先拿到视图的transform属性
        let transform = view.transform
        // view.transform = transform.translatedBy(x: 0, y: 100) 向下平移100
        //view.transform = transform.scaledBy(x: 1.5, y: 1.5) 缩放视图
        view.transform = transform.rotated(by: 3.14/4)  // 视图的旋转
        // self.view.transform = CGAffineTransform(rotationAngle: <#T##CGFloat#>)
    }
    
    // 自定义视图
    func customerView() -> Void {
        let roundView = HZRoundView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        self.view.addSubview(roundView)
    }

}

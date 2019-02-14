//
//  HZViewController.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2018/10/10.
//  Copyright © 2018年 HZ. All rights reserved.
//

import UIKit

class HZViewController: UIViewController {
    
    //loadView中可以替换UIViewcController中默认生成的view
    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor.orange
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = []
        self.title = "HZViewController"
        
        
        
        let pageControlBtn = UIButton(frame: CGRect(x: 20, y: 20, width: 100, height: 25))
        pageControlBtn.setTitle("page Control", for: UIControlState.normal)
        pageControlBtn.backgroundColor = UIColor.orange
        pageControlBtn.addTarget(self, action: #selector(gotoPageControl), for: UIControlEvents.touchUpInside)
        self.view.addSubview(pageControlBtn)
    }
    
    @objc func gotoPageControl(){
        let pageControlVC = PageControlViewController()
        self.navigationController?.pushViewController(pageControlVC, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
       UIViewController的作用 (MVC )
     
      M -- KVO/Notifiction -- C
      V -- target-action/ delegate -- C
     
     + UIViewController负责创建和管理视图，并在内存较低时将子视图移除
     + 视图控制器可以将新的视图，以模态窗口的形式展现在当前视图的上方
     + 视图控制器可以响应设备的方向变化，进而调整页面布局
     + 导航控制器、标签控制器
     
     视图控制器的生命周期
     + alloc / init
     + loadView {
       1.判断当前的控制器是否从StoryBoard加载的.如果是,从StoryBoad当中创建View.
       2.如果不是,还会判断当前控制器,是否有xib进行描述.如果有,就会从Xib里面创建View
       3.如果也不是xib来描述的,那么它就会给创建一个空的UIView.
     }
     + viewDidLoad : 视图控制器载入内存之后调用，可以进行一些视图的初始化工作
     + viewWillAppear ： 对即将显示的视图进行一些操作，从其他页面返回需要数据刷新，
     + viewDidAppear ： 这个方法可以做将旧界面显示出来，然后再执行一些耗时操作，然后再刷新界面
     + viewWillDisappear
     + viewDidDisappear
     + dealloc
     + didReceiveMemoryWarning ： 需要释放一些暂时不使用的内存资源
     */
}

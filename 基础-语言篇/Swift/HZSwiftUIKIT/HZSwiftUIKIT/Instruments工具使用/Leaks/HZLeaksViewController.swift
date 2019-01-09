//
//  HZLeaksViewController.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2018/10/25.
//  Copyright © 2018年 HZ. All rights reserved.
//

import UIKit

class HZLeaksViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = []
      
        var master:People?
        var dog:Pet?
        
        master = People(name: "Jerry")
        dog = Pet(name: "Dog")
        
        master!.pet = dog
        dog!.master = master
        
        master = nil
        dog = nil
    }
}

/*
   Leaks工具可以检测进程堆泄露的内存
   + 通过Leaks可以查看内存泄露对象的数量
   + 每个内存泄露对象的类型、内存地址和占用大小信息
 
   附：
    在控制面板中出现红色的菱形x号，并能显示内存泄露对象的个数
 */

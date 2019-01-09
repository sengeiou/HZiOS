//
//  HZAllocationsViewController.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2018/10/25.
//  Copyright © 2018年 HZ. All rights reserved.
//

import UIKit

class HZAllocationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.edgesForExtendedLayout = []
        let button = UIButton(frame: CGRect(x: 20, y: 40, width: 280, height: 44))
        button.setTitle("PeopleAndPet", for: UIControlState())
        button.backgroundColor = UIColor.black
        button.addTarget(self, action: #selector(peoplePet), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)
    }
    

    @objc func peoplePet(){
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
 <1>Allocations工具：为开发者实时显示应用程序内存的分配情况
 + 内存中的对象占用曲线
 + 内存当前分配给了哪些对象
 + 被分配内存的对象数量
 + 哪些函数进行对象的创建
 
  <2>  Allocations面板简介
  + graph：是否在上方的All Heap & Anonymous VM显示该项目
  + Catagory： 内存被分配的项目名称或类型
  + Persistent Bytes：某种类型被分配的内存大小
  + Persistent : 当前创建了多少该类型的对象
  + Transient ：被释放该类型的对象的数量
  + Total Bytes ：创建该类型对象共花费的内存
  + Total ： 共创建了当前类型对象的个数
  + Transient/Total Bytes： 
 */

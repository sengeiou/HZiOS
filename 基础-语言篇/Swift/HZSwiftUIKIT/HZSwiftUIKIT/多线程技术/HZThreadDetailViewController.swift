//
//  HZThreadDetailViewController.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2018/10/22.
//  Copyright © 2018年 HZ. All rights reserved.
//

/*
 任务：是为了达成某一目标而进行所有操作的集合
 进程：一个应用程序，是操作系统进行资源分配和调度的基本单位，一个进程所拥有的数据和变量只属于它自己
 线程：进程中能够进行独立运行的一个程序，进程中包含若干个线程，线程是CPU进行调度和分配的最小单位
 */

import UIKit

class HZThreadDetailViewController: UIViewController {
    var imageView = UIImageView()
    var label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.frame = CGRect(x: 0, y: 150, width: 100, height: 100)
        self.view.addSubview(imageView)
        
        label.frame = CGRect(x: 0, y: (imageView.frame.maxY + 20.0) ,width: 100, height: 30)
        label.text = "loading ...."
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = NSTextAlignment.center
        self.view.addSubview(label)
        
        let imageUrl = ""
        let thread = Thread(target: self, selector: #selector(downloadImage(imageUrl:)), object: imageUrl)
        thread.start()
        /*
        // 线程的Stack space
        let thread = Thread(target: self, selector: #selector(testThread), object: nil)
        thread.stackSize = 1024 * 1024 // 将线程的栈空间设置为1024K
        thread.threadPriority = 1.0 // 0.0~1.0 线程优先级设置
        */
        
    }
    
    @objc func downloadImage(imageUrl:String) -> Void {
        //
        let url = URL(string: imageUrl)
        var data:Data!
        do {
            try data = Data(contentsOf: url!)
            let image = UIImage(data: data)
            self.perform(#selector(showImage(image:)), on: Thread.main, with: image, waitUntilDone: true)
        } catch  {
            print("下载失败")
        }
    }
    
    @objc func showImage(image:UIImage){
        imageView.image = image
        label.isHidden = true
    }
    
   @objc func testThread() -> Void {
        //
        RunLoop.current.run()
    }

}

/*
  线程的生命周期
 (1)创建状态 ：对线程对象进行初始化操作
 (2)就绪状态： 调用线程的start方法，将线程加入可被调度的线程池中，等待CPU的调度
 (3)运行状态： CPU对线程进行调度，使得线程处于执行状态，线程执行结束后进入就绪状态，线程会在这两个状态之间切换
 (4)堵塞状态： 通过调用Thread的sleep方法可以指定线程休眠到制定的时间或者通过加锁将线程堵塞
 (5)消亡状态： Thread调用exit退出
 */

/*
    线程和runloop的关系
 （1）线程和runloop是一一对应的关系，主线程的runloop是自动创建并启动的，子线程的runloop需要手动创建并调用run方法启动
 （2）Run loop从两个不同的事件源中接收消息
   1> Input sources投递异步消息【使用port或者自定义的input source 或者使用perform系列的函数】
   2> Timer sources在计划的时间或重复的时间间隔内传递同步消息；【Timer的定时器】
 */

/*
     iOS中的三种多线程技术
     (1) Thread
     (2) Operation
     (3) Grand Central Dispatch
 */

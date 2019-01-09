//
//  HZGCDViewController.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2018/10/22.
//  Copyright © 2018年 HZ. All rights reserved.
/*
   GCD是为了多核的并行运算提供解决方案，
   GCD会自动管理线程的生命周期，创建线程、调度任务、销毁线程
   GCD有一个底层线程池，这个池中存放的是一个个的线程。之所以称为“池”，很容易理解出这个“池”中的线程是可以重用的，当一段时间后这个线程没有被调用胡话，这个线程就会被销毁。注意：开多少条线程是由底层线程池决定的（线程建议控制再3~5条），池是系统自动来维护
 
   多线程概念
  并发： 多个任务同时进行【时间片概念】
  串行： 一个任务执行完成再执行另外一个任务
  异步： 在新的线程中执行任务
  同步： 在当前线程中执行任务，不会开启新线程
 */

import UIKit

class HZGCDViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        testSerialQueue()
    }
    
    // serial queue
    func testSerialQueue() -> Void {
        print(Thread.current) // main thread
        let serialQueue = dispatch_queue_serial_t(label: "hua.com.serial")
        serialQueue.async {
            print(Thread.current)// 创建一个子线程执行 other thread
        }
        serialQueue.sync {
            print(Thread.current) // 仍旧使用当前队列所处的线程(main thread)
        }
    }
    
    // DispatchGroup
    func testDispatchGroup(){
        
        // ---- 1 -----
        let myQueue = dispatch_queue_concurrent_t(label: "hua.com.concurrentQueue")
        let group = DispatchGroup.init();
        myQueue.async(group: group, qos: .default, flags: []) {
            // task 1
        }
        myQueue.async(group: group, qos: .default, flags: []) {
            // task 2
        }
        group.notify(queue: myQueue) {
           // task 1和2执行完毕后再执行其他操作
        };
        
        // ----- 2 ------
        let result = group.wait(timeout: .now() + 2.0)
        switch result {
        case .success:
        print("成功")
        case .timedOut:
        print("超时的处理")
        }
        
         // ---- 3 ----- enter和leave
        
         

    }
}

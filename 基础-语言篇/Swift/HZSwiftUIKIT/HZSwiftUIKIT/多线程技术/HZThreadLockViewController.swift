//
//  HZThreadLockViewController.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2018/10/22.
//  Copyright © 2018年 HZ. All rights reserved.
/*
   多线程技术中的各种锁
 
 */

import UIKit

class HZThreadLockViewController: UIViewController {

    var booksCount = 100
    var soldBooksCount = 0
    var lock:NSLock!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lock = NSLock()
        
        //
        let salesManA = Thread(target: self, selector: #selector(saleBook), object: nil)
        salesManA.name = "销售员甲"
        salesManA.start()
        
        let salesManB = Thread(target: self, selector: #selector(saleBook), object: nil)
        salesManB.name = "销售员乙"
        salesManB.start()
        
        let salesManC = Thread(target: self, selector: #selector(saleBook), object: nil)
        salesManC.name = "销售员丁"
        salesManC.start()
    }
    
    @objc func saleBook(){
        lock.lock()
        
        booksCount -= 1
        soldBooksCount += 1
        
        lock.unlock()
    }

}

//
//  HZGestureViewController.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2018/10/18.
//  Copyright © 2018年 HZ. All rights reserved.
//

import UIKit

class HZGestureViewController: UIViewController {
    
    var imageView:UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func doubleTapImageView() -> Void {
        imageView = UIImageView(frame: CGRect(x: 50, y: 100, width: 50, height: 50))
        imageView?.image = UIImage(named: "")
        imageView?.isUserInteractionEnabled = true
        self.view.addSubview(imageView!)
        //
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(doubleTap))
        tapGestureRecognizer.numberOfTapsRequired = 2 // 需要两次点击
        tapGestureRecognizer.numberOfTouchesRequired = 1 // 需要识别一根手指
        imageView?.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func doubleTap(tap:UITapGestureRecognizer){
        
    }
    
    
}

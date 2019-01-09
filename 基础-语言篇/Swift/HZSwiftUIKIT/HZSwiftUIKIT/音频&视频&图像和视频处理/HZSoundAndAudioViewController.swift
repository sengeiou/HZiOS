//
//  HZSoundAndAudioViewController.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2018/10/18.
//  Copyright © 2018年 HZ. All rights reserved.
//

import UIKit

class HZAudioAndMovieViewController: HZListTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       self.dataSource = ["HZSoundViewController","HZCoreImageViewController"]
    }
}

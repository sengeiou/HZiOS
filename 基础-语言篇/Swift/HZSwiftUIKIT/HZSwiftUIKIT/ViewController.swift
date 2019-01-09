//
//  ViewController.swift
//  HZSwiftUIKIT
//
//  Created by apple on 16/10/31.
//  Copyright © 2016年 HZ. All rights reserved.
//

import UIKit

class ViewController: HZListTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = [
                           "HZViewController",
                           "HZUIViewViewController",
                           "HZUINavigationViewController",
                           "HZCoreAnimationViewController",
                           "HZLableViewController",
                           "HZLoginViewController",
                           "HZTableViewController",
                            "HZCollectionViewController",
                           "HZMultiThreadViewController",
                           "HZCoreTextViewController",
                           "HZAudioAndMovieViewController",
                           "HZUITestAndAutoTestingViewController",
                            "HZInstrumentsViewController",
                            "HZToolListViewController"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


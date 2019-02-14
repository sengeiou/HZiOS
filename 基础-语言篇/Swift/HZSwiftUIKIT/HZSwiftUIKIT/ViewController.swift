//
//  ViewController.swift
//  HZSwiftUIKIT
//
//  Created by apple on 16/10/31.
//  Copyright © 2016年 HZ. All rights reserved.
/*
  Foundation
  UIKIT
  AVFoundation
  MapKit
  CoreLocation
  Quartz
 */

import UIKit

class ViewController: HZListTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = [
                           "HZViewController",
                           "HZLableViewController",
                           "HZLoginViewController",
                           "HZTableViewController",
                           "HZScrollViewController",
                            "HZCollectionViewController",
                            "HZUIViewViewController",
                            "HZUINavigationViewController",
                            "HZCoreAnimationViewController",
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


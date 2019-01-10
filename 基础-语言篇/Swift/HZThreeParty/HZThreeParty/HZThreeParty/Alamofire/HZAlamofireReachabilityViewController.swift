//
//  HZAlamofireReachabilityViewController.swift
//  HZThreeParty
//
//  Created by 华天杰 on 2018/10/19.
//  Copyright © 2018年 BQ. All rights reserved.
//

import UIKit
import Alamofire

/*
   主要判断网络的状态
 */

class HZAlamofireReachabilityViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var message = "当前无网络"
        let status:NetworkReachabilityManager.NetworkReachabilityStatus = MyNetWorkReachabilityManager.sharedManager.networkReachabilityStatus()
        switch status {
        case .notReachable:
            message = "当前无网络"
        case .reachable(NetworkReachabilityManager.ConnectionType.ethernetOrWiFi):
            message = "当前WIFI"
        case .reachable(NetworkReachabilityManager.ConnectionType.wwan):
            message = "是3G或者4G"
        default:
            message = "当前无网络"
            break
        }
        
        //
        let alert = UIAlertController(title: "Information", message: message, preferredStyle: UIAlertControllerStyle.alert)
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            (action) in
            
        }
        alert.addAction(OKAction)
        self.present(alert, animated: true) {
            
        }
    }

}

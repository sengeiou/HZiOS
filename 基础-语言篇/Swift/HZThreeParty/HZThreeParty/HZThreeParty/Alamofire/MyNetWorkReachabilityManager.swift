//
//  MyNetWorkReachabilityManager.swift
//  HZThreeParty
//
//  Created by 华天杰 on 2018/10/19.
//  Copyright © 2018年 BQ. All rights reserved.
//

import UIKit

import Alamofire

class MyNetWorkReachabilityManager: NSObject {
   private static let shareInstance = MyNetWorkReachabilityManager()
    var manager = NetworkReachabilityManager(host: "www.baidu.com")
    override init() {
        manager?.listener = {
            status in
            print("NetWork Status changed:\(status)")
        }
        manager?.startListening()
    }
    
    class var sharedManager:MyNetWorkReachabilityManager{
        let instance = self.shareInstance
        return instance
    }
    
    func networkReachabilityStatus() -> NetworkReachabilityManager.NetworkReachabilityStatus {
        let status:NetworkReachabilityManager.NetworkReachabilityStatus = (manager?.networkReachabilityStatus)!
        print("f当前网络状态：\(status)")
        return status
    }
    
}



// Swift的单例写法
class DanLi: NSObject {
    private static let instance: DanLi = DanLi()
    class var shareInstance:DanLi{
        let object = self.instance
        return object
    }
    override init() {
        
    }
}



//
class HttpManager: NSObject {
    private static let manager = HttpManager()
    class var shareInstance:HttpManager{
        let instance = self.manager
        return instance
    }
    
    func get(handler:(([String:String])->Void)) -> Void {
        handler(["name":"hz","age":"66"])
        
    }
}

class NormalVC: NSObject {
    func requestData() -> Void {
        HttpManager.shareInstance.get { (person) in
            let name = person["name"] ?? ""
            let age = person["age"] ?? ""
            print(name + age)
        }
    }
}

//
//  AlamofireViewController.swift
//  HZThreeParty
//
//  Created by KB on 2018/7/30.
//  Copyright © 2018年 BQ. All rights reserved.
//

import UIKit
import Alamofire

class AlamofireViewController: HZBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestWithAlamofireTwo()
    }
    
    func requestWithAlamofireOne() {
        /*
        Alamofire.request("https://httpbin.org/get", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            if(response.error == nil){
                print(response.result.value ?? "")
            }else{
                print("请求失败\(String(describing: response.error))")
            }
            
        }
      */
        
        Alamofire.request("https://httpbin.org/get").response { response in
            if(response.error == nil){
                let responseData =  NSString.init(data: response.data!, encoding: String.Encoding.utf8.rawValue)
                print(responseData ?? "")
            }else{
                print("请求失败\(String(describing: response.error))")
            }
        }
        
    }
    
    func requestWithAlamofireTwo() {
        let params: [String: String] = ["ak":"mFdpmvtRaOvlVVU1rIXH4Xvh",
                                         "coor":"bd09ll",
                                          "mcode":"com.dafy.YundaiMobile"]
        Alamofire.request("http://api.map.baidu.com/location/ip", method: .get, parameters: params, encoding: JSONEncoding.default)
            .downloadProgress { (progress) in
            
            }
            .validate { (request, response, data) -> Request.ValidationResult in
                return .success
            }
            .response { (response) in
                if(response.error == nil){
                    let responseData =  NSString.init(data: response.data!, encoding: String.Encoding.utf8.rawValue)
                    print(responseData ?? "")
                }else{
                    print("请求失败\(String(describing: response.error))")
                }
            }
        
    }
    
    
    // 图片上传
    func uploadImage() -> Void {
        let fileURL = Bundle.main.url(forResource: "desk", withExtension: "png")
        Alamofire.upload(fileURL!, to: URL(string: "")!).validate().responseJSON {
            (response) in
            DispatchQueue.main.async {
                print("上传结果\(response.result)")
                
            }
        }
    }
    
    // 图片上传查看进度
    
    func uplaodImageWithProgress() -> Void {
        let fileURL = Bundle.main.url(forResource: "desk", withExtension: "png")
        Alamofire.upload(fileURL!, to: URL(string: "")!).uploadProgress(closure: {
            progress in
            // 主线程中
            print("完成比例：\(progress.fractionCompleted)")
            print("当前完成：\(progress.completedUnitCount)")
            print("总共大小：\(progress.totalUnitCount)")
        }).validate().responseJSON {
            (response) in
            // 子线程
            DispatchQueue.main.async {
                print("上传结果\(response.result)")
                
            }
        }
    }
    
    // 多张图片的上传
    func uploadImageArray() -> Void {
        let imageURL = Bundle.main.url(forResource: "desk", withExtension: "png")
        let imageURL1 = Bundle.main.url(forResource: "top", withExtension: "png")
        
        Alamofire.upload(multipartFormData: {
            multipartFormData in
            multipartFormData.append(imageURL!, withName: "desk")
            multipartFormData.append(imageURL1!, withName: "top")
        }, to: URL(string: "上传地址")!) {
            encodingResult in
            switch encodingResult{
            case .success(let upload,_,_):
                upload.responseJSON(completionHandler: { (response) in
                    
                })
            break
                
            case .failure(let encodingError):
                print(encodingError)
                break
            }
            
        }
    }
    
    //   文件下载
    
    func download() -> Void {
        let destination = DownloadRequest.suggestedDownloadDestination(for: .documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask)
        Alamofire.download("下载地址", to: destination).downloadProgress(closure: {
            progress in
            
        }).responseData {
            (response) in
            if let data = response.result.value{
                let image = UIImage(data: data)
                print(image as Any)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

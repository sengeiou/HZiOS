//
//  HZNews.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2019/3/13.
//  Copyright © 2019年 HZ. All rights reserved.
//

import UIKit

import HandyJSON

class HZNews: HandyJSON {
    public var avatar_image_url:String?
    public var title:String?
    public var detail_image_url:String?
    public var content:String?
    
    required init(){}
    
   static private func loadNews()->Array<Dictionary<String, Any>>{
        return [["avatar_image_url":"https://b-ssl.duitang.com/uploads/item/201812/05/20181205211932_xvslr.jpeg",
                 "title":"cpu01","content":"每一个UIView都","detail_image_url":"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"],
                ["avatar_image_url":"http://tvax2.sinaimg.cn/crop.0.0.512.512.1024/ee14d0c0ly8fr9wg48vczj20e80e8jrp.jpg",
                 "title":"cpu01","content":"每一个UIView都 每一个UIView都 每一个UIView都 每一个UIView都 每一个UIView都 每一个UIView都 每一个UIView都 每一个UIView都","detail_image_url":"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"],
                ["avatar_image_url":"https://b-ssl.duitang.com/uploads/item/201812/05/20181205211932_xvslr.jpeg",
                 "title":"cpu01","content":"每一个UIView都 每一个UIView都 每一个UIView都 每一个UIView都 每一个UIView都 ","detail_image_url":"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"],
                ["avatar_image_url":"http://tvax2.sinaimg.cn/crop.0.0.512.512.1024/ee14d0c0ly8fr9wg48vczj20e80e8jrp.jpg",
                 "title":"cpu01","content":"每一个UIView都","detail_image_url":"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"],
                ["avatar_image_url":"http://tvax2.sinaimg.cn/crop.0.0.512.512.1024/ee14d0c0ly8fr9wg48vczj20e80e8jrp.jpg",
                 "title":"cpu01","content":"每一个UIView都","detail_image_url":"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"],
                ["avatar_image_url":"http://tvax2.sinaimg.cn/crop.0.0.512.512.1024/ee14d0c0ly8fr9wg48vczj20e80e8jrp.jpg",
                 "title":"cpu01","content":"每一个UIView都","detail_image_url":"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"],
                ["avatar_image_url":"http://tvax2.sinaimg.cn/crop.0.0.512.512.1024/ee14d0c0ly8fr9wg48vczj20e80e8jrp.jpg",
                 "title":"cpu01","content":"每一个UIView都","detail_image_url":"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"],
                ["avatar_image_url":"http://tvax2.sinaimg.cn/crop.0.0.512.512.1024/ee14d0c0ly8fr9wg48vczj20e80e8jrp.jpg",
                 "title":"cpu01","content":"每一个UIView都","detail_image_url":"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"],
                ["avatar_image_url":"http://tvax2.sinaimg.cn/crop.0.0.512.512.1024/ee14d0c0ly8fr9wg48vczj20e80e8jrp.jpg",
                 "title":"cpu01","content":"每一个UIView都","detail_image_url":"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"],
                ["avatar_image_url":"http://tvax2.sinaimg.cn/crop.0.0.512.512.1024/ee14d0c0ly8fr9wg48vczj20e80e8jrp.jpg",
                 "title":"cpu01","content":"每一个UIView都  每一个UIView都 每一个UIView都 每一个UIView都 每一个UIView都 每一个UIView都 每一个UIView都","detail_image_url":"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"],
                ["avatar_image_url":"http://tvax2.sinaimg.cn/crop.0.0.512.512.1024/ee14d0c0ly8fr9wg48vczj20e80e8jrp.jpg",
                 "title":"cpu01","content":"每一个UIView都","detail_image_url":"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"],
                ["avatar_image_url":"http://tvax2.sinaimg.cn/crop.0.0.512.512.1024/ee14d0c0ly8fr9wg48vczj20e80e8jrp.jpg",
                 "title":"cpu01","content":"每一个UIView都","detail_image_url":"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"],
                ["avatar_image_url":"http://tvax2.sinaimg.cn/crop.0.0.512.512.1024/ee14d0c0ly8fr9wg48vczj20e80e8jrp.jpg",
                 "title":"cpu01","content":"每一个UIView都","detail_image_url":"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"],
                ["avatar_image_url":"http://tvax2.sinaimg.cn/crop.0.0.512.512.1024/ee14d0c0ly8fr9wg48vczj20e80e8jrp.jpg",
                 "title":"cpu01","content":"每一个UIView都 每一个UIView都 每一个UIView都每一个UIView都 每一个UIView都","detail_image_url":"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"]]
    }
    
   static func getJSONStringFromArray(array:Array<Any>) -> String {
        
        if (!JSONSerialization.isValidJSONObject(array)) {
            print("无法解析出JSONString")
            return ""
        }
        let data : NSData! = try? JSONSerialization.data(withJSONObject: array, options: []) as NSData
        let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
        return JSONString! as String
        
    }
    

    static public func serverReponse()->NSArray{
        let responseJSON = getJSONStringFromArray(array: loadNews())
        return [HZNews].deserialize(from: responseJSON)! as NSArray
    }
}

//
//  HZCoreImageViewController.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2018/10/22.
//  Copyright © 2018年 HZ. All rights reserved.

/*
 
（1） Core Image : 拥有强大的内置滤镜CIFilter
  + 使用内置滤镜对图片进行快速的艺术处理和加工
  + 对人脸等特征进行检测
  + 通过图像的直方图等信息进行画像色彩的增强
  + 同时使用多个滤镜以产生更加复杂多变的自定义效果
  + 创建运行在GPU上的自定义滤镜提高图像处理的速度
 
 
（2） Core Image 框架:
 
    Core Graphics   Core Video  Image I/O
 
          Core  Image 运行时
 
      GPU 渲染              CPU渲染
 
   OpenGL ES                GCD
 
 （3） Core Image框架中的三个类
 
   + CIFilter ：进行图像处理的滤镜
   + CIImage  : Core Image 框架中的图像类型
   + CIContext : Core Image 通过CIContext绘制由CIFliter处理后的结果
 */

import UIKit

import CoreImage

class HZCoreImageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = []

        // Do any additional setup after loading the view.
        
       blurEffectImage()
    }
    
    // 调整图片的单色调
    func adjustImage() -> Void {
        /*
           kCIContextUseSoftwareRenderer
           1> 设置为true时，渲染在CPU上执行，速度慢，但是可以在后台执行
           2> 设置为false，渲染在GPU上进行，使用OpenGL ES 速度快，但不能在后台操作
         */
       let option = Dictionary(dictionaryLiteral: (kCIContextUseSoftwareRenderer,true))
       let context = CIContext(options: option)
       let image = UIImage(named: "desktop")
       let imageView = UIImageView(image: image)
        
       let filter = CIFilter(name: "CIColorMonochrome")
       let ciImage = CIImage(image: image!)
        let color = CIColor(red: 0.8, green: 0.6, blue: 0.4)
        filter?.setValue(color, forKey: kCIInputColorKey)// 单色调滤镜的颜色
        filter?.setValue(1.0, forKey: kCIInputIntensityKey)// 单色调滤镜的作用强度
        filter?.setValue(ciImage, forKey: kCIInputImageKey)// 单色调滤镜的图像
        
        let resultImage = filter?.outputImage
        let outImage = context.createCGImage((filter?.outputImage)!, from: (resultImage?.extent)!)
        imageView.image = UIImage(cgImage: outImage!)
        self.view.addSubview(imageView)
        
        // 输出Core Image的所有滤镜
        let buildinFilter = CIFilter.filterNames(inCategory: kCICategoryBuiltIn)
        for filter in buildinFilter{
            let filter = CIFilter(name: filter  as String)
            let attribute = filter?.attributes
            print("[\(String(describing: filter))]\n")
            print(attribute as Any)
            print("\n---------------\n")
        }
    }
    
    // 给图片加马赛克
    func mosaicWithImage() -> Void {
        let image = UIImage(named: "desktop")
        let imageView = UIImageView(image: image)
        self.view.addSubview(imageView)
        
        let ciImage = CIImage(image: image!)
        let filter = CIFilter(name: "CIPixellate")
        filter?.setDefaults()
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        let outImage = filter?.outputImage
        imageView.image = UIImage(ciImage: outImage!)
    }
    
    /*
       Core image 处理视频画面
       利用AVFoundation框架中的协议对视频进行采样，将采样缓存的数据转换为CIImage对象，然后添加滤镜效果
     
     */
    
    
    /*
       CIDetector 和 CIFeature 检测图像中人的面部信息
     */
    
    /*
        UIBlurEffect 实现毛玻璃
     */
    
    func blurEffectImage() -> Void {
        let image = UIImage(named: "desktop")
        let imageView = UIImageView(image: image)
        self.view.addSubview(imageView)
        
        let blur = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blur)
        blurView.frame  = CGRect(x: 40, y: 40, width: 200, height: 200)
        blurView.layer.cornerRadius = 30
        blurView.clipsToBounds = true
        imageView.addSubview(blurView)
    }
    
    /*
       使用CGBlendMode实现颜色混合效果
     */
    
    func blendColorWithImage() -> Void {
        
    }
}

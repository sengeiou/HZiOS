//
//  HZLoginViewController.swift
//  HZSwiftUIKIT
//
//  Created by KB on 2018/6/28.
//  Copyright © 2018年 HZ. All rights reserved.
/*
   输入手机号
   点击获取验证码
   完成登陆操作
 */



import UIKit

class HZLoginViewController: UIViewController{
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        /*
            1> edgesForExtendedLayout ：
               它的默认值是UIRectEdgeAll，四周边缘均延伸,即使有Nav,TabBar也是一样
            2> automaticallyAdjustsScrollViewInsets
               automaticallyAdjustsScrollViewInsets改变的并不是UIScrollView的frame
               ，而是它的内容区域contentView的可滚动区域
            兼容 iOS11
                 if (@available(iOS 11.0, *)) {
                   self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
                 }else {
                   self.automaticallyAdjustsScrollViewInsets = NO;
                 }
         */
        self.edgesForExtendedLayout = []
        setupUI()
    }
    
    private func setupUI(){
        
        let marginLeft:CGFloat = 20.0
        let marginTop:CGFloat  = 20.0
        let attachPhoneNumLabel = UILabel.init()
        attachPhoneNumLabel.frame = CGRect.init(x: marginLeft, y: marginTop, width: CGFloat(200.0), height: CGFloat(30.0))
        attachPhoneNumLabel.text = "绑定手机号"
        attachPhoneNumLabel.font = UIFont.boldSystemFont(ofSize: 30);
        self.view.addSubview(attachPhoneNumLabel)
        
        let areaLabel = UILabel.init()
        let areaFont = UIFont.systemFont(ofSize: 12)
        areaLabel.font = areaFont
        areaLabel.text = "国家地区"
        areaLabel.textColor = UIColor.lightGray
        let areaSize = sizeOfString(font: areaFont, text: areaLabel.text! as NSString)
        areaLabel.frame = CGRect.init(x: marginLeft, y: (CGFloat(attachPhoneNumLabel.frame.maxY) + marginTop*2), width: CGFloat(areaSize.width), height: CGFloat(areaSize.height))
        self.view.addSubview(areaLabel)
        
        let areaSelectBtn = UIButton.init(type: UIButtonType.custom)
        let selectBtnText = "中国 >"
        areaSelectBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14);
        areaSelectBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
        areaSelectBtn.setTitle(selectBtnText, for: UIControlState.normal)
        areaSelectBtn.frame = CGRect.init(x: areaLabel.frame.maxX, y: areaLabel.frame.origin.y, width: CGFloat(60), height: CGFloat(areaLabel.frame.size.height))
        self.view.addSubview(areaSelectBtn)
        
        let phoneLabel = UILabel.init()
        phoneLabel.text = "+86"
        phoneLabel.frame = CGRect.init(x: marginLeft, y: areaLabel.frame.maxY + marginTop, width: CGFloat(40), height: CGFloat(40))
        self.view.addSubview(phoneLabel)
        
        let phoneNumTF = UITextField.init()
        phoneNumTF.frame = CGRect.init(x: phoneLabel.frame.maxX, y: phoneLabel.frame.origin.y, width: CGFloat(200), height: CGFloat(40))
        phoneNumTF.placeholder = "请输入手机号"
        phoneNumTF.textColor = UIColor.lightGray
        self.view.addSubview(phoneNumTF)
        
        
        let nextBtn = UIButton.init(type: UIButtonType.custom)
        let viewWidth = self.view.frame.size.width
        nextBtn.frame = CGRect.init(x: marginLeft, y: phoneNumTF.frame.maxY+marginTop, width: viewWidth-marginLeft*2, height: CGFloat(50))
        nextBtn.setTitle("下一步", for: UIControlState.normal)
        nextBtn.setTitleColor(UIColor.lightText, for: UIControlState.normal)
        nextBtn.addTarget(self, action: #selector(HZLoginViewController.nextBtnAction), for: UIControlEvents.touchUpInside)
        nextBtn.backgroundColor = UIColor.lightGray
        self.view.addSubview(nextBtn)
        
    }
    
    private func sizeOfString(font:UIFont,text:NSString)->CGSize{
       return text.boundingRect(with: CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font:font], context: nil).size
    }
    
    @objc private func nextBtnAction(){
        NSLog("nextBtnAction.......")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}


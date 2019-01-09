//
//  WeiboTableViewCell.swift
//  HZSwiftUIKIT
//
//  Created by KB on 2018/7/23.
//  Copyright © 2018年 HZ. All rights reserved.
//

import UIKit

class WeiboTableViewCell: UITableViewCell {

    var avatar:UIImageView?
    var mbType:UIImageView?
    var userName:UILabel?
    var createAt:UILabel?
    var source:UILabel?
    var textMsg:UILabel?
    var cellHeight:CGFloat?
    

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    // 初始化视图显示的控件
    func setUpView(){
        self.avatar = UIImageView();
        self.contentView.addSubview(self.avatar!)
        
        self.mbType = UIImageView();
        self.contentView.addSubview(self.mbType!)
    }
    
    // 设置数据
    func setWeibo(weibo:Weibo){
        // 设置数据
        // 创建控件的Frame
        self.avatar?.image = UIImage.init(named: weibo.profileImageUrl!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

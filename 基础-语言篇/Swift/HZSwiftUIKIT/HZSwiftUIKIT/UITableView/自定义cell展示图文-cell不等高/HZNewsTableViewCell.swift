//
//  HZNewsTableViewCell.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2019/3/13.
//  Copyright © 2019年 HZ. All rights reserved.
/*
   设置圆角避免离屏渲染
 （0） UIView 可以直接
       cornerRadius
       clipsToBounds
  (1) UITextFiled UITextView
 （2） UILabel
   + 设置label边框圆角
         titleLabel?.layer.borderColor = UIColor.orange.cgColor
         titleLabel?.layer.borderWidth = 1.0
         titleLabel?.layer.cornerRadius = 10
   + 设置有背景色的label圆角
     titleLabel?.layer.cornerRadius = 10
     titleLabel?.layer.backgroundColor = UIColor.red.cgColor
    不要使用clipsToBounds 会引发离屏渲染问题
  (3) UIButton
  (4) UIImageView
      cornerRadius
      clipsToBounds
      不要使用背景色
 
 */

import UIKit
import Kingfisher

class HZNewsTableViewCell: UITableViewCell {
   private var avatarImageView:UIImageView?
   private var titleLabel:UILabel?
   private var showImageView:UIImageView?
   private var contentLabel:UILabel?
   private var confirmButton:UIButton?
    
    static public func cellWithTableView(tableView:UITableView,identifier:String)-> HZNewsTableViewCell{
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = HZNewsTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        return cell as! HZNewsTableViewCell
    }

    // 属性观察器
    public var newsFrame:HZNewsFrame = HZNewsFrame(){
        willSet(frame){
            avatarImageView?.frame = frame.avatarFrame!
            self.setRemoteURLToImageView(imageView: avatarImageView!, url: frame.news!.avatar_image_url!, cornerRadius: 20, placeholder: "avatar.png")
            titleLabel?.frame = frame.titleFrame!
            titleLabel?.text = frame.news?.title
            titleLabel?.layer.borderColor = UIColor.orange.cgColor
            titleLabel?.layer.borderWidth = 1.0
            titleLabel?.layer.cornerRadius = 10
             titleLabel?.layer.backgroundColor = UIColor.red.cgColor
//            titleLabel?.clipsToBounds = true
            
            
            showImageView?.frame = frame.showImageFrame!
            self.setRemoteURLToImageView(imageView: showImageView!, url: frame.news!.detail_image_url!, cornerRadius: 10, placeholder: "content.png")
            contentLabel?.frame = frame.contentFrame!
            contentLabel?.text = frame.news?.content
            
            confirmButton?.frame = frame.confirmFrame!
            confirmButton?.layer.cornerRadius = 10
            confirmButton?.clipsToBounds = true
            confirmButton?.setBackgroundImage(UIImage(named: "content.png"), for: UIControlState.normal)
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        avatarImageView = UIImageView()
        avatarImageView?.layer.cornerRadius = 20.0
        avatarImageView?.clipsToBounds = true
        
        titleLabel = UILabel()
        showImageView = UIImageView()
    
        contentLabel = UILabel()
        contentLabel?.numberOfLines = 0
        contentLabel?.font = UIFont.systemFont(ofSize: 15.0)
        
        confirmButton = UIButton(type: UIButtonType.system)
        
        self.contentView.addSubview(avatarImageView!)
        self.contentView.addSubview(titleLabel!)
        self.contentView.addSubview(showImageView!)
        self.contentView.addSubview(contentLabel!)
        self.contentView.addSubview(confirmButton!)
    }
    
    
    func setRemoteURLToImageView(imageView:UIImageView,url:String,cornerRadius:CGFloat,placeholder:String) -> Void {
        let optionsInfo = [KingfisherOptionsInfoItem.transition(ImageTransition.fade(1)),
                           KingfisherOptionsInfoItem.processor(RoundCornerImageProcessor(cornerRadius: cornerRadius))]
        imageView.kf.setImage(with: URL(string: url), placeholder: UIImage(named:placeholder), options:optionsInfo, progressBlock: nil)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

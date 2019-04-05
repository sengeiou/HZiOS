//
//  TableViewInCell.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2018/10/14.
//  Copyright © 2018年 HZ. All rights reserved.
//

import UIKit

class TableViewInCell: UITableViewCell,UITableViewDataSource,UITableViewDelegate {
    var tableView : UITableView!
    var comments : [Comment] = []
    var cellHeight : CGFloat?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        
        self.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "reuseCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
            cell?.textLabel?.font = UIFont.systemFont(ofSize: 12)
            cell?.textLabel?.textColor = UIColor.gray
            cell?.textLabel?.numberOfLines = 0
        }
        cell?.textLabel?.text = comments[indexPath.row].comment
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let comment = comments[indexPath.row]
        return comment.height!
    }
    
    func setCommentsForTable(_ comments:[String], _ commentsHeight:inout [CGFloat]){
        var tableHeight : CGFloat = 0.0
        for i in 0..<comments.count{
            let commentContent = comments[i]
            let font = UIFont.systemFont(ofSize: 12)
            var  height = sizeWithText(text: commentContent, font: font, size: CGSize(width: self.width, height: CGFloat.greatestFiniteMagnitude)).height
            if height < 30{
                height = 30
            }
            tableHeight += height
            let comment = Comment(comment: commentContent, height: height)
            self.comments.append(comment)
        }
        self.cellHeight = tableHeight
        commentsHeight.append(tableHeight)
        var  frame = tableView.frame
        let width = UIScreen.main.bounds.size.width
        frame.size.height = tableHeight
        frame.size.width = width
        tableView.frame = frame
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
    
    func sizeWithText(text: String, font: UIFont, size: CGSize) -> CGSize {
        let attributes = NSDictionary(object: font, forKey: kCTFontAttributeName as! NSCopying)
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        let rect:CGRect = text.boundingRect(with: size, options: option, attributes: attributes as? [NSAttributedStringKey : Any], context: nil)
        return rect.size;
    }
    

}

class Comment: NSObject {
    var comment : String?
    var height : CGFloat?
    
    init(comment:String,height:CGFloat) {
        self.comment = comment
        self.height = height
    }
}

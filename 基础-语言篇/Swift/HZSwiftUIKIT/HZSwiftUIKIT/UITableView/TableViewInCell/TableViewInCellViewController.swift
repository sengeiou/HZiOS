//
//  TableViewInCellViewController.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2018/10/14.
//  Copyright © 2018年 HZ. All rights reserved.
//

import UIKit

class TableViewInCellViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var articles = ["微软有哪些黑历史","苹果有哪些黑科技？","巴宝莉和Apple TV强强联手推出天台秀直播"]
    var comments = [["省略的文字","省略的文字","省略的文字,省略的文字,省略的文字,省略的文字省略的文字省略的文字省略的文字"],["省略的文字","省略的文字"],["省略的文字","省略的文字","省略的文字","省略的文字","省略的文字"]]
    var tableView = UITableView()
    
    var commentHeight :[CGFloat] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = []
        
        let statusHeight = UIApplication.shared.statusBarFrame.size.height
        let navHeight = self.navigationController?.navigationBar.frame.size.height
        let statusAndNavHeight = statusHeight + navHeight!
        // iphoneX系列的底部安全区域
        var bottomAdjust:CGFloat = 0.0
        if #available(iOS 11.0, *) {
            let safeArea = UIApplication.shared.keyWindow?.safeAreaInsets
            bottomAdjust = safeArea!.bottom
        }
        
        var frame = self.view.frame
        frame.size.height = frame.size.height  - statusAndNavHeight - bottomAdjust
        tableView.frame = frame
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count * 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellForArticle = "cellForArticle"
        let cellForComments = "cellForComments"
        
        var cell1: UITableViewCell?
        var cell2: TableViewInCell?
        
        if indexPath.row % 2 == 0 {
            cell1 = tableView.dequeueReusableCell(withIdentifier: cellForArticle)
            if cell1 == nil {
                cell1 = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellForArticle)
                cell1?.textLabel?.font = UIFont.systemFont(ofSize: 16)
                cell1?.textLabel?.textColor = UIColor.lightGray
                cell1?.backgroundColor = UIColor.black
            }
            cell1?.textLabel?.text = articles[indexPath.row / 2]
            return cell1!
        }else{
            cell2 = tableView.dequeueReusableCell(withIdentifier: cellForComments) as? TableViewInCell
            if cell2 == nil{
                cell2 = TableViewInCell(style: UITableViewCellStyle.default, reuseIdentifier: cellForComments)
            }
            let subComments = comments[indexPath.row / 2]
            cell2?.setCommentsForTable(subComments,&commentHeight)
            return cell2!
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row % 2 == 0{
            return 40.0
        }else{
            let height = commentHeight[indexPath.row / 2]
            return height
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

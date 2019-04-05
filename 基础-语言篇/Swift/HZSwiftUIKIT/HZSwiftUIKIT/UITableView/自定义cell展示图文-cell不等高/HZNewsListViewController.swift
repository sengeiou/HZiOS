//
//  HZNewsListViewController.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2019/3/13.
//  Copyright © 2019年 HZ. All rights reserved.
//

import UIKit

class HZNewsListViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    private var tableview:UITableView?
    private var newsArray:NSMutableArray = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI()  {
        let frame = UIView.adjustScrollViewFrame(self)
        tableview = UITableView(frame: frame, style: UITableViewStyle.plain)
        tableview?.delegate = self
        tableview?.dataSource = self
        self.view.addSubview(tableview!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if newsArray.count == 0 {
            let news = HZNews.serverReponse()
            for item in news{
                let frame = HZNewsFrame()
                // 提前排版
                frame.news = item as? HZNews
                newsArray.add(frame)
            }
            tableview?.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "newsCell"
        let cell =  HZNewsTableViewCell.cellWithTableView(tableView: tableView, identifier: identifier)
        let newFrame = newsArray[indexPath.row] as! HZNewsFrame
        cell.newsFrame = newFrame
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let frame = newsArray[indexPath.row] as! HZNewsFrame
        return frame.cellHeight!
    }
}

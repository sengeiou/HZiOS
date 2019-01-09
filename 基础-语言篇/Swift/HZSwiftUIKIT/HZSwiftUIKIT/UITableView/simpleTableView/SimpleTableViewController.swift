//
//  SimpleTableViewController.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2018/10/11.
//  Copyright © 2018年 HZ. All rights reserved.
//

import UIKit

class SimpleTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let tableView = UITableView()
    var dataSource:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = []
        
        for index in 1..<20{
            dataSource.append("\(index)")
        }
        
        setUp()

        // Do any additional setup after loading the view.
    }
    
    func setUp() -> Void {
        let statusHeight = UIApplication.shared.statusBarFrame.size.height // iPhone X series： 44
        let navHeight = self.navigationController?.navigationBar.frame.size.height // 44
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
        tableView.setEditing(true, animated: true)
        self.view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "cellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if !(cell != nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        cell?.textLabel?.text = "普通列表"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 单选需要记住当前选择的cell
        // 多选则需要记住当前选择的所有Cell
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.accessoryType == UITableViewCellAccessoryType.none{
            cell?.accessoryType = UITableViewCellAccessoryType.checkmark
        }else{
            cell?.accessoryType = UITableViewCellAccessoryType.none
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        // 先处理数据源 再执行具体操作
        if editingStyle == UITableViewCellEditingStyle.delete{
            dataSource.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.left)
        }else if editingStyle == UITableViewCellEditingStyle.insert{
            dataSource.insert("123", at: indexPath.row)
            tableView.insertRows(at: [indexPath], with: UITableViewRowAnimation.left)
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // 移动单元格
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let fromRow = sourceIndexPath.row
        let toRow = destinationIndexPath.row
        let selected = dataSource[fromRow]
        
        dataSource.remove(at: fromRow)
        dataSource.insert(selected, at: toRow)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

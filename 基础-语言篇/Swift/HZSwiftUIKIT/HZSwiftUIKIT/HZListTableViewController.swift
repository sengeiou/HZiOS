//
//  HZListTableViewController.swift
//  HZSwiftUIKIT
//
//  Created by apple on 16/10/31.
//  Copyright © 2016年 HZ. All rights reserved.
//

import UIKit

class HZListTableViewController: UITableViewController {
    public var dataSource:[String]?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.dataSource?.count)!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cellIdentifer = "cellIdentifier"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellIdentifer)
        }
        cell?.textLabel?.text = self.dataSource![indexPath.row]
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let classString = (self.dataSource?[indexPath.row])!
        let  className:AnyClass? =   NSClassFromString("HZSwiftUIKIT." + classString)
        let viewControllerClass: UIViewController.Type = className as! UIViewController.Type
        let viewController = viewControllerClass.init()
        self.navigationController?.pushViewController(viewController, animated: true)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

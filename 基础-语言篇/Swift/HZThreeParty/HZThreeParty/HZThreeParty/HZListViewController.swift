//
//  HZListViewController.swift
//  HZThreeParty
//
//  Created by KB on 2018/7/30.
//  Copyright © 2018年 BQ. All rights reserved.
//

import UIKit

class HZListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    public var dataSource: [String]?
    public var tableView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpSubView()
    }
    
    func setUpSubView() -> Void {
        tableView = UITableView(frame: self.view.frame, style: UITableViewStyle.plain)
        tableView!.delegate = self
        tableView!.dataSource = self
        self.view.addSubview(tableView!);
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource!.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "threePartyIdentifier"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellID)
        }
        cell?.textLabel?.text = dataSource![indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let classString = (self.dataSource?[indexPath.row])!
        let  className:AnyClass? =   NSClassFromString("HZThreeParty." + classString)
        let viewControllerClass: UIViewController.Type = className as! UIViewController.Type
        let viewController = viewControllerClass.init()
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

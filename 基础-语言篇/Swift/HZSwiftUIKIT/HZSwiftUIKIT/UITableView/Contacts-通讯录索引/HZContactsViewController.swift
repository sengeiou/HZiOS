//
//  HZContactsViewController.swift
//  HZSwiftUIKIT
//
//  Created by KB on 2018/7/23.
//  Copyright © 2018年 HZ. All rights reserved.
//

import UIKit

class HZContactsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var tableView:UITableView?
    var contacts:[ContactGroup]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initData()

        self.tableView = UITableView(frame: self.view.frame, style: UITableViewStyle.grouped)
        self.tableView!.delegate = self;
        self.tableView!.dataSource = self;
        
        self.view.addSubview(self.tableView!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let contactGroup:ContactGroup = self.contacts![section]
        return (contactGroup.contacts?.count)!;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return (self.contacts?.count)!;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "contactsCell";
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellID)
        }
        let contactGroup:ContactGroup = self.contacts![indexPath.section]
        let contact = contactGroup.contacts![indexPath.row]
        cell?.textLabel?.text = contact.userName()
        return cell!
    }
    
    // 头标题
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let group = self.contacts![section];
        return group.groupName!;
    }
    
    // 返回每组标题索引
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        var titles:[String] = [];
        for group in self.contacts! {
            titles.append(group.groupName!)
        }
        return titles
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            self.tableView?.deleteRows(at: [indexPath], with: UITableViewRowAnimation.bottom)
        }
    }
    
    // 创建通讯录数据
    func initData(){
        let groupL = ContactGroup(groupName: "L")
        let li = Contact(firstName: "Ming", lastName: "Li", phoneNum: "18518487767")
        let le = Contact(firstName: "ha", lastName: "Le", phoneNum: "17518487767")
        groupL.addContact(contact: li)
        groupL.addContact(contact: le)
        
        let groupW = ContactGroup(groupName: "W")
        let wang = Contact(firstName: "jing", lastName: "Wang", phoneNum: "13523453456")
        let wen = Contact(firstName: "wen", lastName: "Wen", phoneNum: "13423452345")
        groupW.addContact(contact: wang)
        groupW.addContact(contact: wen)
        
        
        self.contacts = [];
        self.contacts?.append(groupL)
        self.contacts?.append(groupW)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

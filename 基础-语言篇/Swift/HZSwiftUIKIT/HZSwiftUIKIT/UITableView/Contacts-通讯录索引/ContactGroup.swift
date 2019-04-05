//
//  ContactGroup.swift
//  HZSwiftUIKIT
//
//  Created by KB on 2018/7/23.
//  Copyright © 2018年 HZ. All rights reserved.
//

import UIKit

class ContactGroup: NSObject {
    var groupName:String?
    var contacts:[Contact]?
    
    init(groupName:String) {
        self.groupName = groupName
        self.contacts = []
    }
    
    func addContact(contact:Contact){
        self.contacts?.append(contact)
    }
}

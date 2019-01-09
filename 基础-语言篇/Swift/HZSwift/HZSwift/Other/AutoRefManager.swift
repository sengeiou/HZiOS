//
//  AutoRefManager.swift
//  HZSwift
//
//  Created by apple on 16/11/16.
//  Copyright © 2016年 HZ. All rights reserved.
//

import Cocoa

enum AutoRefManagerError:Error {
    case invalidSelection
    case outOfRange
}

class AutoRefManager: NSObject {
    let name: String
    let text: String?
    
    lazy var asHTML: (Void) -> String = {
        [unowned self] in
       self.text!
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
   public   func showReferenceCount() throws  {
        throw AutoRefManagerError.invalidSelection
    }
    
    public   func showReferenceCount1() throws {
         try showReferenceCount()
    }
    
    func anotherError()  {
        do {
             try showReferenceCount1()
        } catch  AutoRefManagerError.invalidSelection{
        
        }catch  AutoRefManagerError.outOfRange{
            
        }catch{
           
        }
    }
}

class HTMLElement:NSObject {
    
    let name: String
    let text: String?
    
    lazy var asHTML: (Void) -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
    
}

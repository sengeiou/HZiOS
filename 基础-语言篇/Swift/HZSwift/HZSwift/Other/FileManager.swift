//
//  FileManager.swift
//  HZSwift
//
//  Created by apple on 16/11/17.
//  Copyright © 2016年 HZ. All rights reserved.
//

import Cocoa
enum FileManagerError:Error{
    case filePathNotExist
    case fileAuthorityForbidden
}
class FileManager: NSObject {
// 定义一个throwing函数对操作过程遇到的错误进行处理
  public  func openFile(filePath:String) throws -> Bool {
        if  !filePath.isEmpty {
           return true
        }else{
            throw FileManagerError.filePathNotExist
        }
    }
}

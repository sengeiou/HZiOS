//
//  Subscripts.swift
//  Swift_Start
//
//  Created by dafy on 16/1/21.
//  Copyright © 2016年 Dafy. All rights reserved.
//

import Cocoa

class Subscripts: NSObject {
   // 下标
    func testFunc(){
        let threeTimeTable = TimesTable(multiplier: 3)
        print(threeTimeTable[6])
    }
}

struct TimesTable {
    let multiplier:Int
    subscript(index:Int)->Int{
      return multiplier * index
    }
}

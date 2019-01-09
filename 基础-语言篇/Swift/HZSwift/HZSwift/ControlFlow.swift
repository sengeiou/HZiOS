//
//  ControlFlow.swift
//  Swift_Start
//
//  Created by dafy on 16/1/19.
//  Copyright © 2016年 Dafy. All rights reserved.
//

import Cocoa

class ControlFlow: NSObject {
 
    
    func test(){
        
        // for循环
        for index in 0 ..< 5 {
           print(index)
        }
    
        
        // 条件语句
        let conditionNum = 3
        if conditionNum > 3{
           
        }else{
           
        }
        
        // switch分支语句
        let someCharacter:Character = "a"
        switch someCharacter {
          case "a","e","i","o","u":
            print("\(someCharacter) is a vowel")
          case "b","d":
            print("\(someCharacter) is a consonant")
         default:
            print("")
        }
        
        // 区间匹配
        let approximateCount = 62
        switch approximateCount{
            case 1...5:
                print("")
            case 6...10:
                print("")
            default:
                print("")
        }
        
        // 元组
        let somePoint = (1,1)
        switch somePoint{
        case(0,0):
            print("(0,0)is at the origin")
        case(_,0):
            print("(\(somePoint.0),0) is on the x-axis")
        default:
            print("")
        }
        
        //
        
    }
    /*
       guard : 将不符合条件的处理事件前置
     */
    var age =  18
    func online(age: Int) -> Void{
        guard age >= 18 else {
            print("go home")
            return
        }
        
        print("可以上网！")
    }
    
    var phoneNumber = "13134567896"
    
    func login() -> Void {
        guard phoneNumber.count == 0 else {
            print("手机号不能为空！")
            return
        }
        print("输入验证码")
    }
}

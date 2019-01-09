//
//  Closures.swift
//  Swift_Start
//
//  Created by dafy on 16/1/20.
//  Copyright © 2016年 Dafy. All rights reserved.
//

import Cocoa

class Closures: NSObject {
    
    var handler: (([String])->Void)?
    
    func requestUserDataWithCompleteHandler(handler:(([String])->Void)?)->Void{
        handler!(["1","2"])
    }
    
    func test(){
        
        requestUserDataWithCompleteHandler { (result) in
            print(result)
        }
        
        //声明
        let closures = Closures()
        closures.handler = {
            (result) -> Void in
            print(result)
        }
        //调用
        if closures.handler != nil {
            closures.handler!(["11","22","33"])
        }
        
        // 声明
        var action:(([String])->Void)?
        // 赋值
        action={
            (result)->Void in
            print(result)
        }
        //调用
        action!(["1","2"])
        
        
        
        
        /*
           闭包：自包含的代码片段，可以在代码中被传递和使用
         */
        
        // 数组排序
        let names = ["chris","Alex","Ewa","Barry","Daniella"]
        func backWard(_ str1:String,str2:String)->Bool{
            return str1 > str2
        }
        
        let namesSort = names.sorted(by: backWard)
        print(namesSort)
       
        /*
           闭包表达式的语法
         {
            (params)-> return type  in statements
         }
         */
        let reversed = names.sorted(by: {
                                   (str1:String,str2:String)-> Bool in
                                   return str1 > str2
                                 })
        let reversed0 = names.sorted { (str1, str2) -> Bool in
            return str1 > str2
        }
        print(reversed + reversed0)
        
        
        let newName = names.sorted{ (str1:String, str2:String) -> Bool in
            return str1 > str2
        };
        print(newName)
        
        //根据上下文推断类型(因为swift能推断出参数和返回值的类型)
        let reversed1 = names.sorted(by: {
                                     (str1,str2) in return str1 > str2
                                  })
        print(reversed1)
        
        // 单表达式闭包隐式返回(单行表达式闭包可以省略return)
        let reversed2 = names.sorted(by: {str1,str2 in str1 > str2 })
        print(reversed2)
        
        // 参数名称缩写
        let reversed3 = names.sorted(by: { $0 > $1 })
        print(reversed3)
        
        // 运算符函数 (> 是String 实现的一个函，函数类型是 （String,String）->Bool )
        let reversed4 = names.sorted(by: >)
        print(reversed4)
        
        //尾随闭包(将闭包作为最后一个参数传递给函数的时候可以考虑使用尾随闭包)
        // 书写在函数括号之后的闭包表达式
        let digitalNums = [0:"zero",1:"one",2:"two",3:"three",4:"four",5:"five",6:"six",7:"seven"]
        let numbers = [16,58,510]
        
       let numbersReversed = numbers.map{
            (number)-> String in
            var outPut = ""
            while number > 0 {
              outPut = digitalNums[number%10]! + outPut
            //  number = number / 10
            }
           return outPut
        }
        print(numbersReversed)
 
        
        
        // 捕获值 ()
        func makeIncrementor(forIncrement amount:Int)->()->Int{
            var runningTotal = 0
            func incrementor()->Int{
                runningTotal += amount
                return runningTotal
            }
            return incrementor
        }
        
        let incrementorByTen = makeIncrementor(forIncrement: 10)
        incrementorByTen() //10
        incrementorByTen() // 20
        
        
        // 闭包是引用类型(将闭包值无论赋值给常量或是变量,他们指向同一个闭包)
        let alsoInscrementorByTen = incrementorByTen
        alsoInscrementorByTen()// 30 
        
        
        // 非逃逸闭包和逃逸闭包（）
        // @noescape:表明作为函数参数的闭包执行作用域只能存在函数的作用域中
        // @escaping逃逸闭包：将闭包赋值在函数的作用域外的一个变量，这样闭包就能在函数返回之后被调用了
        
        
        //自动闭包 ：自动创建的闭包，封装一个表达式传递给函数作为参数，，当闭包被调用时返回表达式的值；
        //自动闭包没有入参只有返回参数
        
        
        func someFunctionWithEscapingClosure(completionHandler: (_ responseString:String) -> Void) {
            completionHandler("hello")
        }

        
        func testHandler(){
            someFunctionWithEscapingClosure { (responseString) in
                print(responseString)
            }
        }
        
        func requestFeed(param: NSDictionary,completeHandler: (_ isSuccess: Bool,_ message: NSString,_ result: NSArray) -> Void){
            completeHandler(true,"",[]);
        }
        
        func testRequest(){
            requestFeed(param: ["key":"value"]) { (isSuccess, message, result) in
                if isSuccess{
                    
                }else{
                    
                }
            }
        }
        
    }
    
    /*
       闭包作为参数传递给函数，
       并在函数返回之后执行，需要使用@escaping关键字标识
     */
    var handlerArray:[()->String] = []
    
    func func1(handler:@escaping ()->String)->(()->String){
        handlerArray.append(handler)
        func func2()->String{
            return ""
        }
        return func2
    }
    
    // 从服务端获取数据
    func requestDataFromServer(){
        loadData { (result) in
            print("获取的json\(result)")
        }
    }
    
    //completion这个闭包的执行在loadData函数的作用域外了，必须使用@escaping关键字修饰
    func loadData(completion: @escaping(_ result: [String])->Void) {
        let group = DispatchGroup.init();
        
       
        DispatchQueue.global().async {
            print("耗时操作\(Thread.current)")
            Thread.sleep(forTimeInterval:1.0)
            let json = ["22","33","44"]
            DispatchQueue.main.async {
                print("主线程\(Thread.current)")
                completion(json)
            }
        }
    }


}

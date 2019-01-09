//
//  ARC.swift
//  Swift_Start
//
//  Created by dafy on 16/1/22.
//  Copyright © 2016年 Dafy. All rights reserved.
//

import Cocoa

class ARC: NSObject {

}


 /// 使用weak解决 两个类之间的循环引用（房间和人作为属性都可以为空）

class Person {
    var name:String
    init(name:String){
      self.name = name
    }
    var apartment:Apartment?
    deinit{
    
    }
}

class Apartment {
    var apartmentNum:Int
    init(num:Int){
       apartmentNum = num
    }
    weak var tenant:Person?
    deinit{
    
    }
}


// 无主引用 (和weak的区别是必须有值)
class Customer{
    let name:String
    var creditCard:CreditCard?
    init(name:String){
      self.name = name
    }
    deinit{
       print("\(name) is deinit")
    }
}

class CreditCard {
    let creditNo:UInt64
    unowned var customer:Customer  // 银行卡是必须有所属
    init(creditNo:UInt64,customer:Customer){
        self.creditNo = creditNo
        self.customer = customer
    }
    deinit{
      print("\(self.customer.name) \(creditNo) is deinit")
    }
    
}


/*
 (1) A类 B类 均可以为 nil 可以采用 weak方式打破循环引用
（2） A类 可以为nil ，B类不能为nil 可以采用 unowned的方式打破循环引用
（3） A类 和 B类都不能为nil 这样需要一个类使用无主引用，另一个使用隐式解析可选属性

*/


class Country {
    let name:String
    var capitalCity:City!
    init(name:String,capitalName:String){
        self.name = name
        self.capitalCity = City(name: name, country:self)
    }
}

class City {
    let name:String
    unowned let country:Country
    init(name:String,country:Country){
        self.name = name
        self.country = country
    }
}


/*
  闭包引起的循环强引用
  闭包作为一个实例的强引用属性，在闭包内又使用了 self.someProperty 或是 self.someMethod(),这两种情况会导致闭包捕获self，从而产生循环强引用

*/

class HTMLElement{
    let name:String
    let text:String?
    lazy var asHTML:() ->String = {
        [unowned self] in // 自定义捕获列表
        if let text = self.text{
          return   "<\(self.name)>\(text)"
        }else{
           return  "<\(self.name)>"
        }
    }
    
    init(name:String,text:String?=nil){
       self.name = name
       self.text = text
    }
    
    deinit{
       print("\(name) is being deinitialiized!")
    }
}

// 如何解决闭包引起的强循环引用

/*
  定义捕获列表：
  捕获列表中的每一项都由一对元素组成，一个元素是weak或unowned，另一个元素是类实例的引用（例如：self）或初始化过的变量（如 delegate = self.delegate！）

  lazy var someClosure:(Int,String)->String = {
      [unowned self ,weak delegate = self.delegate!](index:Int,stringToProcess:String)->String
      in 
     // 闭包的函数体
}

*/


/*
  无主引用：在闭包和捕获的实例总是互相引用并且总是同时销毁时，将闭包内的捕获定义为无主引用
  弱引用：被捕获的引用可能会变成为nil值，将闭包内的捕获定义为弱引用
*/









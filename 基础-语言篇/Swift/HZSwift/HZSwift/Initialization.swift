//
//  Initialization.swift
//  Swift_Start
//
//  Created by dafy on 16/1/21.
//  Copyright © 2016年 Dafy. All rights reserved.
//

import Cocoa

class Initialization: NSObject {
   
}

class InitiaClass {
    /*
      类和结构体在创建实例时，必须为存储属性赋值
    */
    
    init(){
    
    }
    
    struct Fahrenheit {
        var temperture:Double
        init(){
            // 初始化的时候赋值
          temperture = 32.0
        }
    }
    
    func testFunc(){
       let f = Fahrenheit()
        print(f.temperture)
    }
    
    struct Color {
        let red,green,blue:Double
        init(red:Double,green:Double,blue:Double){
            self.red = red
            self.blue = blue
            self.green = green
        }
        init(white:Double){
          self.red = white
          self.blue = white
          self.green = white
        }
    }
    
    func testFun1(){
        let color = Color(red: 1.0, green: 1.0, blue: 2.0)
        print(color)
    }
    
    // 构造过程中常量属性的修改（一定要在实例创建前赋值）
}


class SurveyQueston{
    let text:String
    var reponse:String?
    init(text:String){
       self.text = text
    }
    func ask(){
     print(text)
    }
}


// 构造器的继承和重写

class Vehicles {
    var numberofWheel = 0
    var description:String{
       return "numberOfWheels is \(numberofWheel)"
    }
}

class Bicycles: Vehicles {
    // 父类存在一个默认构造器，所以子类需要重写
    override init() {
        super.init() //调用父类构造器（保证继承来的属性能完成初始化操作）
        self.numberofWheel = 2
    }
}


class Food {
    var name:String
    //指定构造器
    init(name:String){
      self.name = name
    }
    //便利构造器
    convenience init(){
        self.init(name:"[unname]")
    }
}

class RecipeIngredient: Food {
    var quantity :Int
    //子类特有的指定构造器
    init(name:String,quantity:Int){
      self.quantity = quantity // 初始化特有的属性
      super.init(name: name)// 调用父类指定构造器完成继承属性的初始化操作
    }
    
    override convenience init(name: String) {
        self.init(name:name,quantity:1)
    }
}

class ShoppingListItems: RecipeIngredient {
    var purchased = false
    var decription:String {
      return "dsfadsfasd"
    }
}



struct CheckBoard {
    let boardColors:[Bool]={
        var isBlack = false
        var tempArr = [Bool]()
        for i in 1...10{
            for j in 1...10{
              tempArr.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return tempArr
    }()
    func squareIsBlackAtRow(_ row:Int,column:Int)->Bool{
      return boardColors[(row * 10) + column]
    }
}






//
//  main.swift
//  HZSwift
//
//  Created by apple on 16/10/27.
//  Copyright © 2016年 HZ. All rights reserved.
//

import Foundation

//var  array = OperationArray()
//var  tempArray = [1,2,2,3,4,5]

//array.plusOne(array: tempArray)
//let count = array.removeElement(array: &tempArray, value: 2)
////let count = array.removeDuplicatesAllowTwiceShow(array:&tempArray,value: 5)
//print(count)

var newProtocol  = NewProtocol()
newProtocol.name = "kobe"
newProtocol.delegate = HelpNewProtocol()
newProtocol.completeHandler = {
    (name:String)->Void in
   print(name)
}
newProtocol.wantMove()

func testPerson() -> Void {
    let person = HZPerson(name: "hz", sex: 0, age: 28, address: "zhonguo", graduateSchool: ["1","2"])
    person.cook()
    person.run()
}







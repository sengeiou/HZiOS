//
//  OperationArray.swift
//  HZSwift
//
//  Created by apple on 16/11/28.
//  Copyright © 2016年 HZ. All rights reserved.
//

import Cocoa

class OperationArray: NSObject {
    
    /**
     *  从数组中移除指定的Value，并返回数组的操作后的数组长度
     *  数组中元素的移除可以使用其他位置的元素覆盖的方式解决
     *  游标j从0开始，遍历数组如果没有遇到相同元素，就让游标j+1，遇到相同元素就跳过此次遍历，下次如果遇到的不同元素就
     *  把此元素替换到刚刚遇到相同元素的位置，游标j+1；遵循此种方式知道所有元素被遍历完，j就是新数组的长度，指定的元素都被其他
     *  元素所替换了；至此完成操作
     *  [1,2,2,3,4,2,5]
     *
     *  （1）函数内部改变函数参数需要使用inout关键字；
     *  （2）Swift中采用的for...in 来遍历
     */
    public  func removeElement( array:inout [Int],value:Int) -> Int {
        var j = 0
        for element in array {
            if element == value {
                continue
            }
            array[j] = element
            j += 1
        }
        print(array)
        return j
    }
    
    /**
     *   已排序好的数组移除中间重复的数据，返回新数组的长度
     *
     *
     */
    public func removeDuplicates(array:inout[Int],value:Int)->Int{
        var i = 0
        var j = 0
        for element in array{
            i += 1
            if i >= value {
                break
            }
            if element != array[i] {
                j += 1
                array[j] = array[i]
            }
        }
        print(array)
        return j  + 1 ;
    }
    
    /**
     *   移除数组中重复的元素，允许重复数字出现两次
     *
     *
     **/
    public func removeDuplicatesAllowTwiceShow(array:inout[Int],value:Int)->Int{
        var i = 0
        var j = 0
        var num = 0  // 计数器
        for element in array{
            i += 1
            if i >= value {
                break
            }
            if element == array[i] {
                num += 1
                if num < 2  {
                    j += 1
                    array[j] = array[i]
                }
            }else{
                j += 1
                array[j] = array[i]
                num = 0
            }
        }
        print(array)
        return j  + 1 ;
    }
    
    public func plusOne(array:[Int]){
        var sum = 0
        var one = 1
        var  index = array.count  - 1
        var newArray = Array(repeating: 0, count: array.count)
        for _ in array {
            sum = one + array[index]
            one = sum / 10
            newArray[index] = sum % 10
            index -= 1
        }
        if one > 0{
          newArray.insert(one, at: newArray.startIndex)
        }
        print(newArray)
    }
    
}




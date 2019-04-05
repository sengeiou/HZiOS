//
//  HZArray.swift
//  LeetCode
//
//  Created by 华天杰 on 2019/3/19.
//  Copyright © 2019年 HZ. All rights reserved.
//

import Cocoa

class HZArray: NSObject {
    /*
     1 : 两数之和
     给定 nums = [2, 7, 11, 15], target = 9
     因为 nums[0] + nums[1] = 2 + 7 = 9
     所以返回 [0, 1]
     */
    
    // 暴力解法 两次遍历数组 找到 数组中的元素相加和为target： 时间复杂度 O(n^2) 空间复杂度为O(1)
 static public func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var temp:[Int] = []
        for i in 0..<nums.count - 1{
            for j in 0..<nums.count{
                if(j <= i){
                    continue
                }
               let a = nums[i]
               let b = nums[j]
                if(target == a + b){
                    temp.append(i)
                    temp.append(j)
                    return temp
                }
            }
        }
        return temp
    }
    
    // 采用哈希表的方式，首先将数组元素放到哈希表中，然后在遍历数组 找（target - nums[i]）在数组中的位置
    static public func twoSumHashMap(_ nums: [Int], _ target: Int) -> [Int] {
        var hashMap:[Int:Int] = [:]
        Dictionary
        for i in 0..<nums.count {
            hashMap.updateValue(i, forKey: nums[i])
        }
        for i in 0..<nums.count {
           let selectNum = target - nums[i]
           hashMap.contains(where: <#T##((key: Int, value: Int)) throws -> Bool#>)
        }
    }
}

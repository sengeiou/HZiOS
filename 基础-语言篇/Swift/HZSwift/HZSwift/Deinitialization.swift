//
//  Deinitialization.swift
//  Swift_Start
//
//  Created by dafy on 16/1/22.
//  Copyright © 2016年 Dafy. All rights reserved.
//

import Cocoa

class Deinitialization: NSObject {
    
    func testfunca(){
       let player = Player(coinNum: 1000)
       print(player.players_coins)
    }

}

class Bank {
    static var coinsInBank = 10_000
    static func vend_coin(_ coinNum : Int)->Int{
        var coinNum = coinNum
        coinNum = min(coinNum, coinsInBank)
        coinsInBank -= coinNum
        return coinNum
    }
    static func reveive_coin(_ coinNum:Int){
        self.coinsInBank += coinNum
    }
}

class Player {
    var players_coins:Int
    init(coinNum:Int){
      players_coins = Bank.vend_coin(coinNum)
    }
    
    func winCoins(_ coins:Int){
      players_coins += Bank.vend_coin(coins)
    }
    deinit{
        Bank.reveive_coin(self.players_coins)
    }
}

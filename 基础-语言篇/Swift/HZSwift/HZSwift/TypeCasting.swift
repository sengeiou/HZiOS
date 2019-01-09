//
//  TypeCasting.swift
//  Swift_Start
//
//  Created by dafy on 16/1/27.
//  Copyright © 2016年 Dafy. All rights reserved.
//

import Cocoa

class TypeCasting: NSObject {

    let library = [
        Movie(director: "Michael", name: "Casebanca"),
        Song(name: "Blue Suede Shoes", artist: "Elvis"),
        Movie(director: "Orson Welles", name: "Citizen Kane"),
        Song(name: "The one and the only", artist: "Chesney Hawkes"),
        Song(name: "never gonna give you up", artist: "Rick astley")
    ]
    
    func testFunc(){
       var movieCount = 0
       var songCount  = 0
        for item in library{
            // 判断item的类型
            if item is Movie{
              movieCount += 1
            }else if item is Song{
              songCount += 1
            }
        }
        print("movieCount is \(movieCount),songCount is \(songCount)")
        
        // 向下转类型 （不确定能否转成功：as?/ 确定能转成功：as!）
        for item in library{
            if let song = item as? Song{
              print(song.name)
            }else if let movie = item as? Movie{
              print(movie.name)
            }
        }
    }
}


// 一个基类
class MediaItem{
    var name :String
    init(name:String){
      self.name = name
    }
}


class Movie: MediaItem {
    var director:String
    init(director:String,name:String){
      self.director = director
      super.init(name: name)
    }
}


class Song: MediaItem {
    var artist:String
    init(name: String,artist:String) {
        self.artist = artist
        super.init(name: name)
    }
}




/*
  Any : 可以表示任何类型,包括函数类型
  AnyObject：可以表示任何类类型的实例

*/






//
//  HZService.swift
//  HZThreeParty
//
//  Created by 华天杰 on 2019/3/12.
//  Copyright © 2019年 BQ. All rights reserved.
//

import Foundation
import Moya

// 结构体中的每一个case都被定义为请求所需要的参数
public enum HZService{
    case zen
    case showUser(id:Int)
    case loadMovieList
}

extension HZService:TargetType{
    public var baseURL: URL {
        return URL(string: "https://facebook.github.io")!
    }
    
    public var path: String {
        switch self {
        case .zen:
            return "/zen"
        case .showUser(let id):
            return "/users/\(id)"
        case .loadMovieList:
            return "/react-native/movies.json"
        }
    
    }
    
    public var method: Moya.Method {
        switch self {
        case .zen,.loadMovieList:
            return .get
        case .showUser:
            return .post
        }
    }
    
        // 作用是什么
    public var sampleData: Data {
        switch self {
        case .zen:
            return "sampleData".data(using: .utf8)!
        case .showUser(let id):
            return "showUser/\(id)".data(using: .utf8)!
        case .loadMovieList:
            return "loadMovieList".data(using: .utf8)!
        }
    }
    
   // NSURLSessionTask
    public var task: Task {
        switch self {
        case .zen,.loadMovieList:
            return .requestPlain
        case .showUser(let id):
            return .requestParameters(parameters: ["id":id], encoding: URLEncoding.queryString)
        }
    }
    
    public var headers: [String : String]? {
        return ["Content-type":"application/json"]
    }
    
    
}

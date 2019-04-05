//
//  HZMoyaViewController.swift
//  HZThreeParty
//
//  Created by 华天杰 on 2019/3/12.
//  Copyright © 2019年 BQ. All rights reserved.
//

import UIKit
import Moya

class HZMoyaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    private func loadData(){
       let provider = MoyaProvider<HZService>()
        provider.request(.loadMovieList) { result in
            switch result {
            case let .success(moyaResponse):
                do{
                    let data = try moyaResponse.mapJSON()
                    print(data)
                }
                catch{
                    //show error
                }
                
            case let .failure(error):
                //
                print(error.failureReason as Any)
            }
        }
    }

}

//
//  HZMovieViewController.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2018/10/18.
//  Copyright © 2018年 HZ. All rights reserved.
//

import UIKit
import AVFoundation

class HZMovieViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func playMovie() -> Void {
        let moviePath = Bundle.main.path(forResource: "movie", ofType: "mp4", inDirectory: "")
        let movieURL = URL(fileURLWithPath: moviePath!)
        
        let avPlayer = AVPlayer(url: movieURL)
        let avPlayerLayer = AVPlayerLayer(player: avPlayer)
        avPlayerLayer.frame = self.view.bounds
    }

}

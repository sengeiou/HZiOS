//
//  HZSoundViewController.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2018/10/18.
//  Copyright © 2018年 HZ. All rights reserved.
//

import UIKit

import AudioToolbox
import AVFoundation

class HZSoundViewController: UIViewController ,AVAudioPlayerDelegate{
    var audioPlayer:AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // system Sound Services 实现音频的播放
    
    func systemSoundServices() -> Void {
        var soundId:SystemSoundID = 0
        let path = Bundle.path(forResource: "caemer", ofType: "wav", inDirectory: "")
        let soundUrl = URL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &soundId)
        
        AudioServicesAddSystemSoundCompletion(soundId, nil, nil, {
            (soundID, clientData) -> Void in
            // 音频播放后重复播放 : A C function pointer cannot be formed from a closure that captures context
            //AudioServicesPlaySystemSound(soundId)
        }, nil)
        
        AudioServicesPlaySystemSound(soundId)
    }
    
    func avAudioPlay() -> Void {
        let path = Bundle.path(forResource: "music", ofType: "mp3", inDirectory: "")
        let soundUrl = URL(fileURLWithPath: path!)
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: soundUrl)
            audioPlayer?.volume = 1.0 // 音量 0~1之间
            audioPlayer?.numberOfLoops = -1 // 循环次数
            audioPlayer?.delegate = self
            audioPlayer?.play()
        } catch  {
            print(error)
        }
        
        let stopMusic = UIButton(frame: CGRect(x: 20, y: 80, width: 280, height: 44))
        stopMusic.backgroundColor = UIColor.purple
        stopMusic.setTitle("恢复/暂停", for: UIControlState.normal)
        stopMusic.addTarget(self, action: #selector(pauseOrResumeMusic), for: UIControlEvents.touchUpInside)
        self.view.addSubview(stopMusic)
    }
    
    @objc func pauseOrResumeMusic(){
        if self.audioPlayer!.isPlaying{
            self.audioPlayer?.pause()
        }else{
            self.audioPlayer?.play()
        }
    }
    
    

    func audioPlayerBeginInterruption(_ player: AVAudioPlayer) {
        
    }
    
    func audioPlayerEndInterruption(_ player: AVAudioPlayer, withOptions flags: Int) {
        
    }

}

//
//  ViewController.swift
//  SoundBoard App
//
//  Created by amrutha on 02/12/20.
//  Copyright © 2020 amrutha. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let soundFileNames = ["cantina","imperial","theme","blaster"]
    var audioPlayers = [AVAudioPlayer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for sound in soundFileNames {
            do {
                let url = NSURL(fileURLWithPath: Bundle.main.path(forResource: sound,ofType:"mp3")!)
                let audioPlayer = try AVAudioPlayer(contentsOf: url as URL)
                audioPlayers.append(audioPlayer)
                
            }
            catch {
                
                audioPlayers.append(AVAudioPlayer())
            }
        }
        
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        let audioPlayer = audioPlayers[sender.tag]
        audioPlayer.play()
        
    }
    
    
    @IBAction func stopButton(_ sender: UIButton) {
        
        let audioPlayer = audioPlayers[sender.tag]
        audioPlayer.stop()
    }
}


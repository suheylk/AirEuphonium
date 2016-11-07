//
//  ViewController.swift
//  AirEuphoniumSuheylKeskin
//
//  Created by suheyl keskin on 11/7/16.
//  Copyright © 2016 suheyl keskin. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var hornSound: AVAudioPlayer?
    
    func loadSound(name: String) -> AVAudioPlayer? {
        
        let bundle = Bundle.main
        
        let optionalPath = bundle.path(forResource: name, ofType: "m4a")
        
        if let path = optionalPath {
           
            let url = URL(fileURLWithPath: path)
            
            let optionalPlayer = try? AVAudioPlayer(contentsOf: url)
           
            if let player = optionalPlayer {
               
                player.prepareToPlay()
                
                print("\(name) loaded.")
                
                return player
            }
            else {
                print("Could not load \(name). ")
                
                return nil
            }
        }
        else {
            print("Could not create path")
            return nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hornSound = loadSound(name: "hornSound")
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        self.hornSound?.play()
    }
    
}


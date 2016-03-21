//
//  ViewController.swift
//  Sound Shaker
//
//  Created by Lovish Dogra on 22/03/16.
//  Copyright © 2016 Lovish Dogra. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    var player:AVAudioPlayer = AVAudioPlayer()
    var sounds = ["VeerVaar","Taur"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if event?.subtype == UIEventSubtype.MotionShake{
            print("Motion Detected") //For testing the gesture working, O/P in console area
            let randomNumber = Int(arc4random_uniform(UInt32(sounds.count)))
            
            let fileLocation = NSBundle.mainBundle().pathForResource(sounds[randomNumber], ofType: "mp3")
            
            do{
                try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: fileLocation!))
                nameLabel.text = sounds[randomNumber]
                player.play()
            } catch{
                print("Not able to get the file")
            }
        }
    }


}


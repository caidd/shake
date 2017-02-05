//
//  ViewController.swift
//  ShakeIT
//
//  Created by David on 03/12/2015.
//  Copyright © 2015 David. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var Soundplayer1:AVAudioPlayer = AVAudioPlayer()
    var Soundplayer2:AVAudioPlayer = AVAudioPlayer()
    var Soundplayer3:AVAudioPlayer = AVAudioPlayer()
    var Soundplayer4:AVAudioPlayer = AVAudioPlayer()
    var Soundplayer5:AVAudioPlayer = AVAudioPlayer()
    
    
    @IBOutlet weak var TimerLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var StartButton: UIButton!
    
    var timer = NSTimer()
    var countInt = 0
    var scoreInt = 0
    var modeInt = 0
    var choice = 0
    
    var selection = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        countInt = 20
        scoreInt = 0
        
        TimerLabel.text = String(countInt)
        ScoreLabel.text = String(scoreInt)
        
        let FileLocation1 = NSBundle.mainBundle().pathForResource("dog", ofType: "mp3")
        let FileLocation2 = NSBundle.mainBundle().pathForResource("donkey", ofType: "mp3")
        let FileLocation3 = NSBundle.mainBundle().pathForResource("lion", ofType: "mp3")
        let FileLocation4 = NSBundle.mainBundle().pathForResource("pig", ofType: "mp3")
        let FileLocation5 = NSBundle.mainBundle().pathForResource("wolf", ofType: "mp3")
        
        
        do {
            
            Soundplayer1 = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: FileLocation1!))
            Soundplayer2 = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: FileLocation2!))
            Soundplayer3 = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: FileLocation3!))
            Soundplayer4 = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: FileLocation4!))
            Soundplayer5 = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: FileLocation5!))
            
            
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
            
        }
            
        catch {
            
            print(error)
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: ACTION
    
    // Start button
    
    @IBAction func StartGame(sender: AnyObject) {
        if scoreInt == 0 {
            countInt = 20
            TimerLabel.text = String(countInt)
            ScoreLabel.text = String(scoreInt)
            modeInt = 1
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("StartCounter"), userInfo: nil, repeats: true)
            StartButton.enabled = false
        }
        
        if countInt == 0 {
            
            scoreInt = 0
            countInt = 0
            StartButton.setTitle("Start", forState: UIControlState.Normal)
        }
    }
   

    
    func StartCounter() {
            countInt -= 1
            TimerLabel.text = String(countInt)
        
        if countInt == 0 {
            
            timer.invalidate()
            StartButton.enabled = true
            StartButton.setTitle("Restart", forState: UIControlState.Normal)
            modeInt = 2
        }
    }
    
    
    /*override func canBecomeFirstResponder() -> Bool {
        return true
    }*/
    
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        
        if motion == .MotionShake {
            
            if (modeInt == 1) {
                var soundArray = [Soundplayer1, Soundplayer2, Soundplayer3, Soundplayer4, Soundplayer5]
                let rand = Int(arc4random_uniform(5))
                soundArray[rand].play()
                choice = rand
            }
            
        }
    }
    
    @IBAction func dogButton(sender: AnyObject) {
        selection = 0
        
        if selection == choice {
                scoreInt += 1
                ScoreLabel.text = String(scoreInt)
                choice = -1
        }
    }
    
    
    @IBAction func donkeyButton(sender: AnyObject) {
        selection = 1
        
        if selection == choice {
            scoreInt += 1
            ScoreLabel.text = String(scoreInt)
            choice = -1
        }
    }
    
    @IBAction func lionButton(sender: AnyObject) {
        selection = 2
        
        if selection == choice {
            scoreInt += 1
            ScoreLabel.text = String(scoreInt)
            choice = -1
        }
    }
    
    
    @IBAction func pigButton(sender: AnyObject) {
        selection = 3
        
        if selection == choice {
            scoreInt += 1
            ScoreLabel.text = String(scoreInt)
            choice = -1
        }
    }
    
    
    @IBAction func wolfButton(sender: AnyObject) {
        selection = 4
        
        if selection == choice {
            scoreInt += 1
            ScoreLabel.text = String(scoreInt)
            choice = -1
        }
    }
    
    
    
}


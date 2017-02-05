//
//  EffectsViewController.swift
//  ShakeIT
//
//  Created by David on 05/12/2015.
//  Copyright © 2015 David. All rights reserved.
//

import UIKit
import AVFoundation

class EffectsViewController: UIViewController {

    
    var Soundplayer1:AVAudioPlayer = AVAudioPlayer()
    var Soundplayer2:AVAudioPlayer = AVAudioPlayer()
    var Soundplayer3:AVAudioPlayer = AVAudioPlayer()
    var Soundplayer4:AVAudioPlayer = AVAudioPlayer()
    var Soundplayer5:AVAudioPlayer = AVAudioPlayer()
    
    var choice = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let FileLocation1 = NSBundle.mainBundle().pathForResource("reload", ofType: "mp3")
        let FileLocation2 = NSBundle.mainBundle().pathForResource("magnum", ofType: "mp3")
        let FileLocation3 = NSBundle.mainBundle().pathForResource("silencer", ofType: "mp3")
        let FileLocation4 = NSBundle.mainBundle().pathForResource("Hadouken", ofType: "mp3")
        let FileLocation5 = NSBundle.mainBundle().pathForResource("mario", ofType: "mp3")
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        
        if motion == .MotionShake {
 
            var soundArray = [Soundplayer1, Soundplayer2, Soundplayer3, Soundplayer4, Soundplayer5]
            soundArray[choice].play()
        }
    }
    
    
    
    //MARK: ACTIONS
    @IBAction func magnumSound(sender: AnyObject) {
        choice = 1
    }
    
    
    @IBAction func silencerSound(sender: AnyObject) {
        choice = 2
    }
    
    
    @IBAction func hadoukenSound(sender: AnyObject) {
        choice = 3
    }
    
    
    @IBAction func marioSound(sender: AnyObject) {
        choice = 4
    }
}

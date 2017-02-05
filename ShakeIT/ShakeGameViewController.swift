//
//  ShakeGameViewController.swift
//  ShakeIT
//
//  Created by David on 05/12/2015.
//  Copyright © 2015 David. All rights reserved.
//

import UIKit

class ShakeGameViewController: UIViewController {

    @IBOutlet weak var TimerLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var StartButton: UIButton!
    
    var timer = NSTimer()
    var countInt = 0
    var scoreInt = 0
    var modeInt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        countInt = 10
        scoreInt = 0
        
        TimerLabel.text = String(countInt)
        ScoreLabel.text = String(scoreInt)
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
    
    
    // MARK: ACTION
    @IBAction func StartGame(sender: AnyObject) {
        if scoreInt == 0 {
            
            countInt = 10
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
                scoreInt += 1
                ScoreLabel.text = String(scoreInt)
            }
        }
    }

}

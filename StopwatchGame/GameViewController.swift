//
//  GameViewController.swift
//  StopwatchGame
//
//  Created by Scotty Shaw on 11/3/15.
//  Copyright © 2015 ___sks6___. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var startingTime = NSTimeInterval()
    var timer = NSTimer()
    var gameTime: UInt8 = 0
    
    var score = 0
    var numRuns = 0

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var timeDisplayLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func startTimer(sender: AnyObject) {
        if !timer.valid {
            let aSelector : Selector = "updateTime"
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
            startingTime = NSDate.timeIntervalSinceReferenceDate()
        }
    }
    
    @IBAction func stopTimer(sender: AnyObject) {
        timer.invalidate()
        
        if gameTime == 0 {
            print("YEAH")
        }
        else if gameTime <= 5 {
            print("OKAY")
        }
        else {
            print("WHAT")
        }
        
        score += Int(pow(Double(gameTime), 2.0))
        
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setInteger(score, forKey: "your")
        
        defaults.synchronize()
        
        scoreLabel.text = String(format: "Your Score: %d", score)
        
        gameTime = 0
        numRuns++
        
        if numRuns == 3 {
            if defaults.integerForKey("best") > score {
                defaults.setInteger(score, forKey: "best")
                defaults.synchronize()
            }
            
            timeDisplayLabel.text = "GAME OVER"
            startButton.enabled = false
            stopButton.enabled = false
        }
    }
    
    override func viewDidLoad () {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timeDisplayLabel.text = "爽 😄 ¡PIÑATAS! 😄 爽"
        scoreLabel.text = "Your Score: 0"
        score = 0
        numRuns = 0
        startButton.enabled = true
        stopButton.enabled = true
    }
    
    override func didReceiveMemoryWarning () {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateTime () {
        let currentTime = NSDate.timeIntervalSinceReferenceDate()
        
        // calculate elapsed time
        var elapsedTime = currentTime - startingTime
        
        gameTime = UInt8(abs(elapsedTime * 100 - 100))
        
        // calculate elapsed seconds
        let seconds = UInt8(elapsedTime)
        elapsedTime -= NSTimeInterval(seconds)
        
        // calculate elasped milliseconds
        let milliseconds = UInt8(elapsedTime * 100)
        
        // add the leading zero for seconds and milliseconds and store them as string constants
        let strSeconds = String(format: "%02d", seconds)
        let strMilliseconds = String(format: "%02d", milliseconds)
        
        // concatenate minutes, seconds and milliseconds and assign them to the UILabel
        timeDisplayLabel.text = "\(strSeconds):\(strMilliseconds)"
    }
    
}
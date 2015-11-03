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

    @IBOutlet weak var timeDisplayLabel: UILabel!
    
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
        
        if defaults.integerForKey("high") < score {
            defaults.setObject(score, forKey: "high")
        }
        
        defaults.synchronize()
        
        print(score)
        print("")
        
        gameTime = 0
    }
    
    override func viewDidLoad () {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timeDisplayLabel.text = "爽 😄 ¡PIÑATA! 😄 爽"
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
//
//  RecapViewController.swift
//  StopwatchGame
//
//  Created by Scotty Shaw on 11/3/15.
//  Copyright © 2015 ___sks6___. All rights reserved.
//

import UIKit

class RecapViewController: UIViewController {

    @IBOutlet weak var yourScoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    override func viewDidLoad () {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let yourScore = defaults.valueForKey("your") as? Int
        let highScore = defaults.valueForKey("high") as? Int
        
        yourScoreLabel.text = String(format: "Your Score: %d", yourScore!)
        highScoreLabel.text = String(format: "High Score: %d", highScore!)
    }
    
    override func didReceiveMemoryWarning () {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
//
//  ViewController.swift
//  StopwatchGame
//
//  Created by Scotty Shaw on 11/3/15.
//  Copyright © 2015 ___sks6___. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(0, forKey: "your")
        defaults.setInteger(Int.max, forKey: "best")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


//
//  ViewController.swift
//  Perfetto
//
//  Created by Ryan Cao on 9/6/18.
//  Copyright © 2018 Perfetto!. All rights reserved.
//

import UIKit
import CoreGraphics.CGContext

class ViewController: UIViewController {

    @IBOutlet weak var profileButton: UIButton!
    
    @IBOutlet weak var referralButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "heart_pizza_background.jpg")!)
    }
    
}

// Adds an extension to the base integer class.
extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else { // if self == 0
            return 0
        }
    }
}


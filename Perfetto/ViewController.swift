//
//  ViewController.swift
//  Perfetto
//
//  Created by Ryan Cao on 9/6/18.
//  Copyright © 2018 Perfetto!. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // You can hard-code in lists, just like follows
    var cardChoices = ["👻", "🧙‍♂️", "👻", "🎃", "🧙‍♂️", "🎃"]
    
    // IBOutlet is a property (instance field); IBAction is a function
    @IBOutlet weak var flipCountLabel: UILabel!
    
    // Swift will automagically infer the types of declared variables.
    // OMG - this didSet is like an onSetListener - it'll run the following
    // code every single time flipCount's value changes!
    var flipCount = 0 {
        didSet {
            // Change the flipCount text displayed
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    // Swift array - must know which type it is!
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        // Increment number of times we've flipped cards
        flipCount += 1
        
        // Unwrapping optionals the safe way - the unsafe way is to simply use !
        if let cardIndex = cardButtons.index(of: sender) {
            flipCard(withEmoji: cardChoices[cardIndex], on: sender)
        } else {
            print("Card was not in CardButtons")
        }
        
        
//        // Some crazy optional unwrapping going on here... lol
//        flipCard(withEmoji: (sender.titleLabel?.text!)!, on: sender)
    }
    
    // withEmoji is the external name; emoji is the internal name; String is the type.
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        // Equivalent of printf - \(paramName)
        print("flipCard(withEmoji: \(emoji))")
        if (button.currentTitle == emoji) {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}


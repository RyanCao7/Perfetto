//
//  ViewController.swift
//  Perfetto
//
//  Created by Ryan Cao on 9/6/18.
//  Copyright © 2018 Perfetto!. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Here's our model! Classes get a free init() with no args as long as all of its args are initialized.
    lazy var game: Perfetto = Perfetto(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
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
            game.chooseCard(at: cardIndex)
            updateViewFromModel()
        } else {
            print("Card was not in CardButtons")
        }
    }
    
    // Looks at the model and sees which View elements need to be changed.
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            }
        }
    }
    
    // Creates mapping from int ID to emoji
    var emoji = [Int : String]()
    
    // You can hard-code in lists, just like follows
    var emojiChoices = ["👻", "🧙‍♂️", "🎃", "🍎", "🍬", "🍭", "🦇", "🙀", "😱", "😈"]
    
    func emoji(for card: Card) -> String {
        
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            // Takes a random emoji from emojiChoices and puts it into the dictionary at the current key.
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
//        if let chosenEmoji = emoji[card.identifier] {
//            return chosenEmoji
//        } else {
//            return "?"
//        }
        // Equivalently,
        return emoji[card.identifier] ?? "?"
    }
}


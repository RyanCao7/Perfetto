//
//  Perfetto.swift
//  Perfetto
//
//  Created by Ryan Cao on 9/7/18.
//  Copyright © 2018 Perfetto!. All rights reserved.
//

import Foundation

class Perfetto {
    
    // Public API
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[index].identifier == cards[matchIndex].identifier {
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // Either no cards or two cards are face up
                // Either way, turn all cards on the board face-down.
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
            
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        // Swift's for-loop and equivalent to Python's range()
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card] // This creates two copies and adds them to the card array!
        }
        // TODO: Shuffle the cards!
    }
    
}

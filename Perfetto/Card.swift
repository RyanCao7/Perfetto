//
//  Card.swift
//  Perfetto
//
//  Created by Ryan Cao on 9/7/18.
//  Copyright © 2018 Perfetto!. All rights reserved.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    
    // N.B. this is a unique identifier! No emojis; model is UI independent
    var identifier: Int
    
    // Static across all cards
    static var IDFactory = 0
    
    // Returns a unique identifier
    static func getUniqueIdentifier() -> Int {
        IDFactory += 1
        return IDFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
}

//
//  PlayingCardDeck.swift
//  PlayingCard
//
//  Created by Sameh on 10/15/18.
//  Copyright © 2018 Sameh. All rights reserved.
//

import Foundation

struct PlayingCardDeck {
    
    private(set) var cards = [PlayingCard]()
    
    mutating func draw() -> PlayingCard? {
        if cards.count > 0 {
            return cards.remove(at: cards.count.arc4random)
        } else {
            return nil
        }
    }
    
    init() {
        for suit in PlayingCard.Suit.all {
            for rank in PlayingCard.Rank.all {
                cards.append(PlayingCard(suit: suit, rank: rank))
            }
        }
        
        for _ in 1...10 {
            for index in cards.indices {
                let randomIndex = Int(arc4random_uniform(UInt32(index)))
                let card = cards.remove(at: randomIndex)
                cards.append(card)
            }
        }

    }
}

extension Int {
    var arc4random: Int {
        if (self > 0) {
            return Int(arc4random_uniform(UInt32(self)))
        } else if (self < 0) {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}


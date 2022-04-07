//
//  Round.swift
//  RightOnTarget
//
//  Created by Максим Клочков on 07.04.2022.
//

import Foundation

protocol GameRoundProtocol {
    var lastRound: Int { get }
    var currentRound: Int { get }
    
    func startNewRound()
}

class Round: GameRoundProtocol {
    var lastRound: Int
    var currentRound = 1
    
    init?(rounds: Int) {
        lastRound = rounds
    }
        
    func startNewRound() {
        currentRound += 1
    }
}

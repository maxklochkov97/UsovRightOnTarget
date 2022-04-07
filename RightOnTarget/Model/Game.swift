//
//  Game.swift
//  RightOnTarget
//
//  Created by Максим Клочков on 07.04.2022.
//

import UIKit

protocol GameProtocol {
    var score: Int { get }
    var secretValueGenerator: RandomNumberGenerator { get }
    var round: Round { get }
    var isGameEnded: Bool { get }

    func restartGame()
    func startNewRound()
}


class Game: GameProtocol {
    var secretValueGenerator: RandomNumberGenerator
    var round: Round
    var score = 0
    var isGameEnded: Bool {
        if round.currentRound >= round.lastRound {
            return true
        } else {
            return false
        }
    }

    init(valueGenerator: RandomNumberGenerator, roundController: Round) {
        secretValueGenerator = valueGenerator
        round = roundController
    }

    func calculateScore(with userValue: Int) {
        let randomValue = secretValueGenerator.currentSecretNumber ?? 0

        if userValue > randomValue {
            score += 50 - userValue + randomValue
        } else if userValue < randomValue {
            score += 50 - randomValue + userValue
        } else if userValue == randomValue {
            score += 50
        }
    }

    func restartGame() {
        round.currentRound = 0
        score = 0
        startNewRound()
    }

    func startNewRound() {
        secretValueGenerator.getRandomValue()
        round.startNewRound()
    }
}

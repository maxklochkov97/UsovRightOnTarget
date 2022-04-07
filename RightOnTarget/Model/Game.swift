//
//  Game.swift
//  RightOnTarget
//
//  Created by Максим Клочков on 07.04.2022.
//

import UIKit

protocol GameProtocol {
    var score: Int { get }
    var currentSecretValue: Int { get }
    var isGameEnded: Bool { get }

    func restartGame()
    func startNewRound()
    func calculateScore(with: Int)
}


class Game: GameProtocol {
    private var minSecretValue: Int
    private var maxSecretValue: Int
    private var lastRound: Int
    private var currentRound = 1

    var score = 0
    var currentSecretValue = 0
    var isGameEnded: Bool {
        if currentRound >= lastRound {
            return true
        } else {
            return false
        }
    }

    init?(startValue: Int, endValue: Int, rounds: Int) {
        // Стартовое значение текущего числа не может быть больше конечного.
        guard startValue <= endValue else { return nil }

        minSecretValue = startValue
        maxSecretValue = endValue
        lastRound = rounds
        currentSecretValue = self.getNewSecretValue()
    }

    func restartGame() {
        currentRound = 0
        score = 0
        startNewRound()
    }

    func startNewRound() {
        currentSecretValue = self.getNewSecretValue()
        currentRound += 1
    }

    // Загадать и вернуть новое случайное число
    private func getNewSecretValue() -> Int {
        (minSecretValue...maxSecretValue).randomElement()!
    }

    func calculateScore(with value: Int) {
        if value > currentSecretValue {
            score += 50 - value + currentSecretValue
        } else if value < currentSecretValue {
            score += 50 - currentSecretValue + value
        } else if value == currentSecretValue {
            score += 50
        }
    }

//    func alertCheck() {
//        if currentRound == lastRound {
//            let alert = UIAlertController(
//                title: "Игра окончена",
//                message: "Вы заработали \(self.score) очков!",
//                preferredStyle: .alert)
//
//            alert.addAction(UIAlertAction(
//                title: "Начать заново",
//                style: .default,
//                handler: nil))
//
//            self.present(alert, animated: true, completion: nil)
//            restartGame()
//        }
//
//    }


}

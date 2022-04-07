//
//  ViewController.swift
//  RightOnTarget
//
//  Created by Максим Клочков on 06.04.2022.
//

import UIKit

class ViewController: UIViewController {

    // Сущности
    var game: Game!
    var round: Round!
    var randomGenerator: RandomNumberGenerator!

    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    @IBOutlet weak var checkBotton: UIButton!
    
    // MARK: - жизненный цикл

    override func viewDidLoad() {
        super.viewDidLoad()
        checkBotton.layer.cornerRadius = 4
        round = Round(rounds: 5)
        randomGenerator = RandomNumberGenerator(startValue: 1, endValue: 50)
        game = Game(valueGenerator: randomGenerator, roundController: round)

        // Обновляем данные о текущем значении загаданного числа
        updateLabelWithSecretNumber()
    }

    // MARK: - взаимодействие view и model

    // Проверка выбранного полозователем числа
    @IBAction func checkNumberButton() {

        // Высчитываем очки за раунд
        game.calculateScore(with: Int(slider.value))

        // Проверяем окончена ли игра
        if game.isGameEnded {
            showAlertWith(score: game.score)
            game.restartGame()
        } else {
            game.startNewRound()
        }

        // Обновляем данные о текущем значении загаданного числа
        updateLabelWithSecretNumber()
    }

    // MARK: - обновление view

    // Обновление текста загаданного числа
    private func updateLabelWithSecretNumber() {
        randomGenerator.getRandomValue()
        label.text = String(randomGenerator.currentSecretNumber)
    }

    // отображение всплывающего окна со счетом
    func showAlertWith(score: Int) {
        let alert = UIAlertController(
            title: "Игра окончена",
            message: "Вы заработали \(score) очков!",
            preferredStyle: .alert)

        alert.addAction(UIAlertAction(
            title: "Начать заново",
            style: .default,
            handler: nil))

        self.present(alert, animated: true, completion: nil)
    }
}


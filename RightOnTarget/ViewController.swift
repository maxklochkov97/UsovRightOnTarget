//
//  ViewController.swift
//  RightOnTarget
//
//  Created by Максим Клочков on 06.04.2022.
//

import UIKit

class ViewController: UIViewController {

    // Сущность "Игра"
    var game: Game!

    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    @IBOutlet weak var checkBotton: UIButton!
    

    // MARK: - жизненный цикл

    override func viewDidLoad() {
        super.viewDidLoad()

        // отредактировал кнопку
        checkBotton.layer.cornerRadius = 4

        // Создаем экземпляр сущности "Игра"
        game = Game(startValue: 1, endValue: 50, rounds: 5)

        // Обновляем данные о текущем значении загаданного числа
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
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
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))

    }

    // MARK: - обновление view

    // Обновление текста загаданного числа
    private func updateLabelWithSecretNumber(newText: String) {
        label.text = newText
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


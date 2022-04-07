//
//  ViewController.swift
//  RightOnTarget
//
//  Created by Максим Клочков on 06.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!

    var number: Int = 0
    var round: Int = 1
    var points: Int = 0

    lazy var secondVC: SecondViewController = getSecondViewController()

    override func loadView() {
        super.loadView()
        print(#function)
        // Создаем метку для вывода номера версии
        let versionLabel = UILabel(frame: CGRect(x: 20, y: 40, width: 100, height: 20))
        // Изменяем текст метки
        versionLabel.text = "Версия 1.1"
        // Добавляем метку в родительский view
        view.addSubview(versionLabel)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        number = Int.random(in: 1...50)
        label.text = String(number)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#function)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
    }

    private func getSecondViewController() -> SecondViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
        return viewController as! SecondViewController
    }

    /* Метод убран для добавления Navigation Controller
    @IBAction func infoButton(_ sender: Any) {
        //let newVC = SecondViewController() - это бы сработало, если бы view было сделано кодом, без сториборда.
        // Загрузка сториборд.
        // let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // Загрузка VC со сцены в сториборда
        // let viewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
        present(secondVC, animated: true, completion: nil)
    }
    */
    
    @IBAction func checkNumberButton() {

        let numSlider = Int(slider.value.rounded())

        if numSlider > number {
            points += 50 - numSlider + number
        } else if numSlider < number {
            points += 50 - number + numSlider
        } else if numSlider == number {
            points += 50
        }

        if round == 5 {
            let alert = UIAlertController(
                title: "Игра окончена",
                message: "Вы заработали \(self.points) очков!",
                preferredStyle: .alert)

            alert.addAction(UIAlertAction(
                title: "Начать заново",
                style: .default,
                handler: nil))

            present(alert, animated: true, completion: nil)
            round = 0
            points = 0
        } 

        number = Int.random(in: 1...50)
        label.text = String(number)
    }
}


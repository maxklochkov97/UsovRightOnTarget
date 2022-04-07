//
//  SecondViewController.swift
//  RightOnTarget
//
//  Created by Максим Клочков on 06.04.2022.
//

import UIKit

class SecondViewController: UIViewController {

    override func loadView() {
        super.loadView()
        print(#function, "SecondViewController")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function, "SecondViewController")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function, "SecondViewController")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function, "SecondViewController")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#function, "SecondViewController")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function, "SecondViewController")
    }

    /* Код убран, чтобы добавить Navigation Controller
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    */
}

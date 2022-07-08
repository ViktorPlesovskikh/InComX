//
//  UIViewController+extension.swift
//  InComX
//
//  Created by Виктор Плесовских on 25.06.2022.
//

import Foundation
import UIKit


//предупреждение когда не правильно введен логин или пароль, так же
//выходит при правильном логине и пароле
extension ViewController {
    func show(message: String) {
        let alertVC = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) {
            _ in
            self.EmailTextField.text = ""
            self.PassTextField.text = ""
        }
        alertVC.addAction(okAction)
        present(alertVC, animated: true)
    }
}
class UIViewController_extension: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

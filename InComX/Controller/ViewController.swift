//
//  ViewController.swift
//  InComX
//
//  Created by Виктор Плесовских on 18.06.2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //кнопки ввода данных почты пароля и кнопка регистрации
    @IBOutlet var EmailTextField: UITextField!
    
    @IBOutlet var PassTextField: UITextField!
   
    @IBAction func RegisterNowButton(_ sender: Any) {
        guard let email = EmailTextField.text,
              let password = PassTextField.text,
              email == "",
              password == "" else {self.show(message: "Необходимо пустое поле")
            return}
        performSegue(withIdentifier: "RegisterNow", sender: nil)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      navigationController?.setNavigationBarHidden(true, animated: false)
        
        
        
    }

    
}


//
//  ViewController.swift
//  InComX
//
//  Created by Виктор Плесовских on 18.06.2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

   //оутлеты для включения запуска при старте приложения. Потом в ДИДЛОАД прописываю альфу появления при старте.
    @IBOutlet var ImageViewZap: UIImageView!
    @IBOutlet var NameProgZap: UILabel!
    
    
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
        
        
        let ProfileFriendsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfileFriends")
        ProfileFriendsViewController.modalTransitionStyle = .flipHorizontal
        ProfileFriendsViewController.modalPresentationStyle = .formSheet
        
        self.present(ProfileFriendsViewController, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ImageViewZap.alpha=0
        NameProgZap.alpha=0
    
        UIImageView.animate(withDuration: 1) {
            self.ImageViewZap.alpha = 1
        } completion: { (_) in
            UIImageView.animate (withDuration: 1) {
                self.NameProgZap.alpha = 1
            }
        }
        
        
      navigationController?.setNavigationBarHidden(true, animated: false)
        
        
        
    }

    
}


//
//  OneTabBarViewController.swift
//  InComX
//
//  Created by Виктор Плесовских on 26.06.2022.
//

import UIKit

class OneTabBarViewController: UITabBarController {
    
    let session = Session.shared
    let service = Service()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service.getFriends(token: session.token)
    }
  
}

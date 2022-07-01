//
//  ProfileUser.swift
//  InComX
//
//  Created by Виктор Плесовских on 29.06.2022.
//

import Foundation
import UIKit

class ProfileUser {
    
    let nameUser: String
    let imageUser: UIImage?
  let cityUser: String
   
//инициализация данных для списка
    init(nameUser: String, imageUser:UIImage? = nil, cityUser: String) {
        self.nameUser = nameUser
        self.imageUser = imageUser
        self.cityUser = cityUser
      
    }
}

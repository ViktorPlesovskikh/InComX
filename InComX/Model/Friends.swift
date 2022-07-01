//
//  Friends.swift
//  InComX
//
//  Created by Виктор Плесовских on 27.06.2022.
//

import Foundation
import UIKit

//Простой свифт файл для заполнения списка друзей в таблице.
class Friends {
    
    let name: String
    let image: UIImage?
  //  let city: String
    //let education: String?
   // var group: Int
   // var work: String
//инициализация данных для списка 
    init(name: String, image:UIImage? = nil) {
        self.name = name
        self.image = image
       // self.city = city
        //self.education = education
       // self.group = group
      //  self.work = work
    }
    
}

//
//  Friends.swift
//  InComX
//
//  Created by Виктор Плесовских on 27.06.2022.
//

import Foundation
import UIKit

//Простой свифт файл для заполнения списка друзей в таблице.

enum Gender{
    case Male
    case Female
}


class Friends {

    let name: String
    let image: UIImage?
    var gender: Gender
  //  let city: String
    //let education: String?
   // var group: Int
   // var work: String
//инициализация данных для списка 
    init(name: String, image:UIImage? = nil, gender:Gender) {
        self.name = name
        self.image = image
        self.gender = gender
       // self.city = city
        //self.education = education
       // self.group = group
      //  self.work = work
    }
    
}

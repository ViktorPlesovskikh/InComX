//
//  Group.swift
//  InComX
//
//  Created by Виктор Плесовских on 28.06.2022.
//

//Закомментировал 10.10.2022 для урока 3
//import Foundation
//import UIKit
//
//class Group {
//
//    let name: String
//    let image: UIImage?
//
//    init(name: String, image:UIImage? = nil) {
//        self.name = name
//        self.image = image
//
//    }
//
//}
import Foundation

class GroupResponse: Decodable {
    let response: Groups
}

class Groups: Decodable{
    let items: [Group]
}

class Group: Decodable{
    var name: String = ""
    var photoGroup: String = ""
    
    enum CodingKeys: String, CodingKey {
        case name
        case photoGroup = "photo_30"
    }
}

//
//  User.swift
//  InComX
//
//  Created by Виктор Плесовских on 10.10.2022.
//


import Foundation

class FriendsResponse: Decodable {
    let response: Friends
}

class Friends: Decodable {
    let items: [User]
}

class User: Decodable {
    var id: Int = 0
    var photo100: String = ""
    var firstName: String = ""
    var lastName: String = ""

    enum CodingKeys: String, CodingKey {
        case id
        case photo100 = "photo_100"
        case firstName = "first_name"
        case lastName = "last_name"
    }
}

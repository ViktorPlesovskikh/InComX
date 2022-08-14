//
//  Service.swift
//  InComX
//
//  Created by Виктор Плесовских on 14.08.2022.
//

import Foundation
import Alamofire


class Service {
    let baseUrl = "https://api.vk.com/method"
//https://api.vk.com/method
//friends.get
    func getFriends(token: String){
        let url = baseUrl + "/friends.get"
        let parameters: Parameters = [
            "access_token": token,
            "v": "5.131",
            "count": 100,
            "fields": "city,country"
        ]
        AF.request(url, method: .get, parameters: parameters).responseJSON {
            response in
            print(response)
        }
    }
    
    func getGroup(token: String){
        let url = baseUrl + "/groups.get"
        let parameters: Parameters = [
            "access_token": token,
            "v": "5.131",
            "groups": 10
            
        ]
        AF.request(url, method: .get, parameters: parameters).responseJSON {
            response in
            print(response)
        }
    }
    func getPhoto(token: String){
        let url = baseUrl + "/photos.get"
        let parameters: Parameters = [
            "access_token": token,
            "v": "5.131",
            "count": 10
            
        ]
        AF.request(url, method: .get, parameters: parameters).responseJSON {
            response in
            print(response)
        }
    }
    
    
}

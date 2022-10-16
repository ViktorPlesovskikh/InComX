//
//  Service.swift
//  InComX
//
//  Created by Виктор Плесовских on 14.08.2022.
//

import Foundation
import Alamofire
import RealmSwift


class Service {
    let baseUrl = "https://api.vk.com/method"
    let clientId = "51401281" //id приложения с сайта разработчиков вк.
//https://api.vk.com/method
//friends.get
    func getFriends(token: String, id: Int, completion: @escaping ([User]) -> Void){
        let url = baseUrl + "/friends.get"
        let parameters: Parameters = [
            "access_token": token,
            "user_id": id,
            "v": "5.131",
            "count": 100,
            "fields": "city,country"
        ]
        AF.request(url, method: .get, parameters: parameters).responseData {
            response in guard let data = response.value else {return}
            let users = try? JSONDecoder().decode(FriendsResponse.self, from: data).response.items
            completion(users!)
            print(response)
        }
    }
    
    func getGroup(token: String, id: Int, completion: @escaping ([Group]) -> Void){
        let url = baseUrl + "/groups.get"
        let parameters: Parameters = [
            "access_token": token,
            "user_id": id,
            "client_id": clientId,
            "extended": "1",
            "fields": "name, photo_30",
            "v": "5.131"
        ]
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            guard let data = response.value  else { return}
            let groups = try? JSONDecoder().decode( GroupResponse.self, from: data).response.items
            completion(groups!)
        }
    }
    func getPhoto(token: String, idFriend: Int, completion: @escaping ([Photo]) -> Void) {
        let url = baseUrl + "/photos.get"
        let parameters: Parameters = [
            "access_token": token,
            "album_id": "profile",
            "extended": "likes",
            "photo_sizes": "0",
            "client_id": clientId,
            "v": "5.131"
        ]
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            guard let data = response.value  else { return}
            let photos = try? JSONDecoder().decode( FriendPhotoResponse.self, from: data).response.items
            completion(photos!)
        }
    }

}


//Lesson#7 Realm
private  func saveData  <name: Object>(_ sData: [name]){

       do{

          let realm = try Realm()
           print(realm.configuration.fileURL!)
           realm.beginWrite()
           realm.add(sData, update: .all)
           try realm.commitWrite()

       } catch{
           print(error)
       }
     }


     func readRealm <name: Object> (_ sData: [name]){
         let realm = try! Realm()

         let data = realm.objects(name.self)

         print(data)
     }

 

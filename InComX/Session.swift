//
//  Session.swift
//  InComX
//
//  Created by Виктор Плесовских on 09.08.2022.
//

import Foundation


class Session {
    
    static var shared = Session()
    private init(){}
    
    var tokenInCom = ""
    var Userid: Int

    func connectDB() {
        //code
        self.tokenInCom = "New key"
    }
    func getUserid() {
        //code
        self.Userid 
    }

}

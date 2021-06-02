//
//  UserModel.swift
//  PartyUp
//
//  Created by Farhandika Zahrir Mufti guenia on 10/03/21.
//

import Foundation

struct User{
    var uid:String
    var email:String
}

struct UserData:Identifiable{
    var id: String
    var username:String
    var userMoney:Float
}

struct Event:Identifiable{
    var id = UUID()
    var store:String
    var name:String
    var money:Float
    var moneyType:Bool
    var time:Date
}

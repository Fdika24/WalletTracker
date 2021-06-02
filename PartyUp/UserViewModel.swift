//
//  UserViewModel.swift
//  PartyUp
//
//  Created by Farhandika Zahrir Mufti guenia on 14/03/21.
//

import Foundation
import Firebase
class UpdateData:ObservableObject{
    @Published var userData = [UserData]()
    private let db = Firestore.firestore()
    private let user = Auth.auth().currentUser
    
    //Mark : adding Data
        func addData(username:String,userMoney:Float){
            print("Adding Data")
            if user != nil {
                db.collection("UserData").addDocument(data:[
                    "username":username,
                    "userMoney":userMoney,
                    "user":user?.uid ?? ""
                ])
                }
            }
    //Mark : Fetching Data
    func fetchData(){
        if user != nil {
            db.collection("UserData")
                .whereField("user", isEqualTo: self.user!.uid)
                .addSnapshotListener { (querySnapshot, error) in
                    guard let documents = querySnapshot?.documents else {return}
                    self.userData = documents.map { (queryDocumentSnapshot) -> UserData in
                        let data = queryDocumentSnapshot.data()
                        let username = data["username"] as? String ?? ""
                        let userMoney = data["userMoney"] as? Float ?? 0
                        return UserData(id:.init(),username:username,userMoney:userMoney)
                    }
        }
    }
    }
}

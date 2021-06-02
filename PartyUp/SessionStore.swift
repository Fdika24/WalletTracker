//
//  SessionStore.swift
//  PartyUp
//
//  Created by Farhandika Zahrir Mufti guenia on 08/03/21.
//

import Foundation
import FirebaseAuth




class SessionStore: ObservableObject {
    @Published var session : User?
    @Published var userData: UserData?
    @Published var isAnon:Bool = true
    @Published var isError:Bool = false
    var handle : AuthStateDidChangeListenerHandle?
    let authRef = Auth.auth()
    
    func listen() {
        handle = authRef.addStateDidChangeListener({ (auth,user) in
            if let user=user {
                self.isAnon = false
                self.session = User(uid: user.uid, email: user.email!)
            } else {
                self.session = nil
                self.userData = nil
                self.isAnon = true
            }
            
        })
    
    }
    func signIn (email:String, password:String) {
        Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
            if (error != nil){
                self.isError = true
            } else {
                self.isError = false
            }
        }
    }
    func signUp (email:String , password:String){
        Auth.auth().createUser(withEmail: email, password: password)
    }
    
    func unBind (){
        if let handle = handle{
            authRef.removeStateDidChangeListener(handle)
        }
    }
    
    func signOut () {
        do {
            print("Loggin out")
            self.isAnon = true
            try authRef.signOut()
            self.session = nil
            self.userData = nil
           // return true
        } catch let signOutError as NSError{
           print ("Error signing out: %@", signOutError)
        }
    }
}

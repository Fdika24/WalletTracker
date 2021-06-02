//
//  RegisterUi.swift
//  PartyUp
//
//  Created by Farhandika Zahrir Mufti guenia on 08/03/21.
//

import SwiftUI

struct RegisterUi: View {
    @State var username:String = ""
    @State var passwd:String = ""
    @State var passwd2:String = ""
    @State var userSignUp:Bool = false
    @ObservedObject var mySession = SessionStore()
    var body: some View {
        ScrollView {
            ZStack{
                Color("Jembot")
                    .edgesIgnoringSafeArea(.bottom)
                    .navigationBarTitle(Text("Makan"))
                    .navigationBarHidden(true)
                VStack(spacing:70){
                    Header()
                    HStack {
                        VStack(alignment:.leading , spacing:-10) {
                            Text("Register")
                                .font(.system(size: 60))
                                .bold()
                            Text("register now to gain access")
                                .fontWeight(.semibold)
                                .font(.system(size: 25))
                        }
                        .padding(.leading)
                        .foregroundColor(.white)
                        Spacer()
                    }
                    VStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width : 360,height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .overlay(TextField("Email",text:$username).padding())
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width : 360,height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .overlay(SecureField("Password",text:$passwd).padding())
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width : 360,height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .overlay(SecureField("Re-type password",text:$passwd2).padding())
                        Button(action: {
                            if passwd2 == passwd {
                                self.userSignUp = false
                                mySession.signUp(email: username, password: passwd)
                            } else {
                                self.userSignUp = true
                            }
                        }) {
                            Text("Register")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(width: 250, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .background(Color("Kolor1"))
                                .cornerRadius(25)
                                .padding()
                        }
                        if userSignUp{
                            Text("Your password do not match").foregroundColor(.red)
                        }
                    }
                    //Text("Makanbang")
                    Spacer()
                    HStack {
                        Text("Alreeady have an account?")
                        NavigationLink(
                            destination:
                                loginUI()
                                .navigationBarTitle(Text("Makan"))
                                .navigationBarHidden(true)
                            ,
                            label: {
                                Text("Sign In")
                                    .fontWeight(.black)
                                    .foregroundColor(Color("Kolor1"))
                            })
                    }.padding(.bottom,30)
                }
            }
        }
    }
}

struct RegisterUi_Previews: PreviewProvider {
    static var previews: some View {
        RegisterUi()
    }
}

//
//  RegisterScreen.swift
//  PracticeMakePerfect
//
//  Created by Farhandika Zahrir Mufti guenia on 14/05/21.
//

import SwiftUI

struct RegisterScreen: View {
    @State var email:String = ""
    var body: some View {
        ZStack{
            Color(.purple).ignoresSafeArea(edges: .top)
            VStack{
                Image(systemName: "applelogo")
                    .resizable()
                    .frame(width: 150, height: 190, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .padding(.bottom,30)
                Spacer()
                //Mark : register View
                registerView()
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen()
    }
}

struct registerView: View {
    @ObservedObject var mySession = SessionStore()
    @State var username:String = ""
    @State var email:String = ""
    @State var pass1:String = ""
    @State var pass2:String = ""
    @State var isWrong:Bool = false
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.white)
            VStack{
                Group {
                    TextField("Email", text: self.$email)
                    Divider()
                    TextField("Username", text: self.$username)
                    Divider()
                    TextField("Password", text: self.$pass1)
                    Divider()
                    TextField("Re-type password", text: self.$pass2)
                    Divider()
                }.padding(.bottom)
                if self.isWrong {
                    Text("Wrong password")
                }
                Spacer()
                Button(action: {
                    if self.pass1 == self.pass2 && self.pass1 != "" {
                        mySession.signUp(email: self.email, password: self.pass1)
                        self.isWrong.toggle()
                    } else {
                        self.isWrong = true
                    }
                }) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: UIScreen.screenWidth-100, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.purple)
                        .overlay(
                            Text("Register")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .font(Font.system(size: 20, design: .rounded)))
                }
            }
            .padding(.horizontal)
            .padding(.top,30)
        }
    }
}

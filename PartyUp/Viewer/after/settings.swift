//
//  settings.swift
//  PartyUp
//
//  Created by Farhandika Zahrir Mufti guenia on 15/05/21.
//

import SwiftUI

struct settings: View {
    @ObservedObject var mySession = SessionStore()
    var body: some View {
        VStack {
            Button("Logout"){
                self.mySession.signOut()
            }
        }
    }
}

struct settings_Previews: PreviewProvider {
    static var previews: some View {
        settings()
    }
}

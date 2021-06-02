//
//  extentions.swift
//  PartyUp
//
//  Created by Farhandika Zahrir Mufti guenia on 15/05/21.
//

//
//  extentions.swift
//  PracticeMakePerfect
//
//  Created by Farhandika Zahrir Mufti guenia on 13/05/21.
//

import Foundation
import SwiftUI

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct ButtonDesignSmall: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: UIScreen.screenWidth-230, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .foregroundColor(.red)
            .overlay(
                Text("Cancel")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .font(Font.system(size: 20, design: .rounded))
            )
    }
}

struct ButtonDesignBig:View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: UIScreen.screenWidth-100, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .foregroundColor(.red)
            .overlay(
                Text("Close")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .font(Font.system(size: 20, design: .rounded))
            )
    }
}


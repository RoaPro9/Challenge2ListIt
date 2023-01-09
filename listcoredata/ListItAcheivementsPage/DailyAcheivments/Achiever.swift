//
//  Achiever.swift
//  ListItWeeklyAcheivements
//
//  Created by Reem Alkhatib on 20/12/2022.
//

import SwiftUI

struct Achiever: View {
    var body: some View {
        VStack{
            Image("achiever")
                .resizable()
                .frame(width: 110, height: 100)
            Text("Achiever !")
                .font(Font.custom("SFProRounded", size: 11))
                .foregroundColor(Color.black)
            Text("Finished all lists on time !")
                .foregroundColor(Color.gray)
                .font(Font.custom("SFProRounded", size: 11))
                .opacity(0.5)
                .frame(width : 100)
                .multilineTextAlignment(.center)
        }
    }
}

struct Achiever_Previews: PreviewProvider {
    static var previews: some View {
        Achiever()
    }
}

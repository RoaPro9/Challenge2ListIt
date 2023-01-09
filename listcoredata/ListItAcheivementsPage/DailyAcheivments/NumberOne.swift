//
//  NumberOne.swift
//  ListItWeeklyAcheivements
//
//  Created by Reem Alkhatib on 20/12/2022.
//

import SwiftUI

struct NumberOne: View {
    @State private var showingLNumberOne = false
    var body: some View {
        VStack{
            Image("numberOnesh")
                .resizable()
                .frame(width: 100, height: 100)
            Text("First list !")
                .font(Font.custom("SFProRounded", size: 11))
                .foregroundColor(Color.black)
            Text("You finished your first list !")
                .foregroundColor(Color.gray)
                .font(Font.custom("SFProRounded", size: 11))
                .opacity(0.5)
                .frame(width : 100, height: 20)
                .multilineTextAlignment(.center)
        }
        .onTapGesture {
            showingLNumberOne.toggle()
        }.sheet(isPresented: $showingLNumberOne) {
            ZStack{
                Color("blue")
                    .opacity(0.2)
                    .ignoresSafeArea()
                VStack{
                    Image("numberOnesh")
                        .resizable()
                        .frame(width: 300, height: 300)
                    
                    Text("First List !")
                        .font(Font.custom("SFProRounded", size: 40))
                        .foregroundColor(Color("gold"))
                    
                    Text("Congratulations, you just finished your first list ! This is your first achievement, finish more lists to hit more milestones and get more achievements !")
                        .foregroundColor(Color("gold"))
                        .opacity(0.5)
                        .font(Font.custom("SFProRounded", size: 20))
                        .frame(width : 300)
                        .scaledToFill()
                        .multilineTextAlignment(.center)
                }
            }
        }
        
        
    }
}

struct NumberOne_Previews: PreviewProvider {
    static var previews: some View {
        NumberOne()
    }
}

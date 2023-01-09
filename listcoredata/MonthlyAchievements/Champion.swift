//
//  Champion.swift
//  listcoredata
//
//  Created by Roa Moha on 27/05/1444 AH.
//

import SwiftUI

struct Champion: View {
    @State private var showingAchiever = false
    var body: some View {
        VStack{
            Image("championsh")
                .resizable()
                .frame(width: 100, height: 100)
            Text("Champion !")
                .font(Font.custom("SFProRounded", size: 11))
                .foregroundColor(Color.black)
            Text("Five achievements a day !")
                .foregroundColor(Color.gray)
                .font(Font.custom("SFProRounded", size: 11))
                .opacity(0.5)
                .frame(width : 100, height: 20)
                .multilineTextAlignment(.center)
        }
        .onTapGesture {
            showingAchiever.toggle()
        }.sheet(isPresented: $showingAchiever) {
            ZStack{
                Color("blue")
                    .opacity(0.2)
                    .ignoresSafeArea()
                VStack{
                    Image("championsh")
                        .resizable()
                        .frame(width: 300, height: 300)
                       
                    Text("Champion !")
                        .font(Font.custom("SFProRounded", size: 40))
                        .foregroundColor(Color("gold"))
                    
                    Text("Five achievements a day !")
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
struct Champion_Previews: PreviewProvider {
    static var previews: some View {
        Champion()
    }
}

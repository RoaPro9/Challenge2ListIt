//
//  FastAsLightning.swift
//  ListItWeeklyAcheivements
//
//  Created by Reem Alkhatib on 19/12/2022.
//

import SwiftUI

struct LightningPage: View {
    @State private var showingLightning = false
    var body: some View {
        VStack{
            Image("fastAsLightningsh")
                .resizable()
                .frame(width: 100, height: 100)
            Text("Fast as lightning !")
                .font(Font.custom("SFProRounded", size: 11))
                .foregroundColor(Color.black)
            Text("Faster than usual !")
                .foregroundColor(Color.gray)
                .font(Font.custom("SFProRounded", size: 11))
                .opacity(0.5)
                .frame(width : 100, height: 20)
                .multilineTextAlignment(.center)
        }
        .onTapGesture {
            showingLightning.toggle()
        }.sheet(isPresented: $showingLightning) {
            ZStack{
                Color("blue")
                    .opacity(0.2)
                    .ignoresSafeArea()
                VStack{
                    Image("fastAsLightningsh")
                        .resizable()
                        .frame(width: 300, height: 300)
                       
                    Text("Fast as lightning")
                        .font(Font.custom("SFProRounded", size: 40))
                        .foregroundColor(Color("gold"))
                    
                    Text("You finished all of your lists for today faster than you usually do ! Keep it up !")
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

struct LightningPage_Previews: PreviewProvider {
    static var previews: some View {
        LightningPage()
    }
}

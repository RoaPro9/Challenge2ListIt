//
//  Achiever.swift
//  listcoredata
//
//  Created by Roa Moha on 27/05/1444 AH.
//
// Created by Reem Alkhatib on 21/12/2022.
//

import SwiftUI

struct Achiever: View {
    @State private var showingAchiever = false
    var body: some View {
        VStack{
            Image("achieversh")
                .resizable()
                .frame(width: 100, height: 100)
            Text("Achiever !")
                .font(Font.custom("SFProRounded", size: 11))
                .foregroundColor(Color.black)
            Text("Finished all lists on time !")
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
                    Image("achieversh")
                        .resizable()
                        .frame(width: 300, height: 300)
                       
                    Text("Achiever !")
                        .font(Font.custom("SFProRounded", size: 40))
                        .foregroundColor(Color("gold"))
                    
                    Text("Finished all lists on time !")
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

struct Achiever_Previews: PreviewProvider {
    static var previews: some View {
        Achiever()
    }
}

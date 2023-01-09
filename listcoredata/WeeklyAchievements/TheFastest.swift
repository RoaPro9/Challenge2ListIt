//
//  TheFastest.swift
//  listcoredata
//
//  Created by Roa Moha on 27/05/1444 AH.
//

import SwiftUI

struct TheFastest: View {
    @State private var showingAchiever = false
    var body: some View {
        VStack{
            Image("theFastestsh")
                .resizable()
                .frame(width: 100, height: 100)
            Text("The fastest !")
                .font(Font.custom("SFProRounded", size: 11))
                .foregroundColor(Color.black)
            Text("Finished all your lists 30 mins after creating them !")
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
                    Image("theFastestsh")
                        .resizable()
                        .frame(width: 300, height: 300)
                       
                    Text("The fastest !")
                        .font(Font.custom("SFProRounded", size: 40))
                        .foregroundColor(Color("gold"))
                    
                    Text("Finished all your lists 30 mins after creating them !")
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

struct TheFastes_Previews: PreviewProvider {
    static var previews: some View {
        TheFastest()
    }
}


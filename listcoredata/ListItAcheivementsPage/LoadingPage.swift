////
////  LoadingPage.swift
////  ListItWeeklyAcheivements
////
////  Created by Reem Alkhatib on 15/12/2022.
////
//
//import SwiftUI
//
//struct Loading_page: View {
//    @State private var isActive = false
//    @State private var size = 0.7
//    @State private var opacity = 0.3
//    
//    var body: some View {
//        NavigationView {
//            NavigationLink(destination: AcheivementsPage()) {
//                ZStack{
//                    
//                    
//                    HStack{
//                        
//                        GIFView(type: .name("ListIt"))
//                   .frame(width: .infinity, height: .infinity)
//                    }
//                    
//                    .ignoresSafeArea()
//                    .scaleEffect (size)
//                    .opacity (opacity)
//                    .onAppear {
//                        withAnimation(.easeIn(duration: 1.2)) {
//                            self.size = 1.0
//                            self.opacity = 1.0
//                        }
//                    }
//                    .onAppear {
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//                            self.isActive = true
//                        }
//                    }
//                    
//                }.navigationBarBackButtonHidden(true)
//                .background(Color("gold"))
//                
//            }
//        }
//        }
//        
//    }
//
//
//struct LoadingPage_Previews: PreviewProvider {
//    static var previews: some View {
//        Loading_page()
//    }
//}

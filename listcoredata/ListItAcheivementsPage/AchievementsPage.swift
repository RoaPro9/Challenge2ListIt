//
//  ContentView.swift
//  ListItWeeklyAcheivements
//
//  Created by Reem Alkhatib on 13/12/2022.
//

import SwiftUI

struct AcheivementsPage: View {
    
    @State private var selection: String = "home"
    @State private var tabSelection: TabBarItem = .day
    
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            DailyAcheivements()
                        .tabBarItem(tab: .day, selection: $tabSelection)
                       
                    
            WeeklyAchievements()
                        .tabBarItem(tab: .week, selection: $tabSelection)

            MonthlyAchievements()
                        .tabBarItem(tab: .month, selection: $tabSelection)
                    
                   
                }
        
                .ignoresSafeArea(.keyboard, edges: .bottom)
                .navigationBarBackButtonHidden(true)
    }
        }
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AcheivementsPage()
    }
}

//
//  ListItAcheivmentPage.swift
//  listcoredata
//
//  Created by Roa Moha on 27/05/1444 AH.
//

import SwiftUI

struct ListItAcheivmentPage: View {
    
    @State private var selection: String = "home"
    @State private var tabSelection: TabBarItem = .day
    
    var body: some View {
        NavigationView{
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
    } }

struct ListItAcheivmentPage_Previews: PreviewProvider {
    static var previews: some View {
        ListItAcheivmentPage()
    }
}

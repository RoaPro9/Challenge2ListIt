//
//  MonthlyAchievementsModel.swift
//  ListItAcheivementsPage
//
//  Created by Reem Alkhatib on 20/12/2022.
//

import SwiftUI

class MonthlyAchievementsModel: ObservableObject {
    @Published var thirdRowOfMonthly: [Achievement] = []
    
    init() {
        addAchievement()
    }
    
    func addAchievement() {
        
        thirdRowOfMonthly = thirdRowMonthlyData
    }
}
    
let thirdRowMonthlyData = [
    Achievement(achievemetSymbol: Image("theCrown"), acheivementName: "Dear royalty!", achievementDescription: "Finished all your lists on a holiday !"),
    
    Achievement(achievemetSymbol: Image("brainiac"), acheivementName: "Braniac !", achievementDescription: "Finished 10 lists in a day !"),
    Achievement(achievemetSymbol: Image("bullseye"), acheivementName: "Bullseye !", achievementDescription: "Managed to finish daily lists for one month straight !"),
    ]

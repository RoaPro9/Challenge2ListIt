//
//  WeeklyAchievementsModel.swift
//  ListItAcheivementsPage
//
//  Created by Reem Alkhatib on 20/12/2022.
//

import SwiftUI

class WeeklyAchievementsModel: ObservableObject {
    @Published var secRowOfWeekly: [Achievement] = []
    @Published var thirdRowOfWeekly: [Achievement] = []
    
    init() {
        addAchievement()
    }
    
    func addAchievement() {
        secRowOfWeekly = secRowWeeklyData
        thirdRowOfWeekly = thirdRowWeeklyData
    }
}
   
let secRowWeeklyData = [
    Achievement(achievemetSymbol: Image("champion"), acheivementName: "Champion !", achievementDescription: "Five achievements a day !"),
    Achievement(achievemetSymbol: Image("luckyCharm"), acheivementName: "Lucky charm !", achievementDescription: "Managed to finish just before the deadline !"),
    
    
    ]
let thirdRowWeeklyData = [
    Achievement(achievemetSymbol: Image("theCrown"), acheivementName: "Dear royalty!", achievementDescription: "Finished all your lists on a holiday !"),
    Achievement(achievemetSymbol: Image("brainiac"), acheivementName: "Braniac !", achievementDescription: "Finished 10 lists in a day !"),
    Achievement(achievemetSymbol: Image("bullseye"), acheivementName: "Bullseye !", achievementDescription: "Managed to finish daily lists for one month straight !"),
    ]

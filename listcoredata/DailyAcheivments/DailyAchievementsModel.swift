//
//  DailyAchievementsModel.swift
//  listcoredata
//
//  Created by Roa Moha on 27/05/1444 AH.
//

import SwiftUI

class DailyAchievementsModel: ObservableObject {
    @Published var firstRowOfDaily: [Achievement] = []
    @Published var secRowOfDaily: [Achievement] = []
    @Published var thirdRowOfDaily: [Achievement] = []
    
    
    init() {
        addAchievement()
    }
    
    func addAchievement() {
        firstRowOfDaily = firstRowDailyData
        secRowOfDaily = secRowDailyData
        thirdRowOfDaily = thirdRowDailyData
    }
}
    let firstRowDailyData = [
        Achievement(achievemetSymbol: Image("champion"), acheivementName: "Champion !", achievementDescription: "Five achievements a day !"),
        
        
        ]
let secRowDailyData = [
    Achievement(achievemetSymbol: Image("achiever"), acheivementName: "Achiever !", achievementDescription: "Finished all lists on time!"),
    Achievement(achievemetSymbol: Image("luckyCharm"), acheivementName: "Lucky charm !", achievementDescription: "Managed to finish just before the deadline !"),
    Achievement(achievemetSymbol: Image("theCrown"), acheivementName: "Dear royalty !", achievementDescription: "Finished all your lists on a holiday !"),
    
    ]
let thirdRowDailyData = [
    Achievement(achievemetSymbol: Image("theFastest"), acheivementName: "The fastest !", achievementDescription: "Finished all your lists 30 mins after creating them !"),
    Achievement(achievemetSymbol: Image("brainiac"), acheivementName: "Braniac !", achievementDescription: "Finished 10 lists in a day !"),
    Achievement(achievemetSymbol: Image("bullseye"), acheivementName: "Bullseye !", achievementDescription: "Managed to finish daily lists for one month straight !"),
    ]



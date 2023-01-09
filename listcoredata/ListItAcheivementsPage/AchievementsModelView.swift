//
//  AchievementsModelView.swift
//  ListItWeeklyAcheivements
//
//  Created by Reem Alkhatib on 20/12/2022.
//

import SwiftUI

struct Achievement: Identifiable {
    var id = UUID()
    var achievemetSymbol: Image
    var acheivementName: String
    var achievementDescription: String

}

//
//  TabBarItem.swift
//  ListItWeeklyAcheivements
//
//  Created by Reem Alkhatib on 14/12/2022.
//

import Foundation
import SwiftUI

enum TabBarItem: Hashable {
    case day, week, month
    
    
    var title: String {
        switch self {
        case .day: return "Day"
        case .week: return "Week"
        case .month: return "Month"
       
        }
    }
    
    var color: Color {
        switch self {
        case .day: return Color("gold")
        case .week: return Color("gold")
        case .month: return Color("gold")
      
        }
    }
    var textColor: Color {
        switch self {
        case .day: return Color.white
        case .week: return Color.white
        case .month: return Color.white
      
        }
    }
    
    }


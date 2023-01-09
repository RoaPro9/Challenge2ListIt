//
//  itemModel.swift
//  checkbox
//
//  Created by Nouf almandeel on 27/05/1444 AH.
//

import Foundation

struct itemModel: Identifiable{
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}

//
//   TaskItemExtention.swift
//  ToDoListAppTutorial
//
//  Created by saba on 27/05/1444 AH.
//

import SwiftUI
import CoreData

extension TaskItem
{
    
    func isCompleted() -> Bool
    {
        return completedDate != nil
    }
    
}

//
//  DateHolder.swift
//  ToDoListAppTutorial
//
//  Created by saba on 26/05/1444 AH.
//

import SwiftUI
import CoreData

class DateHolder: ObservableObject
{
    init(_ context : NSManagedObjectContext)
    {
        
    }
    func saveContext(_ context: NSManagedObjectContext)
    {
      do {
          try context .save()
      } catch {
          
          let nsError = error as NSError
          fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
      }
  }
   
}

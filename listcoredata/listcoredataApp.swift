//
//  listcoredataApp.swift
//  listcoredata
//
//  Created by Roa Moha on 26/05/1444 AH.
//

import SwiftUI
import CoreData

@main
struct listcoredataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            let context = persistenceController.container.viewContext
            let dateHolder = DateHolder(context)
            
//            TaskListView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//                .environmentObject(dateHolder)
           // ListItAcheivmentPage()
          //  CloudKitPapulated()
            CloudKitList()
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

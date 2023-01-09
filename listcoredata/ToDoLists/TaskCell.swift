//
//  TaskCell.swift
//  listcoredata
//
//  Created by Roa Moha on 27/05/1444 AH.
//

import SwiftUI

struct TaskCell: View
{
    @EnvironmentObject var dataHolder : DateHolder
    @ObservedObject var passedTaskItem: TaskItem
    var body: some View {
        HStack
        {
            CheckBoxView(passedTaskItem: passedTaskItem)
               // .environmentObject(dataHolder)
            
            Text(passedTaskItem.name ?? "")
                .padding(.horizontal)
            
            if !passedTaskItem.isCompleted() && passedTaskItem.scheduleTime
            {
                
                
                
            }
            
        }
    }
            
            struct TaskCell_Previews: PreviewProvider {
                static var previews: some View {
                    TaskCell(passedTaskItem: TaskItem())
                }
            }
        }
    


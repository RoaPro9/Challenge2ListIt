//
//  CreateNewList.swift
//  ListItAcheivementsPage
//
//  Created by Reem Alkhatib on 21/12/2022.
//

import SwiftUI
import Combine

struct CreateListView: View {
    @ObservedObject var taskStore = TaskStore()
    @State var newToDo : String = ""
    @State private var reminder = Date.now
    @State private var givenName: String = ""
    
    var searchBar : some View {
        VStack {
            TextField(
                "Title...",
                text: $givenName
            )
            .disableAutocorrection(true)
            .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal, -2.0)
            HStack {
                TextField("Enter in a new task", text: self.$newToDo)
                Button(action: self.addNewToDo, label: {
                    Text("Add New")
                        .foregroundColor(Color.orange)
                })
            }
        }
    }
    
    func addNewToDo() {
        taskStore.tasks.append(Task(id: String(taskStore.tasks.count + 1), toDoItem: newToDo))
        self.newToDo = ""
        //Add auto generated id in the future.
    }
    
    var body: some View {
        NavigationView {
            VStack {
                searchBar.padding()
                List {
                    ForEach(self.taskStore.tasks) { task in
                        Text(task.toDoItem)
                    }.onMove(perform: self.move)
                        .onDelete(perform: self.delete)
                    
                }
                .navigationBarItems(trailing: EditButton().foregroundColor(Color.orange))
                DatePicker("Reminder", selection: $reminder, displayedComponents: .hourAndMinute)
                    .padding([.bottom, .trailing], -3.0)
                    .labelsHidden()
                    .accentColor(/*@START_MENU_TOKEN@*/.orange/*@END_MENU_TOKEN@*/)
            }
            
        }
        
    }
    
    
    
    func move(from source : IndexSet, to destination : Int) {
        taskStore.tasks.move(fromOffsets: source, toOffset: destination)
    }
    
    func delete(at offsets : IndexSet) {
        taskStore.tasks.remove(atOffsets: offsets)
        
    }
    
}

struct CreateNewListView: PreviewProvider {
    static var previews: some View {
        CreateListView()
    }
}

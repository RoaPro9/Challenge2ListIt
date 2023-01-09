//
//  listview.swift
//  checkbox
//
//  Created by Nouf almandeel on 24/05/1444 AH.
//

import SwiftUI

struct listview: View {
    @State var items : [itemModel] = [
        itemModel(title: "Egss", isCompleted: false),
        itemModel(title: "Milk", isCompleted: false),
        itemModel(title: "Apple", isCompleted: false),
        itemModel(title: "Cereal", isCompleted: true),
        itemModel(title: "Oranges", isCompleted: false),
        itemModel(title: "Bread", isCompleted: true),
    ]
    @StateObject private var vmL = CloudKitPapulatedViewModel()
    var body: some View {
        NavigationView{
            List{
                ForEach(items) {item in
                    ListRowView(item: item)
                }
                
                .onDelete(perform: deleteItem)
                .onMove(perform: moveltem)
                
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Market ")
            .navigationBarItems(leading: EditButton(),
                                trailing:
                                    NavigationLink("Add",destination: Addview())
                .foregroundColor(.orange)
                .navigationBarBackButtonHidden(false)
                .foregroundColor(.orange))
            
        }}
        func deleteItem(indexSet: IndexSet) {
            items.remove (atOffsets: indexSet)
        }
        func moveltem(from: IndexSet , to:Int ){
            items.move(fromOffsets: from, toOffset: to)
        }
    }
    
    struct listview_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView{
                listview()
            }
        }
    }


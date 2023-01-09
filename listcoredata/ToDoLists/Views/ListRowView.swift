//
//  ListRowView.swift
//  checkbox
//
//  Created by Nouf almandeel on 25/05/1444 AH.
//

import SwiftUI

struct ListRowView: View {
    
    let item : itemModel
    
    var body: some View {
        HStack {
            Image (systemName: "checkmark.circle")
                .foregroundColor(item.isCompleted ? .orange : .black)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = itemModel(title: "first item", isCompleted: false)
    static var item2 = itemModel(title: "second item", isCompleted: true)
    
    static var previews: some View {
        VStack {
            ListRowView(item:item1)
            ListRowView(item:item2)
        }
        .previewLayout(.sizeThatFits)
    }
}

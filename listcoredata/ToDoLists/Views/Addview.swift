//
//  Addview.swift
//  checkbox
//
//  Created by Nouf almandeel on 27/05/1444 AH.
//

import SwiftUI

struct Addview: View {
    @State var textFieldText: String=""
    
    var body: some View {
        ScrollView{
            TextField("type something here ... ", text: $textFieldText)
                .padding(.horizontal)
            
               
        }
        .navigationTitle("Add a list")
    }
}

struct Addview_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Addview()
        }
    }
}

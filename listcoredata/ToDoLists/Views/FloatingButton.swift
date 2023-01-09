

import SwiftUI

struct FloatingButton: View
{
    @EnvironmentObject var dateHolder: DateHolder
    
    var body: some View
    {
        HStack
        {
            NavigationLink(
                destination: CreateListView()
//                    .environmentObject(dateHolder)
            ){
                
                Image(systemName: "plus.circle.fill")
                    .font(.system(size: 40))
                //                Text("New List")
                //
                //                    .font(.headline)
            }

           .padding(15)
            .foregroundColor(.orange)
            //.background(.orange)
            .cornerRadius(30)
            //.shadow(color:.black.opacity(0.1),radius: 3 ,x:3,y:3)
            .offset(x:120,y:300)
        }
      //  .padding(.vertical,200)
    }
}

struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButton()
    }
}

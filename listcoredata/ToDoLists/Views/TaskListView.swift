
import SwiftUI
import CoreData

struct TaskListView: View {
    @StateObject private var vmL = CloudKitPapulatedViewModel()

    @StateObject private var vm = CloudKitListViewModel()
    @State var fill : CGFloat = 0.755
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dataHolder : DateHolder
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \TaskItem.dueDate, ascending: true)],
        animation: .default)
    private var items: FetchedResults<TaskItem>
    
    init (){
        //vm.getiCloudStatuse()
        vm.requestPremission()
        vm.fetchiCloudListRecordID()
    }
    
    var body: some View {
        
        NavigationView
        {
            
            VStack{
                
                //parent stack
                VStack{
                    
                    Text("Hello , Saba  \(vm.userName) ")
                        .foregroundColor(.black)
                        .font(.system(size: 30, weight:.semibold, design: .rounded))
                        .offset(x:-90)
                    Text("3 Lists for you Today..! ")
                        .font(.system(size: 15, weight: .semibold, design: .default))
                        .foregroundColor(.gray)
                        .offset(x:-92,y:3)
                }
                ZStack{
                    ZStack{
                        VStack{
                            
                            Button {
                                print("Button pressed")
                            } label: {
                                ZStack{
                                    HStack{
                                        Image(systemName: "trophy.circle")
                                            .resizable()
                                            .frame(width: 35, height: 35)
                                            .foregroundColor(.orange)
                                            .offset(x:20,y:-30)
                                        Text("Achievments")
                                            .font(.system(size: 20, weight:.semibold, design: .rounded))
                                        
                                            .frame(width: 300 , height: 150)
                                            .offset(x:-65,y:-30)
                                    }
                                    NavigationLink(destination:  ListItAcheivmentPage()){
                                        HStack{
                                            Text("Only 30% Left to Finish your tasks, keep it up..!")
                                                .font(.system(size: 15, weight:.regular, design: .rounded))
                                                .foregroundColor(.gray)
                                                .frame(width: 160,height: 50)
                                                .offset(x:-10,y:15)
                                            ZStack{
                                                Circle()
                                                
                                                    .stroke(Color.orange.opacity(0.3),
                                                            style: StrokeStyle(lineWidth:20))
                                                
                                                    .frame(width:100 , height:100)
                                                
                                                Circle()
                                                    .trim(from: 0, to: self.fill)
                                                //   .trim(from: 0, to: stat.currentData / stat.goal) khawlah
                                                    .stroke(.orange ,lineWidth:20)
                                                    .frame(width:100 , height:100)
                                                    .rotationEffect(.init(degrees:360))
                                                    .animation (Animation.linear (duration: 1))
                                                //  .animation(.default, value: 1)
                                                Text("%\(Int(self.fill * 100.0))")
                                                    .bold()
                                                    .font(.system(size:20))
                                            }
                                        }
                                        .onTapGesture {
                                            self.fill = 1.0
                                            
                                        }}
                                }
                                .background(.white)
                                .cornerRadius(8)
                                .foregroundColor(.black)
                                .shadow(
                                    color: Color.gray.opacity(0.3),
                                    radius: 8,
                                    x: 0,
                                    y: 0)
                                
                                
                                
                            }
                            
                            Text("Lists")
                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                                .offset(x:-150,y:10)
//                            List
//                            {
                            NavigationLink(destination:listview() ){
                                List {
                                    //                   Text("hi").frame(height: 55)
                                    //                    Text("test")
                                    ForEach (vmL.todoList) {
                                        Hlist in
                                        ZStack{
                                            
                                            
                                            RoundedRectangle(cornerRadius: 15.0)
                                                .fill(.white)
                                                .frame(width: 330,height: 60 )
                                                .shadow(radius: 5)
                                            
                                            Text(Hlist.label)
                                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                                                .offset(x: -120)
                                                
                                            
                                            
                                            //
                                            
                                            
                                        }
                                    }  .onDelete(perform: deleteItems)
                                    
                                    
                                    
                                    
                                }
                                .listStyle(PlainListStyle())
                                    .onAppear{
                                        vmL.fetchList()
                                        // vm.addLists()
                                        // }
                                        //
                                        //                                    ForEach(items)
                                        //                                { taskitem in
                                        //
                                        //                                        NavigationLink(destination: TaskEditView(passedTaskItem: taskitem, initialDate: Date()))
                                        //                                            //.environmentObject(dataHolder))
                                        //                                        {
                                        //                                            ZStack {
                                        //                                                ZStack{
                                        //                                                    RoundedRectangle(cornerRadius: 10.0)
                                        //                                                        .fill(.white)
                                        //                                                    .frame(width: 350,height: 50 )
                                        //                                                    .shadow(radius: 5)
                                        //                                                }
                                        //
                                        //                                                TaskCell(passedTaskItem: taskitem)
                                        //                                                  //  .environmentObject(dataHolder)
                                        //
                                        //
                                        //                                            }
                                        //
                                        //                                        }
                                        //                                    }
                                        //                                    .onDelete(perform: deleteItems)
                                        //
                                    }}
                                
                                //.listStyle(PlainListStyle())
                           
                                .toolbar {
                                    
                                    ToolbarItem(placement: .navigationBarTrailing )
                                    {
                                        EditButton()
                                            .foregroundColor(.orange)
                                            .font(.system(size: 20, weight:.semibold, design: .rounded))
                                        
                                        //                                            .foregroundColor(.orange)
                                        //                                            .offset(x:-140,y:-10)
                                    }
                                    
                                    
                                    
                                }
                                
                                
                            }  // Text("Done Lists ")
                        } .padding(.vertical,10)
                        
                        
                    FloatingButton()
                           // .environmentObject(dataHolder)
                        
                        
                    }//.navigationTitle("Lists")
                    
                    //                    .foregroundColor(.black)
                    //                    .font(.system(size: 20, weight:.semibold, design: .rounded))
                    //
                    
                    
                }
        }
        }
    

        
    
      func saveContext(_ context: NSManagedObjectContext) {
        do {
            try context .save()
        } catch {
            
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

           // dateHolder.saveContext(viewContext)
            dataHolder.saveContext(viewContext)
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

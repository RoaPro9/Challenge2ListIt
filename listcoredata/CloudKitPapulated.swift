//
//  CloudKitPapulated.swift
//  listcoredata
//
//  Created by Roa Moha on 26/05/1444 AH.
//

import SwiftUI
import CloudKit
class CloudKitPapulatedViewModel : ObservableObject {
    @Published var text : String = ""
    @Published var lists: [String] = []
    @Published var todoList : [Lists] = []
    
    init() {
       // fetchList()
       // addLists()
    }
    func addButtonPressed (){
        guard !text.isEmpty else {return}
        
       // addList(name : text)
        
        
        
    }
     func addList (Llabel: String , LisDone : Bool , LItems :[String] ){
let newList = CKRecord(recordType:"List")
        newList["label"] = Llabel
        newList["isDone"] = LisDone
        newList["id"] = 1 * 2
        newList["items"] = LItems
        saveList(record: newList)
        
        
        
    }
    private func saveList (record : CKRecord){
        // we should use a privare or shared based on what exactly we need but i used the publis so we can display the list on all acc on a demo version
        CKContainer.default().publicCloudDatabase.save(record){
            [weak self] returnedRecord, returnedError  in
            DispatchQueue.main.async {
                self?.text = ""

            }
        }
    }
    func fetchList(){
        print("hi")
        // predicate is a fillter
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "List", predicate: predicate)
        //let queryOperation = CKQueryOperation(query: query)
        var returnedList: [String] = []
        CKContainer.default().publicCloudDatabase.perform(query, inZoneWith: nil) { [self] records, error in
            guard error == nil else {
                print("Error: \(error?.localizedDescription)")
                return
            }
            guard let  records  = records else {
                print("No Records")
                return
            }
            DispatchQueue.main.async {
                records.map{
                    let list = Lists(record: $0)
                    todoList.append(list)
                    
                }
                print(lists,"😀")
            }

        }
//        queryOperation.recordMatchedBlock = {
//            (returnedRecordID, returnedResult) in
//            DispatchQueue.main.async { [self] in
//                switch returnedResult {
//                case .success(let record):
//                     let list = Lists(record: record)
//                    self.todoList.append(list)
////                    print("todoListkk \n ************************************")
//                case .failure(let error):
//                    print("\(error)")
//                }
//            }
//
//        }
//        CKContainer.default().publicCloudDatabase.add(queryOperation)
//
//        if #available(iOS 15.0 ,  *){
//            queryOperation.queryResultBlock = { [weak self] returnedResult in
//                self?.lists = returnedList
//            }}
//        else {
//
//            queryOperation.queryCompletionBlock = { (returnedCursor, returnedError) in
//
//
//            }
//        }
        
//
//        if #available(iOS 15.0 ,  *){
//            queryOperation.queryResultBlock = { returnedResult in
//            }}
//        else {
//
//            queryOperation.queryCompletionBlock = { (returnedCursor, returnedError) in
//
//            }
//        }
        
        
      //  addOpriation(operation : queryOperation)
        
    }
    func addOpriation (operation: CKDatabaseOperation){
        
        CKContainer.default().publicCloudDatabase.add(operation)
        
    }
//    func addLists(){
//        let  idC = 1
//        let record = CKRecord(recordType: "List")
//        record["label"] = Llabel
//        record["isDone"] = LisDone
//        record["id"] = idC * 2
//        record["items"] = LItems
//        CKContainer.default().publicCloudDatabase.save(record) { record, error in
//            guard  error  == nil else{
//                print(error?.localizedDescription)
//                return
//            }
//        }
//    }

    
}
struct CloudKitPapulated: View {
    @StateObject private var vm = CloudKitPapulatedViewModel()
    var body: some View {
        NavigationView{
            VStack{
                header
                
                textField
                addButton

                List {
//                   Text("hi").frame(height: 55)
//                    Text("test")
                    ForEach (vm.todoList) { Hlist in
                       HStack{
                            Text(Hlist.label)
                           
                         
                           
                            
                       }
                        
                    }
                        
                    
                    
                    
                }.listStyle(PlainListStyle())
                    .onAppear{
                        vm.fetchList()
                       // vm.addLists()
                    }
                    
                
                
            }.padding()
                .navigationBarHidden(true)
        }}
}

struct CloudKitPapulated_Previews: PreviewProvider {
    static var previews: some View {
        CloudKitPapulated()
    }
}
struct Lists : Identifiable {
    let id : CKRecord.ID
    let isDone : Bool
    let label : String
    var items :[String] = []
    
    init(record:CKRecord){
        self.id        = record.recordID
        self.isDone = record["isDone"] as? Bool ?? false
        self.label  = record["label"] as? String ?? "N/A"
        self.items  = record["items"] as? [String] ?? ["Apple", "Peach", "Mango"]
      }
    
    
    
}
extension CloudKitPapulated{
    
    private var header : some View {
        
        Text("All List ")
            .font(.headline)
            .underline()
        
    }
    private var textField : some  View{
        TextField("Add a List to do...", text :$vm.text)
            .frame(height: 55)
            .background(Color.gray.opacity(0.4))
            .cornerRadius( 15)
            .padding(.leading)
    }
    private var addButton : some  View{
        Button{
            //vm.addLists()
            
        } label:  {
            Text("Add")
                .font(.headline)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .cornerRadius( 10)

        }
    }
    
    
}

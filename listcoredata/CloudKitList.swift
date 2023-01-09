//
//  CloudKitList.swift
//  listcoredata
//
//  Created by Roa Moha on 26/05/1444 AH.
//
//here is where the code take premission from th user to have access on the user n=name and the icloud so we can link the apple watch app and the ios app togatehr 

import SwiftUI
import CloudKit
class CloudKitListViewModel: ObservableObject {
    @Published var isSignedInToiCloud: Bool = false
    @Published var error : String = ""
    @Published var userName : String = ""
    @Published var premissionStatus : Bool = false
    @Published var listLabel : String = ""
    init (){
        //getiCloudStatuse()
        requestPremission()
    fetchiCloudListRecordID()
    }
    private func getiCloudStatuse(){
        
        CKContainer.default().accountStatus{[weak self] returnedStatus, returnedError in DispatchQueue.main.async {
            switch returnedStatus{
            case .available:
                self?.isSignedInToiCloud = true
            case .noAccount:
                self?.error = CloudKitError.iCloudAccountNotFound.localizedDescription
            case .couldNotDetermine:
                self?.error = CloudKitError.iCloudAccountNotDetermine.localizedDescription
            case .restricted :
                self?.error = CloudKitError.iCloudAccountRestricted.localizedDescription
            default:
                self?.error = CloudKitError.iCloudAccountRestricted.localizedDescription
                
                
                
            }
        }}
    }
    enum CloudKitError : String ,LocalizedError{
        case iCloudAccountNotFound
        case iCloudAccountNotDetermine
        case iCloudAccounUnknown
        case iCloudAccountRestricted
        
        
        
    }
    func requestPremission(){
        CKContainer.default().requestApplicationPermission([.userDiscoverability]){ [weak self]
         returnedStatus , returnedError in
            DispatchQueue.main.async {
                if returnedStatus == .granted {
                    self?.premissionStatus = true
                    
                }
            }
        }
        
        
    }
    func fetchiCloudListRecordID (){

        CKContainer.default().fetchUserRecordID{
            
            
            [weak self] returnedID , returnedError in if let id = returnedID{
                self?.discoveriCloudLists(id: id)
            }
            
            
        }

  }
    func discoveriCloudLists(id: CKRecord.ID){
        CKContainer.default().discoverUserIdentity(withUserRecordID: id ){[weak self]
            returnedIdentity , returnedError in
            DispatchQueue.main.async {
                if let name = returnedIdentity?.nameComponents?.givenName{
                    
                    self?.userName = name
                }
            }
            
            
        }
        
    }

}
struct CloudKitList: View {
    @StateObject private var vm = CloudKitListViewModel()
    var body: some View {
        VStack{
            Text("is signed in : \(vm.isSignedInToiCloud.description.uppercased())")
            
            Text(vm.error)
            //Text("mewo")
            Text("premission : \(vm.premissionStatus.description.uppercased())")
            Text("name is : \(vm.userName)")
            
            
            
        }
    }
}

struct CloudKitList_Previews: PreviewProvider {
    static var previews: some View {
        CloudKitList()
    }
}

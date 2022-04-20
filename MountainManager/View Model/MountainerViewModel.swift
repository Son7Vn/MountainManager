//
//  MountainerViewModel.swift
//  MountainManager
//
//  Created by SonGoku on 02/04/2022.
//

import SwiftUI

class MountainerViewModel: ObservableObject {
    @Published var listMountain = [Mountainer]()
    @Published var errMessenger = ""
    
    init() {
//        load()
        fetchData()
    }
    
    func load() {
        listMountain = Mountainer.listdemo
    }
    
    func update(_ mountainer: Mountainer) {
//        guard let index = listMountain.firstIndex(where: {$0.id == mountainer.id}) else {return print(mountainer.id)}
//        listMountain[index] = mountainer
//        print("Update listMountain")
        guard let mountainID = mountainer.id else {return}
        
        FirebaseManager.shared.firestore.collection("Mountainer").document(mountainID).updateData(["name":mountainer.name,"age":mountainer.age])
        {
            err in
            if let err = err {
                self.errMessenger = "Failed to update data\(err)"
                return
            }
//            self.fetchData()
            self.errMessenger = "Success to update data"
        }
        self.fetchData()
    }
    
    func add(_ mountainer: Mountainer) {
        
        let ref = FirebaseManager.shared.firestore.collection("Mountainer").document()
        
        try? ref.setData(from: mountainer) {
            err in
            if let err = err {
                self.errMessenger = "Failed to setData: \(err)"
                return
            }
//            self.fetchData()
            self.errMessenger = "Success to setData!"
        }
        
//        listMountain.append(mountainer)
    }
    
    func fetchData() {
        listMountain.removeAll()
        FirebaseManager.shared.firestore.collection("Mountainer").addSnapshotListener { querySnapshot, err in
            if let err = err {
                self.errMessenger = "Failed to fetch data:\(err)"
                return
            }
            
            querySnapshot?.documentChanges.forEach({ snapshot in
                do {
                    if let snapshotdata = try snapshot.document.data(as: Mountainer.self) {
                        self.listMountain.append(snapshotdata)
//                        self.errMessenger = "Success to fetchData"
//                        self.fetchData()
                        
                    }
                } catch {
                    self.errMessenger = "Failed!:\(error)"
                }
                
            })
        }
    }
    
    func delete(at offset: IndexSet) {
//        self.listMountain.remove(atOffsets: offset)
    
        offset.forEach { index in
            let mountainer = listMountain[index]
            guard let mountainerID = mountainer.id else {return}
            FirebaseManager.shared.firestore.collection("Mountainer").document(mountainerID).delete {err in
                if let err = err {
                    self.errMessenger = "Failed to Deleted items: \(err)"
                    return
                }
//                self.fetchData()
                
                self.errMessenger = "Deleted item!"
            
            }
        }
        
    }
    
}

//
//  FirebaseManager.swift
//  MountainManager
//
//  Created by SonGoku on 04/04/2022.
//

import Foundation
import Firebase

class FirebaseManager: NSObject {
    
    let storage: Storage
    let firestore: Firestore
    
    
    static var shared = FirebaseManager()
    
    override init() {
        FirebaseApp.configure()
        self.storage = Storage.storage()
        self.firestore = Firestore.firestore()
        
        super.init()
    }

}

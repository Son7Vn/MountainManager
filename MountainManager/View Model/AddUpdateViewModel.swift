//
//  UpdateMountainerViewMode.swift
//  MountainManager
//
//  Created by SonGoku on 02/04/2022.
//

import SwiftUI

class AddUpdateViewModel: ObservableObject {
    @Published var name = ""
    @Published var age = ""
    var id : String?
    
    var update: Bool {
        id == nil
    }
    
    var disable : Bool {
        name.isEmpty || age.isEmpty
    }
    
    init() {}
    
    init(_ mountainer: Mountainer) {
        self.name = mountainer.name
        self.age = mountainer.age
        id = mountainer.id
    }
    
}

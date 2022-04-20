//
//  ModelType.swift
//  MountainManager
//
//  Created by SonGoku on 02/04/2022.
//

import Foundation
import SwiftUI

enum ModelType: Identifiable,View {
    case add
    case update(Mountainer)
    
    var id : String {
        switch self {
        case .add :
            return "add"
        case .update:
            return "update"
        }
    }
    
    var body: some View {
        switch self {
        case .add:
            return AddUpdateView(mountainer: AddUpdateViewModel())
        case .update(let mountainer):
            return AddUpdateView(mountainer: AddUpdateViewModel(mountainer))
        }
        
    }
}

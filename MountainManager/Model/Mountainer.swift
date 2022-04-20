//
//  Mountain.swift
//  MountainManager
//
//  Created by SonGoku on 02/04/2022.
//

import Foundation
import FirebaseFirestoreSwift

struct Mountainer: Identifiable,Codable {
    @DocumentID var id: String?
    var uid: String = UUID().uuidString
    var name: String
    var age: String

    static var listdemo: [Mountainer] {
        [
        Mountainer(name: "Son", age: "7"),
        Mountainer(name: "Hoang", age: "8"),
        Mountainer(name: "Tuan", age: "90")
        ]
    }
}

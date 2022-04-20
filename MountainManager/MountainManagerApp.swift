//
//  MountainManagerApp.swift
//  MountainManager
//
//  Created by SonGoku on 02/04/2022.
//

import SwiftUI

@main
struct MountainManagerApp: App {
    var body: some Scene {
        WindowGroup {
            ListMountainView()
                .environmentObject(MountainerViewModel())
        }
    }
}

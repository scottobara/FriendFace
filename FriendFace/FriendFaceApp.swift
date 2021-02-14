//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Scott Obara on 14/2/21.
//

import SwiftUI

@main
struct FriendFaceApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

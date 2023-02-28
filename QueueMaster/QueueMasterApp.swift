//
//  QueueMasterApp.swift
//  QueueMaster
//
//  Created by Adi Amoyal on 28/02/2023.
//

import SwiftUI

@main
struct QueueMasterApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

//
//  RideyApp.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/1/28.
//

import SwiftUI

@main
struct RideyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

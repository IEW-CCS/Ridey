//
//  RideyApp.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/1/28.
//

import SwiftUI

@main
struct RideyApp: App {
    @StateObject private var router = Router()
    @StateObject private var registerUser = RegisterUser()
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                ContentView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
            .environmentObject(router)
            .environmentObject(registerUser)
        }
    }
}

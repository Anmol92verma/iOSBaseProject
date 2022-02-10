//
//  PraxisiOSApp.swift
//  PraxisiOS
//
//  Created by Anmol Verma on 10/02/22.
//

import SwiftUI

@main
struct PraxisiOSApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

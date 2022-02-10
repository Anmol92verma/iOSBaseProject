//
//  PraxisiOSApp.swift
//  PraxisiOS
//
//  Created by Anmol Verma on 10/02/22.
//

import SwiftUI
import praxis_data

@main
struct PraxisiOSApp: App {
    let context = NotesLocalDataSource.viewContext

    var body: some Scene {
        WindowGroup {
            NotesView().environment(\.managedObjectContext, context)
        }
    }
}

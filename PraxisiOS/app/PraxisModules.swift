//
//  PraxisModules.swift
//  PraxisiOS
//
//  Created by Anmol Verma on 20/04/22.
//

import Foundation
import SwiftUI
import CoreData
import praxis_domain

struct PraxisModules: View {
    
    let modules = ["Notes","Jokes"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(modules.indices) { index in
                        NavigationLink {
                            if index == 0 {
                                NotesView()
                            }else{
                                JokesView()
                            }
                        } label: {
                            Text(modules[index])
                        }
                    }
            }.toolbar {
                ToolbarItem(placement: .principal) {
                        Text("Select Module")
                            .font(.largeTitle.bold())
                            .accessibilityAddTraits(.isHeader)
                    }
            
            }
        
        }.navigationTitle("Select Praxis Module to test")
    }
}


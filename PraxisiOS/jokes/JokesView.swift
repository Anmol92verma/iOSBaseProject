//
//  JokesView.swift
//  PraxisiOS
//
//  Created by Anmol Verma on 20/04/22.
//

import Foundation
import SwiftUI
import CoreData
import praxis_domain

struct JokesView: View {
    
    @ObservedObject var viewModel = JokesVM()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.jokeCategories, id: \.self) { category in
                        NavigationLink {
                            ViewJokesForCategory(category:category)
                        } label: {
                            Text(category)
                        }
                    }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                        Text("Joke Categories")
                            .font(.largeTitle.bold())
                            .accessibilityAddTraits(.isHeader)
                    }
            
            }.onAppear {
                viewModel.fetchJokeCategories()
            }
            Text("Select a Category")
        }.navigationTitle("Chuck Norris Jokes")
    }
}

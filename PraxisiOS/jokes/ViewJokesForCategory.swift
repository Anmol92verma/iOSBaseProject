//
//  ViewJokesForCategory.swift
//  PraxisiOS
//
//  Created by Anmol Verma on 20/04/22.
//

import Foundation
import SwiftUI
import praxis_domain

struct ViewJokesForCategory : View{
    
    let category:String
    
    @ObservedObject var randomJokeVM = RandomJokeVM()
    
    var body: some View{
        VStack{
            Text(randomJokeVM.randomJoke?.value ?? "").onAppear {
                randomJokeVM.fetchJoke(category:category)
            }.font(.largeTitle).padding()
            
            Button {
                randomJokeVM.fetchJoke(category:category)
            } label: {
                Text("Refresh").font(.title3)
            }.padding()

        }
    }
}

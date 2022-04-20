//
//  JokesVM.swift
//  PraxisiOS
//
//  Created by Anmol Verma on 20/04/22.
//

import Foundation
import praxis_domain
import praxis_data
import Combine

class JokesVM : ObservableObject{
    
    @Published var jokeCategories : Categories = []
    var bag: [AnyCancellable] = []
    var fetchCancellable : AnyCancellable? = nil
    let jokeRepo : JokesRepository = JokeRepoImpl()
    
    
    func fetchJokeCategories(){
        fetchCancellable?.cancel()
        do{
            fetchCancellable = try UseCaseFetchJokeCategories(jokesRepo: jokeRepo).performStreaming(param:"nil")
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { err in
                
            }, receiveValue: { jokeCategories in
                self.jokeCategories = jokeCategories
            })
            fetchCancellable?.store(in: &bag)
        }catch{
            
        }
      
    }
}

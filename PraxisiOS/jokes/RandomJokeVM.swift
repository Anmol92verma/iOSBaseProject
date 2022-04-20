//
//  RandomJokeVM.swift
//  PraxisiOS
//
//  Created by Anmol Verma on 20/04/22.
//

import Foundation
import praxis_domain
import praxis_data
import Combine

class RandomJokeVM : ObservableObject{
    
    @Published var randomJoke : RandomJokeFromCategory? = nil
    var bag: [AnyCancellable] = []
    var fetchCancellable : AnyCancellable? = nil
    let jokeRepo : JokesRepository = JokeRepoImpl()
    
    
    func fetchJoke(category:String){
        fetchCancellable?.cancel()
        do{
            fetchCancellable = try UseCaseFetchJokesForCategory(jokesRepo: jokeRepo).performStreaming(param:category)
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { err in
                
            }, receiveValue: { jokeCategories in
                self.randomJoke = jokeCategories
            })
            fetchCancellable?.store(in: &bag)
        }catch{
            
        }
      
    }
}

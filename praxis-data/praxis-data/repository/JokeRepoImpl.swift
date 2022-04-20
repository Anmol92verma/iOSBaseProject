//
//  JokeRepoImpl.swift
//  praxis-data
//
//  Created by Anmol Verma on 20/04/22.
//

import Foundation
import praxis_domain
import CoreData
import Combine

let jokeCategories = "https://api.chucknorris.io/jokes/categories"
let randomJoke = "https://api.chucknorris.io/jokes/random?category="

public struct JokeRepoImpl : JokesRepository{
    public func fetchJokeCategories() -> AnyPublisher<Categories, APIError> {
        return URLSession.shared.categoriesTask(with: URL(string: jokeCategories)!)
    }
    
    public func fetchJokeForCategory(category: String) -> AnyPublisher<RandomJokeFromCategory, APIError> {
        return URLSession.shared.randomJokeFromCategoryTask(with: URL(string: randomJoke+category)!)
    }
    

    
}
    

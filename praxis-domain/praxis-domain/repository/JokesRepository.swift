//
//  JokesRepository.swift
//  praxis-domain
//
//  Created by Anmol Verma on 20/04/22.
//

import Foundation
import Combine
import CoreData

public protocol JokesRepository {
    func fetchJokeCategories() -> AnyPublisher<Categories, APIError>
    func fetchJokeForCategory(category:String) -> AnyPublisher<RandomJokeFromCategory,APIError>
}

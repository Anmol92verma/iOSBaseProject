//
//  UseCaseFetchJokeCategories.swift
//  praxis-domain
//
//  Created by Anmol Verma on 20/04/22.
//

import Foundation
import Combine

public struct UseCaseFetchJokeCategories : StreamingUseCase{
    
    typealias Param = Any
    typealias Result = Categories
    typealias ErrorType = APIError
    
    let jokeRepo : JokesRepository
    
    public init(jokesRepo :JokesRepository) {
        self.jokeRepo = jokesRepo
    }
    
   public func performStreaming(param: Any?) throws -> AnyPublisher<Categories, APIError> {
        return jokeRepo.fetchJokeCategories()
    }
    
   public func perform(param: Any?) throws -> Categories {
        abort()
    }
}

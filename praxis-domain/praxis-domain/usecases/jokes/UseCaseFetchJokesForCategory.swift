//
//  UseCaseFetchJokesForCategory.swift
//  praxis-domain
//
//  Created by Anmol Verma on 20/04/22.
//

import Foundation
import Combine

public struct UseCaseFetchJokesForCategory : StreamingUseCase{
    public func perform(param: String?) throws -> RandomJokeFromCategory {
        abort()
    }
    
    
    typealias Param = String
    typealias Result = RandomJokeFromCategory
    typealias ErrorType = APIError

    let jokeRepo : JokesRepository
    
    public init(jokesRepo :JokesRepository) {
        self.jokeRepo = jokesRepo
    }
    
    public func performStreaming(param: String?) throws -> AnyPublisher<RandomJokeFromCategory, APIError> {
        return jokeRepo.fetchJokeForCategory(category: param!)
    }
    
}

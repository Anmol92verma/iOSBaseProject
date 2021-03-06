//
//  BaseUseCase.swift
//  praxis-domain
//
//  Created by Anmol Verma on 10/02/22.
//

import Foundation
import Combine

protocol UseCase{
    associatedtype Param
    associatedtype Result
    associatedtype ErrorType : Error
    func perform(param:Param?) throws -> Result
}

protocol StreamingUseCase : UseCase{
    func performStreaming(param:Param?) throws -> AnyPublisher<Result,ErrorType>
}


protocol BlockingUseCase : UseCase{
    func performAsync(param:Param?) async throws -> Result
}

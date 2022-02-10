//
//  UseCaseFetchNotes.swift
//  praxis-domain
//
//  Created by Anmol Verma on 10/02/22.
//

import Foundation
import Combine

public struct UseCaseFetchNotes : StreamingUseCase{
    typealias Param = Any
    typealias Result = [Note]
    
    let notesRepository : NotesRepository
    
    public init(notesRepository :NotesRepository) {
        self.notesRepository = notesRepository
    }
    
    public func performStreaming(param: Any?) -> AnyPublisher<[Note], NSError> {
        return notesRepository.getNotes()
    }
    
    func perform(param: Any?) throws -> [Note] {
        print("not needed")
        abort()
    }
    
}

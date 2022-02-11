//
//  UseCaseDeleteNote.swift
//  praxis-domain
//
//  Created by Anmol Verma on 11/02/22.
//

import Foundation
import Combine

public struct UseCaseDeleteNote : StreamingUseCase{
    
    typealias Param = Note
    typealias Result = Bool
    
    let notesRepository :NotesRepository
    
    public init(notesRepository :NotesRepository) {
        self.notesRepository = notesRepository
    }
    
    func perform(param: Note?) throws -> Bool {
        abort()
    }

    public func performStreaming(param: Note?) -> AnyPublisher<Bool, NSError> {
        return notesRepository.deleteNote(note: param!)
    }
   
}



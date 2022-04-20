//
//  UseCaseDeleteNote.swift
//  praxis-domain
//
//  Created by Anmol Verma on 20/04/22.
//

import Foundation
import Combine
import CoreData

public struct UseCaseDeleteNote : StreamingUseCase{
  
  

    typealias Param = Note
    typealias Result = NSBatchDeleteResult
    typealias ErrorType = NSError

    let notesRepository :NotesRepository
    
    public init(notesRepository :NotesRepository) {
        self.notesRepository = notesRepository
    }
   
    public func performStreaming(param: Note?) throws -> AnyPublisher<NSBatchDeleteResult, NSError> {
        return notesRepository.deleteNote(note: param!)
    }
    
    public func perform(param: Note?) throws -> NSBatchDeleteResult {
        abort()
    }
    
}

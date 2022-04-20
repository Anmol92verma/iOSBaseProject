//
//  UseCaseFetchXData.swift
//  praxis-domain
//
//  Created by Anmol Verma on 10/02/22.
//

import Foundation
import Combine

public struct UseCaseSaveNote : StreamingUseCase{

    typealias Param = Note
    typealias Result = Bool
    typealias ErrorType = NSError
    
    let notesRepository :NotesRepository
    
    public init(notesRepository :NotesRepository) {
        self.notesRepository = notesRepository
    }
    
    func perform(param: Note?) throws -> Bool {
        abort()
    }

    public func performStreaming(param: Note?) -> AnyPublisher<Bool, NSError> {
        return notesRepository.saveNote(note: param!)
    }
   
}

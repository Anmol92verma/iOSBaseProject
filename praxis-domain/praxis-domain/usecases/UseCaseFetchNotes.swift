//
//  UseCaseFetchNotes.swift
//  praxis-domain
//
//  Created by Anmol Verma on 10/02/22.
//

import Foundation


public struct UseCaseFetchNotes : UseCase{
    typealias Param = Any
    typealias Result = [Note]
    
    let notesRepository : NotesRepository
    
    public init(notesRepository :NotesRepository) {
        self.notesRepository = notesRepository
    }

    public  func perform(param: Any?) throws -> [Note] {
        return try notesRepository.getNotes()
    }
    
}

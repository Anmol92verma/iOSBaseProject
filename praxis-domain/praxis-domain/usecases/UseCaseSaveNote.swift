//
//  UseCaseFetchXData.swift
//  praxis-domain
//
//  Created by Anmol Verma on 10/02/22.
//

import Foundation
import Combine

public struct UseCaseSaveNote : UseCase{

    typealias Param = Note
    typealias Result = Note
    
    let notesRepository :NotesRepository
    public init(notesRepository :NotesRepository) {
        self.notesRepository = notesRepository
    }
    public  func perform(param: Note?) throws -> Note {
        return try notesRepository.saveNote(note: param!)
    }
   
}

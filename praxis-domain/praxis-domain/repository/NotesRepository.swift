//
//  NotesRepository.swift
//  praxis-domain
//
//  Created by Anmol Verma on 10/02/22.
//

import Foundation

public protocol NotesRepository {
    func saveNote(note:Note) throws ->  Note
    func getNotes() throws -> [Note]
}

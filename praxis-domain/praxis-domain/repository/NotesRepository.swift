//
//  NotesRepository.swift
//  praxis-domain
//
//  Created by Anmol Verma on 10/02/22.
//

import Foundation
import Combine
import CoreData

public protocol NotesRepository {
    func saveNote(note:Note) ->  AnyPublisher<Bool,NSError>
    func getNotes() -> AnyPublisher<[Note],NSError>
    func deleteNote(note:Note)->  AnyPublisher<NSBatchDeleteResult,NSError>
}

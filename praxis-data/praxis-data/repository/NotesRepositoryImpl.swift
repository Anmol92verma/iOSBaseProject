//
//  NotesRepositoryImpl.swift
//  praxis-data
//
//  Created by Anmol Verma on 10/02/22.
//

import Foundation
import praxis_domain
import CoreData
import Combine

public struct NotesRepositoryImpl : NotesRepository{

    let mapper:EntityMapper<NoteEntity,Note>
    
    public init(entityMapper: EntityMapper<NoteEntity,Note>) {
        self.mapper = entityMapper
    }
    
    
    public  func getNotes() -> AnyPublisher<[Note],NSError> {
        let request: NSFetchRequest<NoteEntity> = NSFetchRequest<NoteEntity>(entityName: "NoteEntity")
        return CoreDataStore.publisher(fetch: request).map { notesEntity in
            print(notesEntity.count)
           return notesEntity.map({ NoteEntity in
                return mapper.mapToDomain(data: NoteEntity)
            })
        }.eraseToAnyPublisher()
    }
    
    public func deleteNote(note: Note) -> AnyPublisher<NSBatchDeleteResult, NSError> {
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "NoteEntity")
        deleteFetch.predicate = NSPredicate(format: "id == %s", argumentArray: [note.id.uuidString])

        return CoreDataStore.publisher(delete: deleteFetch)
            .eraseToAnyPublisher()
    }
    
    public  func saveNote(note: Note) -> AnyPublisher<Bool,NSError> {
        let action:  Action = {
            let newItem :NoteEntity =  CoreDataStore.createEntity()
            newItem.timestamp = note.date
            newItem.note = note.note
            newItem.id = note.id
        }
        return CoreDataStore
            .publisher(save: action).eraseToAnyPublisher()
    }

}

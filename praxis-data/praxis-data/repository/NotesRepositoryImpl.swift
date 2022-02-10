//
//  NotesRepositoryImpl.swift
//  praxis-data
//
//  Created by Anmol Verma on 10/02/22.
//

import Foundation
import praxis_domain
import CoreData

public struct NotesRepositoryImpl : NotesRepository{
    public init() {}
    public  func getNotes() throws -> [Note] {
        var notes : [Note] = []

        do{
            let viewContext = NotesLocalDataSource.container.viewContext
            let request: NSFetchRequest<NoteEntity> = NSFetchRequest<NoteEntity>(entityName: "NoteEntity")

            let notesDB = try viewContext.fetch(request)
            notesDB.forEach { NoteEntity in
               
                notes.append(Note.init(id: NoteEntity.id ?? UUID.init(), note: NoteEntity.note ?? "", date: NoteEntity.timestamp ?? Date()))
            }
        
        }catch let error as NSError{
            print("Could not fetch \(error)")

        }
        return notes
    }
    
    public  func saveNote(note: Note) -> Note {
        let persistentContainer = NotesLocalDataSource.container
        let context = persistentContainer.viewContext
        let newItem = NoteEntity(context: context)
        newItem.timestamp = note.date
        newItem.note = note.note
        newItem.id = note.id
        
        // 2
        if context.hasChanges {
          do {
            // 3
            try context.save()
          } catch {
            // 4
            // The context couldn't be saved.
            // You should add your own error handling here.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
          }
        }
        return note
    }

}

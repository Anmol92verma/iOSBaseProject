//
//  NotesViewModel.swift
//  PraxisiOS
//
//  Created by Anmol Verma on 10/02/22.
//

import Foundation
import praxis_domain
import praxis_data

class NotesVM : ObservableObject{
    
    @Published var notes :[Note] = []
    
    let notesRepo : NotesRepository = NotesRepositoryImpl()
    
    func saveNote(){
        do{
            try UseCaseSaveNote(notesRepository : notesRepo).perform(param: Note(id: UUID.init(), note: "sdfsdf", date: Date()))
        fetchNotes()
        }catch{
            
        }
    }
                                
    func fetchNotes(){
        do{
            notes = try UseCaseFetchNotes(notesRepository : notesRepo).perform(param: nil)
        }catch{
            
        }
    }
}

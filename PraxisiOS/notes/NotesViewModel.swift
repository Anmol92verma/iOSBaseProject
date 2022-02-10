//
//  NotesViewModel.swift
//  PraxisiOS
//
//  Created by Anmol Verma on 10/02/22.
//

import Foundation
import praxis_domain
import praxis_data
import Combine

class NotesVM : ObservableObject{
    
    @Published var notes :[Note] = []
    var bag: [AnyCancellable] = []
    var fetchCancellable : AnyCancellable? = nil

    let notesRepo : NotesRepository = NotesRepositoryImpl(entityMapper: NoteEntityMapper())
    
    func saveNote(){
        UseCaseSaveNote(notesRepository : notesRepo).performStreaming(param: Note(id: UUID.init(), note: "sdfsdf", date: Date())).receive(on: DispatchQueue.main)
                  .sink(receiveCompletion: { err in
                  
              }, receiveValue: { isSaved in
                  self.fetchNotes()
              }).store(in: &bag)
    }
    
    func deleteNotes(offsets: IndexSet){
        print(offsets.first)
        
    }
                                
    func fetchNotes(){
    fetchCancellable?.cancel()
    fetchCancellable =  UseCaseFetchNotes(notesRepository : notesRepo).performStreaming(param: nil).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { err in
            
        }, receiveValue: { newNotes in
            self.notes = newNotes
        })
        fetchCancellable?.store(in: &bag)
    }
}

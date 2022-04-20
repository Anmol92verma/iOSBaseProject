//
//  ContentView.swift
//  PraxisiOS
//
//  Created by Anmol Verma on 10/02/22.
//

import SwiftUI
import CoreData
import praxis_domain

struct NotesView: View {
    
    @ObservedObject var viewModel = NotesVM()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.notes) { note in
                        NavigationLink {
                            Text(note.note)
                        } label: {
                            Text(note.date, formatter: itemFormatter)
                        }
                    }
                    .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }.onAppear {
                viewModel.fetchNotes()
            }
            Text("Select an item")
        }
    }

    private func addItem() {
        viewModel.saveNote()
    }
    
    
    private func deleteItems(offsets: IndexSet) {
        self.viewModel.deleteNotes(offsets:offsets)
    }
    
    
    private let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()

   
}


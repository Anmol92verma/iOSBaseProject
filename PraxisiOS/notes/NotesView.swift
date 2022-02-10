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
                ForEach(viewModel.notes.indices,id:\.self) { index in
                        NavigationLink {
                            Text(self.viewModel.notes[index].note)
                        } label: {
                            Text(self.viewModel.notes[index].date, formatter: itemFormatter)
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


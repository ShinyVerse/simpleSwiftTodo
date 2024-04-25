//
//  NoteListView.swift
//  todo
//
//  Created by Laura Jackson on 27/03/2024.
//

import Foundation
import SwiftUI
import SwiftData

struct NoteListView: View {
    
    @Environment(\.modelContext) private var context
    
    let todo: Todo
    
    var body: some View {
        List {
            ForEach(todo.notes) { note in
                Text(note.message)
            }.onDelete(perform: deleteNote(indexSet:))
        }
    }
    
    private func deleteNote(indexSet: IndexSet) {
        indexSet.forEach { index in
            let note = todo.notes[index]
            context.delete(note)
            
            todo.notes.remove(at: index)
            
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

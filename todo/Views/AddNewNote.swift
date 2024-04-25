//
//  AddNewNote.swift
//  todo
//
//  Created by Laura Jackson on 27/03/2024.
//

import Foundation
import SwiftUI
import SwiftData

struct AddNewNote: View {
    let todo: Todo
    
    @State private var message: String = ""
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Form {
            TextField("Note", text: $message)
        }
        .navigationTitle("Add new note")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Close") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    let note = Note(message: message)
                    note.todo = todo
                    context.insert(note)
                    
                    do {
                        try context.save()
                        todo.notes.append(note)
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                    dismiss()
                }
            }
        }
    }
}

//
//  TodoDetailView.swift
//  todo
//
//  Created by Laura Jackson on 26/03/2024.
//

import SwiftUI
import SwiftData

struct TodoDetailView: View {
    let todo: Todo
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var isEditing = false
    @State private var title: String = ""
    @State private var category: String = ""
    @State private var notes: String = ""
    
    @State private var showAddNewNote = false
    
    init(todo: Todo){
        self.todo = todo
        self._title = State.init(initialValue: todo.title)
        self._category = State.init(initialValue: todo.category)
    }
    
  
    var body: some View {
        Form {
            if isEditing {
                Group {
                    TextField("Title", text: $title)
                }
                .textFieldStyle(.roundedBorder)
                HStack {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundColor(.blue.opacity(0.7))
                    Text("If you require a new category, create in the categories tab").foregroundStyle(.blue.opacity(0.7)).font(.caption).multilineTextAlignment(.center)
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundColor(.blue.opacity(0.7))
                }
            
                CategorySelectionView(selectedCategory: $category).frame(height: 150)
                
                Button("Save") {
                    todo.title = title
                    todo.category = category
                
                    do {
                        try context.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                    dismiss()
                }
            } else {
                // needs tidying
                Text(todo.title)
                Text(todo.category).padding(.horizontal).background(.green.opacity(0.3), in: .capsule)
            }
            
            if (!isEditing) {
                Section("Notes") {
                    Button("Add new note") {
                        showAddNewNote.toggle()
                    }
                    .sheet(isPresented: $showAddNewNote, content: {
                        NavigationStack {
                            AddNewNote(todo: todo)
                        }
                        .presentationDetents([.fraction(0.3)])
                        .interactiveDismissDisabled()
                    })
                    
                    if todo.notes.isEmpty {
                        ContentUnavailableView("No notes", systemImage: "note")
                    } else {
                        NoteListView(todo: todo)
                    }
                }
            }
            
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button( isEditing ? "Done" : "Edit") {
                    isEditing.toggle()
                }
//                custom mod: Hidden Modifier
//                .hidden(enable: isEditing)
            }
        }
        .navigationTitle("Task Details")
    }
    
}

//#Preview {
//    TodoDetailView()
//}


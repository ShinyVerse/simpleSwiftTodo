//
//  TodoListView.swift
//  todo
//
//  Created by Laura Jackson on 20/03/2024.
//

import SwiftUI
import SwiftData

struct TodoListView: View {
    @Environment(\.modelContext) private var context
    @Query private var todos: [Todo]
    @State private var presentAddNew = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(todos) { todo in
                    TodoCellView(todo: todo)
                } 
                .onDelete(perform: delete(indexSet:))
  
            }
            .navigationTitle("Todo List")
            .navigationDestination(for: Todo.self) { todo in
                TodoDetailView(todo: todo)
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button() {
                        presentAddNew.toggle()
                    } label: {
                       Image(systemName: "plus.circle")
                    }
                    .sheet(isPresented: $presentAddNew, content: {
                        AddNewTodoView()
                    })
                }
            }
        }
    }
    
    
    
    
    private func delete(indexSet: IndexSet) {
        indexSet.forEach{index in
            let todo = todos[index]
            context.delete(todo)
            
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    TodoListView()
}

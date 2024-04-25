//
//  AddNewTodoView.swift
//  todo
//
//  Created by Laura Jackson on 15/03/2024.
//

import SwiftUI
import SwiftData

struct AddNewTodoView: View {
    
    @State private var title: String = ""
    @State private var category: String = ""
    @State private var completed: Bool = false
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var selectedCategory = ""
    
    private var isValid: Bool {
        !title.isEmpty && (!category.isEmpty || !selectedCategory.isEmpty)
    }
    
    private var hasTooManyCategories: Bool {
      !category.isEmpty && !selectedCategory.isEmpty
    }

    

    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading ) {
                Text("Task:")
                TextField("Enter task", text: $title)
                    .textFieldStyle(.roundedBorder)
                Text("Category:")
                TextField("Enter category", text: $category)
                    .textFieldStyle(.roundedBorder)
                    
                CategorySelectionView(selectedCategory: $selectedCategory)
                
                if (hasTooManyCategories) {
                    Text("Too many categories selected")
                        .bold()
                        .foregroundColor(Color.red)
                }
                
                HStack{
                    Button("Cancel", role: .destructive) {
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(20)
                    Spacer()
                    Button("Save") {
                        let todo = Todo(title: title, completed: false, category: selectedCategory.isEmpty ?  category : selectedCategory)
                         
                        if (!category.isEmpty) {
                          let newCategory = Category(name: category)
                            context.insert(newCategory)
                        }
                        
                        context.insert(todo)
                        
                        do {
                            try context.save()
                        } catch {
                            print(error.localizedDescription)
                        }
                        
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(20)
                    .disabled(!isValid || hasTooManyCategories)
              
                }
                Spacer()
            }
            .padding(20)
            .navigationTitle("Add New Task")
        }
    }
}

#Preview {
    AddNewTodoView()
}

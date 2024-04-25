//
//  AddNewCategory.swift
//  todo
//
//  Created by Laura Jackson on 10/04/2024.
//

import SwiftUI
import SwiftData

struct AddNewCategory: View {
    
    @State private var name: String = ""
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Add new category", text: $name)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                
                HStack {
                    Button("Save") {
                        let category = Category(name: name)
                        context.insert(category)
                        
                        do {
                            try context.save()
                        } catch {
                            print(error.localizedDescription)
                        }
                        
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Button("Cancel") {
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                }
                
                Spacer()
            }
            .navigationTitle("Add new category")
        }
    }
}

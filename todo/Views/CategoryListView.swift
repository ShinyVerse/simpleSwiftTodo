//
//  CategoryListView.swift
//  todo
//
//  Created by Laura Jackson on 10/04/2024.
//

import Foundation
import SwiftUI
import SwiftData

struct CategoryListView: View { 
    
    @Query(sort: \Category.name)
    private var categories: [Category]
    
    @State private var presentAddNewCategory = false
    
    @Environment(\.modelContext) private var context
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(categories) { category in
                    Text(category.name)
                }
                .onDelete(perform: deleteCategory(indexSet:))
            }
            .navigationTitle("Categories")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        presentAddNewCategory.toggle()
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                    .sheet(isPresented: $presentAddNewCategory) {
                        AddNewCategory()
                            .presentationDetents([.fraction(0.3)])
                            .interactiveDismissDisabled()
                    }
                }
            }
        }
    }
    
    private func deleteCategory(indexSet: IndexSet) {
        indexSet.forEach { index in
            let categoryToDelete = categories[index]
            context.delete(categoryToDelete)
            
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
       
    }
}


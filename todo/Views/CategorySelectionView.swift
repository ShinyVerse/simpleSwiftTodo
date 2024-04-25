//
//  CategorySelectionView.swift
//  todo
//
//  Created by Laura Jackson on 24/04/2024.
//

import SwiftUI
import SwiftData

struct CategorySelectionView: View {
    
    @Query(sort: \Category.name) private var categories: [Category]
    @Binding var selectedCategory: String
    
    var body: some View {
        List {
            Section("Categories") {
                ForEach(categories) { category in
                    HStack {
                        Text(category.name)
                        Spacer()
                        Image(systemName: (selectedCategory == category.name) ?
                              "checkmark.circle.fill" : "circle.dashed")
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        if (selectedCategory != category.name) {
                            selectedCategory = category.name
                        } else {
                            selectedCategory = ""
                        }
                    }
                }
            }
        }
        .listStyle(.plain)
    }
}


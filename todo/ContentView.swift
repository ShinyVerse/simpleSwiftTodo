//
//  ContentView.swift
//  todo
//
//  Created by Laura Jackson on 15/03/2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {

        TabView {
            TodoListView().tabItem {
                // replace image
                Image(systemName: "circle")
                Text("Tasks")
            }
            
            CategoryListView().tabItem {
                // replace image?
                Image(systemName: "circle.grid.hex")
                Text("Categories")
            }
        }
    }
}

#Preview {
    ContentView()
}

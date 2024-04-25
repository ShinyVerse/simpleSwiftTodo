//
//  todoApp.swift
//  todo
//
//  Created by Laura Jackson on 15/03/2024.
//

import SwiftUI
import SwiftData

@main
struct todoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().modelContainer(for: [Todo.self])        }
    }
}


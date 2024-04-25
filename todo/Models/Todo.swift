//
//  Todo.swift
//  todo
//
//  Created by Laura Jackson on 15/03/2024.
//

import Foundation
import SwiftData

@Model
final class Todo {
    var title: String
    var completed: Bool
    var completedOn: Date?
    var category: String

    
    @Relationship(deleteRule: .cascade, inverse: \Note.todo)
    var notes = [Note]()
    @Relationship(deleteRule: .nullify, inverse: \Category.todos)
    var categories = [Category]()
    
    init(title: String, completed: Bool, category: String) {
        self.title = title
        self.completed = completed
        self.category = category
    }
    
    func complete() {
        if (self.completed == false) {
            self.completed = true
            self.completedOn = Date()
        }
    }

}

//
//  Category.swift
//  todo
//
//  Created by Laura Jackson on 10/04/2024.
//
import SwiftData

import Foundation


@Model
final class Category {
    var name: String
    var todos: [Todo] = []
    
    init(name: String) {
        self.name = name
        
    }
}

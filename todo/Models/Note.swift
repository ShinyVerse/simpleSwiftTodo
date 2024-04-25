//
//  Note.swift
//  todo
//
//  Created by Laura Jackson on 27/03/2024.
//

import Foundation
import SwiftData

@Model
final class Note {
    var message: String
    var todo: Todo?
    
    init(message: String, todo: Todo? = nil) {
        self.message = message
        self.todo = todo
    }
}

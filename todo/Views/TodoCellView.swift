//
//  TodoCellView.swift
//  todo
//
//  Created by Laura Jackson on 20/03/2024.
//

import SwiftUI

struct TodoCellView: View {
    let todo: Todo
    let dateFormatter = DateFormatter()
    
    func formatDate(_ date: Date) -> String {
          let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "dd/MM/yyyy"
          return dateFormatter.string(from: date)
      }
    
    @State private var isOn = false
    var body: some View {
        
        NavigationLink(value: todo){
            VStack(alignment: .leading) {
                HStack {
                    Text(todo.title).bold()
                    Spacer()
                    Image(systemName: todo.completed ? "checkmark.square.fill" : "square")
                               .foregroundColor(todo.completed ? Color(UIColor.systemBlue) : Color.secondary)
                               .onTapGesture {
                                   self.todo.complete()
                               }
                }
                HStack {
                    Text("\(todo.category)")
                        .font(.caption)
                        .padding(.horizontal)
                        .background(.green.opacity(0.3), in: .capsule)
                    Spacer()
                    if todo.completed && (todo.completedOn != nil) {
                        Text("Completed on: \(formatDate(todo.completedOn!))")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                     
                    }
                }
                .padding(.top, 5)
            
            }
        }
    }
}

//
//  ✅TodoItemView.swift
//  todo2
//
//  Created by David Daly on 7/18/23.
//

import SwiftUI
import FirebaseFirestore


struct TodoItemView: View {
    // -------------------------------
    // MARK: ⚙️ Logic
    // -------------------------------
    @State var todo: Todo
    let userId: String
    let formattedDueDate: String
    
    // -------------------------------
    // 🐣 Initalize values. Format date
    init(todo: Todo, userId: String) {
        self.todo = todo
        self.userId = userId
        self.formattedDueDate = Date(timeIntervalSince1970: todo.dueDate).formatted(date: .abbreviated, time: .shortened)

    }

    // -------------------------------
    // 😵 Delete todo from Firebase
    func deleteTodo() {
        let FirebaseDatabase = Firestore.firestore()
        FirebaseDatabase.collection("users")
            .document(userId)
            .collection("todos")
            .document(todo.id)
            .delete()
    }
    
    // -------------------------------
    // MARK: 👀 VIEW
    // -------------------------------
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(todo.title)
                    .bold()
                    .font(.title2)
                Text(formattedDueDate)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Button() {
                // 👇 onClick
                todo.isDone.toggle()
            } label: {
                Image(systemName: todo.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(todo.isDone ? .green : .blue)
            }
        }
        .padding()
        // 🔴 Swipe to delete
        .swipeActions {
            Button {
                // 👆 onSwipe
                deleteTodo()
            } label: {
                Text("Delete")
            }
            .tint(.red)
        }
    }
}

// -------------------------------
// MARK: 🎥 PREVIEW
// -------------------------------
struct TodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemView(
            todo: Todo(
                id: "asdfa",
                title: "get eggs",
                dueDate: Date().timeIntervalSince1970,
                CreatedDate: Date().timeIntervalSince1970,
                isDone: false
            ),
            userId: "mosq9HOA1AgKoxWu0dzQ34krPO93"
        )
    }
}

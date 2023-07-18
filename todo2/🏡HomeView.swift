//
//  🏡HomeView.swift
//  todo2
//
//  Created by David Daly on 7/18/23.
//

import SwiftUI
import FirebaseFirestoreSwift

// -------------------------------
// MARK: 👀 VIEW
// -------------------------------
struct HomeView: View {
    @State var showNewItemView = false
    private let userId: String
    @FirestoreQuery var todoList: [Todo]
    
    init(userId: String) {
        // 🔥 Firebase collectionPath: users/<userId>/todos
        self._todoList = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self.userId = userId
    }
    
    
    
    
    var body: some View {
        NavigationStack {
            VStack {
                // 🧾 Todo list
                List(todoList) { todo in
                    TodoItemView(todo: todo, userId: userId)
                }
            }
            .navigationTitle("Home")

            // ➕ Plus button
            .toolbar() {
                Button() {
                    // 👇 onClick
                    showNewItemView = true
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.blue)
                        .bold()
                }
            }
            Spacer()
        }
        .sheet(isPresented: $showNewItemView) {
            NewTodoView(isPresented: $showNewItemView)
        }
    }
}

// -------------------------------
// MARK: 🎥 PREVIEW
// -------------------------------
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(userId: "mosq9HOA1AgKoxWu0dzQ34krPO93")
    }
}

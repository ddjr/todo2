//
//  🏡HomeView.swift
//  todo2
//
//  Created by David Daly on 7/18/23.
//

import SwiftUI
import FirebaseFirestore
// -------------------------------
// MARK: ⚙️ LOGIC
// -------------------------------
class HomeViewModel: ObservableObject {
    @Published var showNewItemView = false
}
// -------------------------------
// MARK: 👀 VIEW
// -------------------------------
struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                // 🧾 Todo list
                TodoItemView(title: "Get Eggs", date: Date().timeIntervalSince1970)
                Divider()
                TodoItemView(title: "Get Eggs", date: Date().timeIntervalSince1970)
                Divider()
            }
            .navigationTitle("Home")

            // ➕ Plus button
            .toolbar() {
                Button() {
                    // 👇 onClick
                    viewModel.showNewItemView = true
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.blue)
                        .bold()
                }
            }
            Spacer()
        }
        .sheet(isPresented: $viewModel.showNewItemView) {
            NewTodoView(isPresented: $viewModel.showNewItemView)
        }
    }
}

// -------------------------------
// MARK: 🎥 PREVIEW
// -------------------------------
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

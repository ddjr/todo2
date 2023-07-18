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


// -------------------------------
// MARK: 👀 VIEW
// -------------------------------
struct HomeView: View {
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
            .toolbar() {
                Button() {
                    // 👇 onClick
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.blue)
                        .bold()
                }
            }
            Spacer()
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

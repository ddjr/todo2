//
//  🏎️💨💨MainView.swift
//  todo2
//
//  Created by David Daly on 7/16/23.
//

import SwiftUI
import FirebaseAuth
import Firebase
import Foundation

// -------------------------------
// MARK: ⚙️ LOGIC
// -------------------------------
class MainViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    // -------------------------------
    // 🏎️💨 Start Model
    init() {
        self.handler = Auth.auth().addStateDidChangeListener({ [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        })
    }
    
    // -------------------------------
    // 🧐 Verify the user is signed in
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}

// -------------------------------
// MARK: 👀 VIEW
// -------------------------------
struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    var body: some View {
        // 👮‍♂️ Try to auto sign in
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            SignedInView
        } else {
            LoginView()
        }
    
    }
}

// -------------------------------
// MARK: 🧩 BITS
// -------------------------------

@ViewBuilder var SignedInView: some View {
    TabView {
        // 🏡 Home tab
        HomeView()
            .tabItem {
                Label("Home", systemImage: "house")
            }
        // 👨‍💼 Profile tab
        ProfileView()
            .tabItem {
                Label("Profile", systemImage: "person.circle")
            }
    }
}

// -------------------------------
// MARK: 🎥 PREVIEW
// -------------------------------
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

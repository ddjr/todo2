//
//  🏎️💨💨StartHereView.swift
//  todo2
//
//  Created by David Daly on 7/16/23.
//

import SwiftUI
import FirebaseAuth
import Firebase
import Foundation

// MARK: ⚙️ Logic ⚙️
class MainViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        let handler = Auth.auth().addStateDidChangeListener({ [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        })
        print(handler)
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}

// MARK: 👀 View 👀
struct ContentView: View {
    @StateObject var viewModel = MainViewModel()
    var body: some View {
        NavigationView {
            LoginView()
        }
    }
}

// MARK: 🧩 Bits 🧩
@ViewBuilder
var SignedInView: some View {
    Text("Hello world")
}

// MARK: 🎥 Preview 🎥
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

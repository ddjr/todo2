//
//  🏎️💨💨StartHereView.swift
//  todo2
//
//  Created by David Daly on 7/16/23.
//

import SwiftUI

// MARK: ⚙️ Logic ⚙️
class contentViewModel: ObservedObject {
    @Published var userId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        let handler = Auth.auth().addStateDidChangeListener({ [weak self] _, user in
            DispatchQueue.main.async {
                self?.userId = user?.uid ?? ""
            }
        })
    }
    
    public var signedId: Bool {
        return Auth.auth().currentUser != nil
    }
}

// MARK: 👀 View 👀
struct ContentView: View {
    @StateObject var viewModel = MainViewModel()
    var body: some View {
        
        if viewModel.signedIn, !viewModel.userId.isEmpty {
            💃SignedInView()
        } else {
            👮‍♂️LoginView()
        }
    }
}

// MARK: 🧩 Bits 🧩
@ViewBuilder
var 💃SignedInView: some View {
    Text("Hello world")
}

@ViewBuilder
var 👮‍♂️LoginView: some View {
    Text("Hello world")
}

// MARK: 🎥 Preview 🎥
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

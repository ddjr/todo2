//
//  todo2App.swift
//  todo2
//
//  Created by David Daly on 7/16/23.
//

import SwiftUI
import FirebaseCore

@main
struct todo2App: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

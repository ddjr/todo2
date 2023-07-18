//
//  RegisterView.swift
//  todo2
//
//  Created by David Daly on 7/16/23.
//

import SwiftUI
import Foundation
import FirebaseAuth

// -------------------------------
// MARK: ⚙️ Logic
// -------------------------------
class RegisterViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    
    init() {}
    
    // -------------------------------
    // 📝 Register user
    func register() {
        // 🧐 Try to validate all text fields
        guard validateText() else { return }
        // 🚀 Try to login to Firebase
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    // -------------------------------
    // 🧐 Validate text fields
    private func validateText() -> Bool {
        // 🔁 Reset error message
        errorMessage = ""
        
        // 🧐 Validate name text field
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            errorMessage = "Please fill in valid name"
            return false
        }
        // 🧐 Validate email text field
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              email.contains("@"), email.contains(".")
        else {
            errorMessage = "Please fill in valid email"
            return false
        }
        // 🧐 Validate password text field
        guard !password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            errorMessage = "Please fill in valid password"
            return false
        }
        // 💃 Everything checks out...
        return true
    }
}
// -------------------------------
// MARK: 👀 View 👀
// -------------------------------
struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        VStack {
            // -------------------------------
            // 🎩RegisterHeader
            HeaderView(
                title: "Register",
                subtitle: "Start Orginizing Todos",
                angle: -15.0,
                backgroundColor: .orange
            )
            // -------------------------------
            // 📝RegisterForm
            Form {
                TextField("First Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                Button() {
                    viewModel.register()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.green)
                            .padding(.horizontal)
                        Text("Create Account")
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

// -------------------------------
// MARK: 🎥 Preview 🎥
// -------------------------------
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

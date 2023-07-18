//
//  LoginView.swift
//  todo2
//
//  Created by David Daly on 7/16/23.
//

import SwiftUI
import FirebaseAuth
// -------------------------------
// MARK: ⚙️ Logic ⚙️
// -------------------------------
class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    
    init() {}
    
    // -------------------------------
    // 👮‍♂️ Login user
    func login() {
        // 🧐 Try to validate text fields
        guard validate() else { return }
        // 🚀 Try to login to Firebase
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    // -------------------------------
    // 🧐 Validate text fields
    private func validate() -> Bool {
        // 🔁 Reset error message
        errorMessage = ""
        
        // 🧐 Try to validate email text field
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              email.contains("@"), email.contains(".")
        else {
            errorMessage = "Please fill in valid email"
            return false
        }
        // 🧐 Try to validate password text field
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
struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    var body: some View {
        VStack {
            // -------------------------------
            // 🎩 Login Header
            HeaderView(
                title: "Todo List",
                subtitle: "Get Things Done",
                angle: 15.0,
                backgroundColor: .pink
            )
            // -------------------------------
            // 🥷 Login Form
            Form {
                // ⛔️ Error message
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                }
                
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button() {
                    viewModel.login()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10.0)
                            .foregroundColor(.blue)
                        
                        Text("Login")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
            }
            // -------------------------------
            // 👨‍💻 Create Account Link
            VStack {
                Text("New around here?")
                NavigationLink("Create An Account",
                               destination: RegisterView())
                .foregroundColor(.blue)
            }
            .padding(.bottom, 50)
            Spacer()
        }
    }
}
// -------------------------------
// MARK: 🧩 Bits 🧩
// -------------------------------


// -------------------------------
// MARK: 🎥 Preview 🎥
// -------------------------------
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

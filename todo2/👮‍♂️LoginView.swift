//
//  LoginView.swift
//  todo2
//
//  Created by David Daly on 7/16/23.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore
// -------------------------------
// MARK: ⚙️ LOGIC
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
    // MARK: ‼️ CHALLENGE #1 🟡
    // Level 2 Difficulty 🟡
    // TODO: add red border to invaild email and passwords.
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
        guard !password.trimmingCharacters(in: .whitespaces).isEmpty,
              password.count >= 6
        else {
            errorMessage = "Please fill in valid password"
            return false
        }

        // 💃 Everything checks out...
        return true
    }
}

// -------------------------------
// MARK: 👀 VIEW
// -------------------------------
struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    var body: some View {
        NavigationView {
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
                    NavigationLink("Create An Account", destination: RegisterView())
                        .foregroundColor(.blue)
                }
                .padding(.bottom, 50)
                Spacer()
            }
        }
    }
}

// -------------------------------
// MARK: 🎥 PREVIEW
// -------------------------------
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

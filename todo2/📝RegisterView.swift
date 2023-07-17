//
//  RegisterView.swift
//  todo2
//
//  Created by David Daly on 7/16/23.
//

import SwiftUI
import Foundation

// -------------------------------
// MARK: ⚙️ Logic
// -------------------------------
class RegisterViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    init() {}
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
                    // TODO: 📝register()
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

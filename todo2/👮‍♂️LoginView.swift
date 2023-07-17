//
//  LoginView.swift
//  todo2
//
//  Created by David Daly on 7/16/23.
//

import SwiftUI

// MARK: ⚙️ Logic ⚙️
// TODO: add login func




// MARK: 👀 View 👀
struct LoginView: View {
    var body: some View {
        🎩LoginHeader
        🥷LoginForm
        👨‍💻CreateAccountLink
    }
}

// MARK: 🧩 Bits 🧩
@ViewBuilder private var 🎩LoginHeader: some View {
    VStack {
        Text("Todo List")
        Text("Get Things Done")
    }
}

@ViewBuilder private var 🥷LoginForm: some View {
    @State var email = ""
    @State var password = ""
    Form {
        TextField("Email Address", text: $email)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .autocorrectionDisabled()
            .autocorrectionDisabled()
        SecureField("Password", text: $password)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        Button("Login") {
            // TODO: Add onClick
        }
        .background(.blue)
    }
}

@ViewBuilder private var 👨‍💻CreateAccountLink: some View {
    VStack {
        Text("New around here?")
        NavigationLink("Create An Account",
            destination: RegisterView())
        .foregroundColor(.blue)
    }
    .padding(.bottom, 50)
    Spacer()
    
}

// MARK: 🎥 Preview 🎥
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

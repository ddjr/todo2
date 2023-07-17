//
//  RegisterView.swift
//  todo2
//
//  Created by David Daly on 7/16/23.
//

import SwiftUI
import Foundation

// MARK: ⚙️ Logic
// TODO: register()

// MARK: 👀 View
struct RegisterView: View {
    var body: some View {
        VStack {
            🎩RegisterHeader
            📝RegisterForm
        }
    }
}

// MARK: 🧩 Bits
@ViewBuilder private var 🎩RegisterHeader: some View {
    ZStack {
        RoundedRectangle(cornerRadius: 0)
            .foregroundColor(.red)
            .  rotationEffect(Angle(degrees: -15))
            .offset(y: -100)
        VStack {
            Text("Register")
                .foregroundColor(.blue)
                .font(.title)
                .bold()
            Text("Signup Today")
                .foregroundColor(.blue)
                .font(.title2)
                .bold()
        }
    }
    .frame(width: 300, height: 400)
}

@ViewBuilder private var 📝RegisterForm: some View {
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""

    Form {
        TextField("First Name", text: $name)
            .textFieldStyle(DefaultTextFieldStyle())
        TextField("Email", text: $email)
            .textFieldStyle(DefaultTextFieldStyle())
        SecureField("Password", text: $password)
            .textFieldStyle(DefaultTextFieldStyle())
        Button("Create Account") {
            // TODO: register()
        }
        .background(.green)
        
    }
}
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

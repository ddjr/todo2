//
//  LoginView.swift
//  todo2
//
//  Created by David Daly on 7/16/23.
//

import SwiftUI
// -------------------------------
// MARK: ⚙️ Logic ⚙️
// -------------------------------
class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    init() {}
}
// -------------------------------
// MARK: 👀 View 👀
// -------------------------------
struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        
        VStack {
            // -------------------------------
            // 🎩LoginHeader
            HeaderView(
                title: "Todo List",
                subtitle: "Get Things Done",
                angle: 15.0,
                backgroundColor: .pink
            )
            // -------------------------------
            // 🥷LoginForm
            Form {
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button() {
                    // TODO: Add onClick
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
            // 👨‍💻CreateAccountLink
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
//@ViewBuilder private var 🎩LoginHeader: some View {
//    ZStack {
//        RoundedRectangle(cornerRadius: 0)
//            .foregroundColor(.pink)
//            .rotationEffect(Angle(degrees: 15))
//        VStack {
//            Text("Todo List")
//                .foregroundColor(.white)
//                .font(.title)
//            Text("Get Things Done")
//                .foregroundColor(.white)
//                .font(.title2)
//        }
//    }
//    .frame(width: 100, height: 300)
//}
//
//@ViewBuilder private var 👨‍💻CreateAccountLink: some View {
//    VStack {
//        Text("New around here?")
//        NavigationLink("Create An Account",
//            destination: RegisterView())
//        .foregroundColor(.blue)
//    }
//    .padding(.bottom, 50)
//    Spacer()
//
//}

// -------------------------------
// MARK: 🎥 Preview 🎥
// -------------------------------
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

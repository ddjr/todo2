//
//  👨‍💼ProfileView.swift
//  todo2
//
//  Created by David Daly on 7/18/23.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth


class ProfileViewModel: ObservableObject {
    @Published var user: User? = nil
    
    init() {}
    
    func getUser() {
        guard let userId = Auth.auth().currentUser?.uid
        else { return }
        
        let firebaseDatabase = Firestore.firestore()
        firebaseDatabase.collection("users")
            .document(userId)
            .getDocument { [weak self] snapshot, error in
                guard let data = snapshot?.data(), error == nil
                else { return }
                
                DispatchQueue.main.async {
                    self?.user = User(
                        id: data["id"] as? String ?? "",
                        name: data["name"] as? String ?? "",
                        email: data["email"] as? String ?? "",
                        joined: data["joined"] as? TimeInterval ?? 0
                    )
                }
            }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profileInfo(name: user.name, email: user.email, joined: user.joined)
                } else {
                    Text("Loading Profile...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.getUser()
        }
    }
    
    @ViewBuilder func profileInfo(name: String, email: String, joined: TimeInterval) -> some View {
        Spacer()
        // 👨‍💼 Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width: 125, height: 125)
        Spacer()
        VStack(alignment: .leading) {
            // 📰 User information
            Text("Name: \(name)")
                .font(.title2)
            Text("Email: \(email)")
                .font(.title2)
            Text("Date Joined: \(Date(timeIntervalSince1970: joined).formatted(date: .abbreviated, time: .shortened))")
                .font(.title2)
        }
        // 👇 Sign out button
        Button() {
            // onClick
            viewModel.logout()
        } label: {
            Text("Logout")
        }
        .tint(.red)
        .padding()
        Spacer()
        Spacer()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

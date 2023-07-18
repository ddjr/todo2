//
//  📝NewTodoView.swift
//  todo2
//
//  Created by David Daly on 7/18/23.
//

import SwiftUI
// -------------------------------
// MARK: ⚙️ LOGIC
// -------------------------------
class NewTodoViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var errorMessage = ""
    @Published var ShowErrorAlert = false

    init() {}

    // -------------------------------
    // 🛟 Save new todo item
    func save() {
    }

    // -------------------------------
    // 🕵️‍♂️ Validate new todo item form
    func formFieldsAreValidate() -> Bool {
        // 🔁 Reset error message
        errorMessage = ""
        
        // 🕵️‍♂️ Validate title
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            errorMessage = "Please fill out title"
            ShowErrorAlert = true
            return false
        }
        
        // 🕵️‍♂️ Validate dueDate
        let secondsPerDay = 86400.0
        guard dueDate >= Date().addingTimeInterval(-secondsPerDay)
        else {
            errorMessage = "Please select a date in the future"
            ShowErrorAlert = true
            return false
        }
        
        // 💃 Everthing checks out
        return true
    }
    
}

// -------------------------------
// MARK: 👀 VIEW
// -------------------------------
struct NewTodoView: View {
    @StateObject var viewModel = NewTodoViewModel()
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.title)
                .bold()
                .padding()
            
            // 📝 New Item Form
            Form {
                // 📰 Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                // 📆 Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                // 🛟 Save Button
                Button() {
                    // 👇 onClick
                    if !viewModel.formFieldsAreValidate() { return }
                    viewModel.save()
                    isPresented = false
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.pink)
                            .padding(.horizontal)
                        Text("Save")
                            .foregroundColor(.white)
                    }
                }
                .padding(.vertical)
            }
            .alert(isPresented: $viewModel.ShowErrorAlert) {
                Alert(title: Text("Error"), message: Text(viewModel.errorMessage))
            }
        }
    }
}

// -------------------------------
// MARK: 🎥 PREVIEW
// -------------------------------
struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoView(isPresented: .constant(true))
    }
}

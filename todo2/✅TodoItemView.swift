//
//  ✅TodoItemView.swift
//  todo2
//
//  Created by David Daly on 7/18/23.
//

import SwiftUI

struct TodoItemView: View {
    let title: String
    let date: TimeInterval
    
    var body: some View {
        HStack {
            VStack {
                Text(title)
                Text("\(date)")
            }
            Spacer()
            Button() {
                // 👇 onClick
            } label: {
                Text("Add")
            }
        }
        .padding()
    }
}

struct TodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemView(title: "Get Eggs", date: Date().timeIntervalSince1970)
    }
}

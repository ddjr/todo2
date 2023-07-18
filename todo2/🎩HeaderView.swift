//
//  🎩HeaderView.swift
//  todo2
//
//  Created by David Daly on 7/17/23.
//

import SwiftUI

// -------------------------------
// MARK: 👀 VIEW
// -------------------------------
struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let backgroundColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(backgroundColor)
                .rotationEffect(Angle(degrees: angle))
            VStack {
                Text(title)
                    .foregroundColor(.white)
                    .font(.title)
                Text(subtitle)
                    .foregroundColor(.white)
                    .font(.title2)
            }
        }
        .frame(width: 600, height: 370)
        .offset(y: -150)
    }
}

// -------------------------------
// MARK: 🎥 PREVIEW
// -------------------------------
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Todo list", subtitle: "Get Things Done", angle: -15.0, backgroundColor: .pink)
    }
}

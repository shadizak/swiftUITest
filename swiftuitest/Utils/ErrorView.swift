//
//  ErrorView.swift
//  swiftuitest
//
//  Created by shadi zaqout on 07/10/2024.
//

import SwiftUI

struct ErrorView: View {
    let message: String
    let retryAction: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            Text("😕")
                .font(.system(size: 50))
            Text(message)
                .multilineTextAlignment(.center)
            Button(action: retryAction) {
                Text("Try Again")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

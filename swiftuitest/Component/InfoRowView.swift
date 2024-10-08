//
//  InfoRowView.swift
//  swiftuitest
//
//  Created by shadi zaqout on 07/10/2024.
//

import SwiftUI

struct InfoRowView: View {
    var icon: String
    var title: String
    var value: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.blue)
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.caption)
                    .foregroundColor(.gray)
                Text(value)
                    .font(.body)
                    .fontWeight(.medium)
            }
            Spacer()
        }
        .padding(.vertical, 8)
    }
}
 

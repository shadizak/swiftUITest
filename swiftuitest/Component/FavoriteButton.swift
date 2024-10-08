//
//  FavoriteButton.swift
//  swiftuitest
//
//  Created by shadi zaqout on 08/10/2024.
//

import Foundation
import SwiftUI

struct FavoriteButton: View {
    @State private var isFavorited = false
    
    var body: some View {
        Button(action: {
       
            isFavorited.toggle()
        }) {
            HStack {
           
                Image(systemName: isFavorited ? imageHeartFill : imageHeart)
                    .foregroundColor(isFavorited ? .red : .gray)
                Text(isFavorited ? " Unfavourite" : "Add to Favorite")
                    .foregroundColor(.primary)
            }
            .padding()
            .background(Color(.systemGray5))
            .cornerRadius(10)
        }
    }
}

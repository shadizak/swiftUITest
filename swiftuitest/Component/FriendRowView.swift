//
//  FriendRowView.swift
//  swiftuitest
//
//  Created by shadi zaqout on 07/10/2024.
//

import SwiftUI

struct FriendRowView: View {
    let friend: FrendsModelElement
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            HStack(spacing: 12) {
                Image(systemName: imagePerson)
                    .foregroundColor(.blue)
                
                VStack(alignment: .leading, spacing: 6.0) {
                    Text(friend.name ?? emptyString)
                        .font(.headline)
                    
                    Text(friend.email ?? emptyString)
                        .font(.system(size: 20))
                        .fontWeight(.regular)
                        .foregroundColor(.gray)
                    
                    Text(friend.phone ?? emptyString)
                        .font(.system(size: 20))
                        .fontWeight(.regular)
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
            .padding(.vertical, 5)
            
            FavoriteIcon(isFavorite: friend.isFavorite ?? false)
        }
    }
}



//
//  FavoriteIcon.swift
//  swiftuitest
//
//  Created by shadi zaqout on 07/10/2024.
//

import SwiftUI

struct FavoriteIcon: View {
   let isFavorite: Bool
   
   var body: some View {
       Image(systemName: isFavorite ? "heart.fill" : "heart")
           .foregroundColor(isFavorite ? .red : .gray)
           .font(.system(size: 20))
           .padding([.trailing, .bottom], 8)
   }
}

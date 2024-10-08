//
//  FriendsDetails.swift
//  swiftuitest
//
//  Created by shadi zaqout on 07/10/2024.
//

import SwiftUI

import SwiftUI

struct FriendDetailsView: View {
    @ObservedObject var viewModel: FriendDetailsViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                
                InfoRowView(icon: "phone.fill", title: "Phone", value: viewModel.friend.phone ?? emptyString)
                
                InfoRowView(icon: "envelope.fill", title: "Email", value: viewModel.friend.email ?? emptyString)
                
                GroupBox(label: Text("Address").font(.headline)) {
                    VStack(alignment: .leading, spacing: 10) {
                        InfoRowView(icon: "map.fill", title: "Street", value: viewModel.friend.address?.street ?? emptyString)
                        InfoRowView(icon: "location.fill", title: "City", value: viewModel.friend.address?.city ?? emptyString)
                        InfoRowView(icon: "location.circle.fill", title: "Zip Code", value: viewModel.friend.address?.zipcode ?? emptyString)
                    }
                    .padding()
                }
                
                GroupBox(label: Text("Company").font(.headline)) {
                    VStack(alignment: .leading, spacing: 10) {
                        InfoRowView(icon: "building.2.fill", title: "Company", value: viewModel.friend.company?.name ?? emptyString)
                        InfoRowView(icon: "text.quote", title: "Catch Phrase", value: viewModel.friend.company?.catchPhrase ?? emptyString)
                    }
                    .padding()
                }
            }
            .padding()
            
           
            Button(action: {
                viewModel.toggleFavorite()
            }) {
                Text(viewModel.friend.isFavorite ?? false ? "Remove from Favorites" : "Add to Favorites")
                    .padding()
                    .background(viewModel.friend.isFavorite ?? false ? Color.red : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle(viewModel.friend.name ?? "Friend Details")
    }
}


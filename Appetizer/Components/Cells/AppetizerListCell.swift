//
//  AppetizerListCell.swift
//  Appetizer
//
//  Created by Mohit Tomer on 22/12/23.
//

import SwiftUI

struct AppetizerListCell: View {
    
    let appetizer: Appetizer
    @Binding var showFavoritesOnly: Bool
    
    var body: some View {
        HStack {
            // Image("asian-flank-steak")
            AppetizerRemoteImage(urlString: appetizer.imageURL)
            //   AsyncImage(url: URL(string: appetizer.imageURL))
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .clipShape(.rect(cornerRadius: 8))
            
            
            //            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
            //                image
            //                    .resizable()
            //                    .aspectRatio(contentMode: .fit)
            //                    .frame(width: 120, height: 90)
            //                    .cornerRadius(8)
            //            } placeholder: {
            //                Image("food-placeholder")
            //                    .resizable()
            //                    .aspectRatio(contentMode: .fit)
            //                    .frame(width: 120, height: 90)
            //                    .cornerRadius(8)
            //            }
            
            
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
            Spacer()
            Image(systemName: showFavoritesOnly ? "heart.fill" : "" )
                .padding(.top, 45)
                .foregroundStyle(.red)
            
        }
        //.background(.green)
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizer, showFavoritesOnly: .constant(true))
}

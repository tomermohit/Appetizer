//
//  EmptyState.swift
//  Appetizer
//
//  Created by Mohit Tomer on 26/12/23.
//

import SwiftUI

struct EmptyState: View {
    
    let image: String
    let message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }.offset(y: -50)
        }
    }
}

#Preview {
    EmptyState(image: "empty-order", message: "This is our test message.\nI'm making it a little long for testing.")
}

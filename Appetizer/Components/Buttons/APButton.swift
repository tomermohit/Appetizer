//
//  APButton.swift
//  Appetizer
//
//  Created by Mohit Tomer on 24/12/23.
//

import SwiftUI

struct APButton: View {
    
    var title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundStyle(.white)
            .background(.brandPrimary.gradient)
            .clipShape(.rect(cornerRadius: 8))
    }
}

#Preview {
    APButton(title: "Test title")
}

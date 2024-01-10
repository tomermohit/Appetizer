//
//  XDismissButton.swift
//  Appetizer
//
//  Created by Mohit Tomer on 24/12/23.
//

import SwiftUI

struct OverLayButton: View {
    
    var name: String
    var backgroundColor: Color
    var foregroundColor: Color
    var imageScale: Image.Scale
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundStyle(backgroundColor)
                .opacity(0.6)
            Image(systemName: name)
                .frame(width: 40, height: 40)
                .imageScale(imageScale)
                .foregroundStyle(foregroundColor)
        }
    }
}

#Preview {
    OverLayButton(name: "xmark", backgroundColor: .white, foregroundColor: .black, imageScale: .small)
}

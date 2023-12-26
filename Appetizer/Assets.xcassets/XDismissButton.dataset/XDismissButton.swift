//
//  XDismissButton.swift
//  Appetizer
//
//  Created by Mohit Tomer on 24/12/23.
//

import SwiftUI

struct XDismissButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundStyle(.white)
                .opacity(0.6)
            Image(systemName: "xmark")
                .frame(width: 40, height: 40)
                .imageScale(.small)
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    XDismissButton()
}

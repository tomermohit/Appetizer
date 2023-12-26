//
//  OrderView.swift
//  Appetizer
//
//  Created by Mohit Tomer on 22/12/23.
//

import SwiftUI

struct OrderView: View {
    var line: some View {
        VStack { Divider().background(.gray) }.padding()
        }
    var body: some View {
        NavigationStack {
            Text("Order View")
            HStack {
                        line
                Text("or").foregroundStyle(.gray)
                        line
                    }
                .navigationTitle("🧾 Order")
        }
    }
}

#Preview {
    OrderView()
}

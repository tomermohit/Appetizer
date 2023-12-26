//
//  AppetizerTabView.swift
//  Appetizer
//
//  Created by Mohit Tomer on 20/12/23.
//

import SwiftUI

struct AppetizerTabView: View {
    
    @EnvironmentObject private var order: Order
    
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem { Label("Home", systemImage: "house") }
            AccountView()
                .tabItem { Label("Account", systemImage: "person") }
            OrderView()
                .tabItem { Label("Order", systemImage: "bag") }
                .badge(order.items.count)
        }
       // .tint(Color.brandPrimary)
//        .onAppear() {
//            UITabBar.appearance().backgroundColor = UIColor(Color("tabBarBG"))
//        }
    }
}

#Preview {
    AppetizerTabView()
}

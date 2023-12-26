//
//  AppetizerTabView.swift
//  Appetizer
//
//  Created by Mohit Tomer on 20/12/23.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
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

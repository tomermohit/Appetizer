//
//  AppetizerApp.swift
//  Appetizer
//
//  Created by Mohit Tomer on 20/12/23.
//

import SwiftUI

@main
struct AppetizerApp: App {
    
    let order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView()
                .environmentObject(order)
        }
    }
}

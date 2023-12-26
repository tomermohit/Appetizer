//
//  Order.swift
//  Appetizer
//
//  Created by Mohit Tomer on 26/12/23.
//


import SwiftUI

final class Order: ObservableObject {
    
    @Published var items: [Appetizer] = []
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func deleteItems(at offSets: IndexSet) {
        items.remove(atOffsets: offSets)
    }
    
    var totelPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
}


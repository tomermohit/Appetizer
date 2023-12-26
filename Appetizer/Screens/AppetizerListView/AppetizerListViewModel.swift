//
//  AppetizerListViewModel.swift
//  Appetizer
//
//  Created by Mohit Tomer on 23/12/23.
//

import Foundation

final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var selectedAppetizer: Appetizer?
    @Published var isLoading = false
    @Published var isShowingDetsil = false
    
    func getAppetizers() {
        isLoading = true
        NetworkManager.shared.getAppetizer { result in
            DispatchQueue.main.async { [self] in
                isLoading = false
            switch result {
            case .success(let appetizers):
                self.appetizers = appetizers
            case .failure(let error):
                switch error {
                case .invalidURL:
                    alertItem = AlertContext.invalidURL
                case .invalidResponse:
                    alertItem = AlertContext.invalidResponse
                case .invalidData:
                    alertItem = AlertContext.invalidData
                case .unableToComplete:
                    alertItem = AlertContext.unableToComplete
                }
            }
        }
        }
        
    }
    
}
//
//  AppetizerListViewModel.swift
//  Appetizer
//
//  Created by Mohit Tomer on 23/12/23.
//

import Foundation

@MainActor final class AppetizerListViewModel: ObservableObject {
    
    @Published var searchedText: String = ""
    @Published var alertItem: AlertItem?
    @Published var selectedAppetizer: Appetizer?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var showFavoritesOnly = false
    
    private var appetizers: [Appetizer] = []
    
    var searchAppetizer: [Appetizer] {
        searchedText.isEmpty ? appetizers : appetizers.filter{$0.name.contains(searchedText)}
    }
    
    
    //    func getAppetizers() {
    //        isLoading = true
    //        NetworkManager.shared.getAppetizer { result in
    //            DispatchQueue.main.async { [self] in
    //                isLoading = false
    //            switch result {
    //            case .success(let appetizers):
    //                self.appetizers = appetizers
    //            case .failure(let error):
    //                switch error {
    //                case .invalidURL:
    //                    alertItem = AlertContext.invalidURL
    //                case .invalidResponse:
    //                    alertItem = AlertContext.invalidResponse
    //                case .invalidData:
    //                    alertItem = AlertContext.invalidData
    //                case .unableToComplete:
    //                    alertItem = AlertContext.unableToComplete
    //                }
    //            }
    //        }
    //        }
    //        
    //    }
    
    func getAppetizers() {
        isLoading = true
        
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                if let apError = error as? APError {
                    switch apError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem = AlertContext.invalidResponse
                }
                isLoading = false
            }
        }
    }
    
}

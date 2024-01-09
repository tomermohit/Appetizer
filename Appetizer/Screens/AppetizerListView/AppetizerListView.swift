//
//  AppetizerListView.swift
//  Appetizer
//
//  Created by Mohit Tomer on 22/12/23.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject private var viewModel = AppetizerListViewModel()
    
    var body: some View {
        ZStack {
            NavigationStack {
                List(viewModel.searchAppetizer) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetail = true
                        }
                }
                .searchable(text: $viewModel.searchedText)
                .disabled(viewModel.isShowingDetail)
                .navigationTitle("🍿Appetizer")
                .listStyle(.plain)
            }
            .task {
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            if viewModel.isShowingDetail {
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer ?? MockData.sampleAppetizer, isShowingDetail: $viewModel.isShowingDetail)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
            
            if (viewModel.isLoading == false) && viewModel.searchAppetizer.isEmpty {
                APLottieView(lottieJsonFileName: "NoItemFound.json", loopMode: .loop)
                    .aspectRatio(contentMode: .fit)
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AppetizerListView()
}

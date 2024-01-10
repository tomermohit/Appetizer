//
//  AppetizerDetailView.swift
//  Appetizer
//
//  Created by Mohit Tomer on 24/12/23.
//

import SwiftUI

struct AppetizerDetailView: View {
    

    @EnvironmentObject private var order: Order
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    @State private var isFavorite = false
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 225)
                .overlay(Button {
                    isFavorite.toggle()
                }label: {
                    isFavorite ? OverLayButton(name: "heart.fill", backgroundColor: .white, foregroundColor: .red, imageScale: .medium) : OverLayButton(name: "heart", backgroundColor: .white, foregroundColor: .red, imageScale: .medium)
                }, alignment: .bottomTrailing)
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
                
                HStack(spacing: 50) {
                    NutritionInfo(title: "Calories", value: appetizer.calories)
                    NutritionInfo(title: "Carbs", value: appetizer.carbs)
                    NutritionInfo(title: "Protein", value: appetizer.protein)
                }
            }
            
            Spacer()
            
            Button {
                order.add(appetizer)
                isShowingDetail = false
            }label: {
                // APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add to Order")
                Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
            }
            .modifier(StandardButtonStyle())
//            .standardButtonStyle()
//            .buttonStyle(.bordered)
//            .tint(.brandPrimary)
//            .controlSize(.large)
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .clipShape(.rect(cornerRadius: 8))
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false
        }label: {
            OverLayButton(name: "xmark", backgroundColor: .white, foregroundColor: .black, imageScale: .small)
        }, alignment: .topTrailing)
        
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(true))
}

struct NutritionInfo: View {
    
    var title: String
    var value: Int
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            
            Text("\(value)")
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

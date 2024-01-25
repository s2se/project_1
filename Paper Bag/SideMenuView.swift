//
//  SideMenuView.swift
//  Paper Bag
//
//  Created by Christian Mejillano on 25/1/2024.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isMenuOpen: Bool
    
    var body: some View {
        // Side menu with scrollable content
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center) {
                // Close Button
                Button(action: {
                    withAnimation {
                        self.isMenuOpen = false
                    }
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Close")
                            .fontWeight(.bold)
                    }
                    .foregroundColor(.black)
                    .padding()
                }
                
                // Menu Items
                    NavigationLink(destination: {
                        HomeView()
                    }) {
                        Text("Home")
                            .padding()
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .padding(.top, 5)
                
                    NavigationLink(destination: {
                        DetailedStockView()
                    }) {
                        Text("Pantry Stock")
                            .padding()
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .padding(.top, 5)
                Spacer()
            }
            .padding(.top, 20) // Add some padding at the top if needed
        }
        .frame(width: .infinity)
        .transition(.move(edge: .leading)) // Slide in animation
        .zIndex(1) // Ensure the menu is above other content
        .background(Color.clear) // Clear background to allow the blurred content to be seen
    }
}




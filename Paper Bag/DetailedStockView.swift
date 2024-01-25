//
//  DetailedStockView.swift
//  Paper Bag
//
//  Created by Christian Mejillano on 25/1/2024.
//

import SwiftUI

struct DetailedStockView: View {
    @State private var isMenuOpen = false
    var body: some View {
        ZStack{
            ScrollView{
                VStack {
                    HStack {
                        Button(action: {
                            withAnimation {
                                self.isMenuOpen.toggle() // Toggles the menu visibility with animation
                            }
                        }) {
                            Image(systemName: "line.horizontal.3") // Hamburger menu icon
                                .imageScale(.large)
                                .foregroundColor(.black)
                        }
                        Text("Pantry Stock")
                            .font(.title2)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .blur(radius: isMenuOpen ? 10 : 0) // Blur the main content when the menu is open
                    
                    // Side menu
                    if isMenuOpen {
                        SideMenuView(isMenuOpen: $isMenuOpen)
                            .frame(width: .infinity)
                            .transition(.move(edge: .leading)) // Slide in animation
                            .zIndex(2) // Ensure the menu is above other content
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct DetailedStockView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedStockView()
    }
}

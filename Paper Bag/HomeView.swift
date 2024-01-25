//
//  HomeView.swift
//  Paper Bag
//
//  Created by Christian Mejillano on 23/1/2024.
//

import SwiftUI

struct HomeView: View {
    let customGrey = Color(
        red: 0xD9 / 255.0,
        green: 0xD9 / 255.0,
        blue: 0xD9 / 255.0
    )
    
    @State private var isMenuOpen = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .leading) {
                ScrollView {
                    VStack {
                        // Header
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
                            
                            Text("Good Evening! Let's Eat")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(Color.black)
                            Spacer()
                            Image(systemName: "magnifyingglass")
                            .foregroundColor(Color.black)
                        }
                        .padding()
                        
                        // Your Pantry Section with Background and Shadow
                        VStack(alignment: .leading) {
                            Text("Your Pantry")
                                .font(.headline)
                                .padding(.bottom, 2)
                                .foregroundColor(Color.black)
                            ProgressBarView(value: 0.7, color: .green, label: "Vegetables")
                            ProgressBarView(value: 0.5, color: .yellow, label: "Fruits")
                            ProgressBarView(value: 0.3, color: .purple, label: "Grains")
                            ProgressBarView(value: 0.6, color: .red, label: "Proteins")
                            ProgressBarView(value: 0.4, color: .blue, label: "Dairy")
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(customGrey))
                        .padding([.horizontal, .top])
                        
                        // Recipes Section with Background and Shadow
                        VStack(alignment: .leading) {
                            Text("Recipes For You")
                                .font(.headline)
                                .padding(.bottom, 2)
                                .foregroundColor(Color.black)
                            Image("recipeImage")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipped()
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(customGrey))
                        .padding([.horizontal, .bottom])
                        
                        // Update Stock Button
                        Button(action: {
                            // Action to update stock
                        }) {
                            Text("Update Stock")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .padding()
                                .background(Color.gray)
                                .foregroundColor(Color.black)
                                .font(.headline)
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                    }
                    .navigationBarHidden(true)
                }
                .blur(radius: isMenuOpen ? 10 : 0) // Blur the main content when the menu is open
                
                // Side menu
                if isMenuOpen {
                    SideMenuView(isMenuOpen: $isMenuOpen)
                        .frame(width: .infinity)
                        .transition(.move(edge: .leading)) // Slide in animation
                        .zIndex(2) // Ensure the menu is above other content
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


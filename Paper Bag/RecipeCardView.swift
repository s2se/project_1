//
//  RecipeCardView.swift
//  Paper Bag
//
//  Created by Christian Mejillano on 23/1/2024.
//

import SwiftUI

struct RecipeCardView: View {
    var recipeImage: Image // This should be a SwiftUI Image

    var body: some View {
        VStack(alignment: .leading) {
            Text("Recipes For You")
                .font(.headline)
            recipeImage
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 2)
        )
    }
}

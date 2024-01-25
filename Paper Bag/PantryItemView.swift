//
//  PantryItemView.swift
//  Paper Bag
//
//  Created by Christian Mejillano on 23/1/2024.
//

import SwiftUI

struct PantryItemView: View {
    var itemName: String
    var itemLevel: CGFloat // This should be a value between 0.0 and 1.0

    var body: some View {
        VStack(alignment: .leading) {
            Text(itemName)
                .font(.headline)
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle().frame(width: geometry.size.width , height: 20)
                        .opacity(0.3)
                        .foregroundColor(Color(UIColor.systemTeal))

                    Rectangle().frame(width: min(CGFloat(self.itemLevel)*geometry.size.width, geometry.size.width), height: 20)
                        .foregroundColor(Color(UIColor.systemBlue))
                }.cornerRadius(45.0)
            }
        }
    }
}

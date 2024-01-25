//
//  PantryItemDetailView.swift
//  Paper Bag
//
//  Created by Christian Mejillano on 23/1/2024.
//

import SwiftUI

struct PantryItemDetailView: View {
    var pantryItem: PantryItem

    var body: some View {
        VStack {
            Text("Name: \(pantryItem.name)")
            Text("Quantity: \(pantryItem.quantity)")
            Text("Expiration Date: \(formattedDate)")
        }
        .navigationBarTitle("Item Details", displayMode: .inline)
    }

    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter.string(from: pantryItem.expirationDate)
    }
}


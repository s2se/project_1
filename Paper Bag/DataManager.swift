//
//  DataManager.swift
//  Paper Bag
//
//  Created by Christian Mejillano on 23/1/2024.
//

import Foundation

class DataManager: ObservableObject {
    static let shared = DataManager()

    @Published var pantryItems: [PantryItem] = []

    func fetchPantryItems() {
        // Implement your logic to fetch items from a data source
        // For now, using dummy data
        pantryItems = [
            PantryItem(name: "Item 1", quantity: 5, expirationDate: Date()),
            PantryItem(name: "Item 2", quantity: 10, expirationDate: Date())
        ]
    }

    func savePantryItem(_ item: PantryItem) {
        // Implement your logic to save or update items
        pantryItems.append(item)
    }
    
    var groupedPantryItems: [String: [PantryItem]] {
           Dictionary(grouping: pantryItems, by: { $0.name })
    }
}

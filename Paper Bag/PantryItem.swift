//
//  PantryItem.swift
//  Paper Bag
//
//  Created by Christian Mejillano on 23/1/2024.
//

import Foundation

struct PantryItem: Identifiable {
    let id = UUID()
    var name: String
    var level: Double // This represents the current level of the item as a percentage
}

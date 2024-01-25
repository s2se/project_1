//
//  AddEditPantryItemView.swift
//  Paper Bag
//
//  Created by Christian Mejillano on 23/1/2024.
//

import SwiftUI

struct AddEditPantryItemView: View {
    @ObservedObject var dataManager = DataManager.shared
    @State private var itemName = ""
    @State private var quantity = ""
    @State private var expirationDate = Date()
    @State private var isItemSaved = false

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                TextField("Item Name", text: $itemName)
                TextField("Quantity", text: $quantity)
                    .keyboardType(.numberPad)
                DatePicker("Expiration Date", selection: $expirationDate, displayedComponents: .date)

                Button("Save") {
                    saveButtonTapped()
                }
                .alert(isPresented: $isItemSaved) {
                    Alert(title: Text("Item Saved"), dismissButton: .default(Text("OK")))
                }
            }
            .navigationBarTitle("Add Item")
            .navigationBarItems(trailing: Button("Back", action: {
                presentationMode.wrappedValue.dismiss()
            }))
        }
    }

    func saveButtonTapped() {
        guard let quantityInt = Int(quantity) else {
            // Handle invalid quantity
            return
        }

        let newItem = PantryItem(name: itemName, quantity: quantityInt, expirationDate: expirationDate)
        dataManager.savePantryItem(newItem)

        // Show the item saved alert
        isItemSaved = true
    }
}

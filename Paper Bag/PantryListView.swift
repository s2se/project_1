//
//  PantryListView.swift
//  Paper Bag
//
//  Created by Christian Mejillano on 23/1/2024.
//

import SwiftUI

struct PantryListView: View {
    @ObservedObject var dataManager = DataManager.shared
    @State private var showAddItemView = false

    var body: some View {
        NavigationView {
            List {
                ForEach(dataManager.groupedPantryItems.keys.sorted(), id: \.self) { itemName in
                    Section(header: Text(itemName)) {
                        ForEach(dataManager.groupedPantryItems[itemName]!) { item in
                            NavigationLink(destination: PantryItemDetailView(pantryItem: item)) {
                                Text("Quantity: \(item.quantity)")
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Pantry Items")
            .navigationBarItems(trailing:
                Button(action: {
                    showAddItemView.toggle()
                }) {
                    Image(systemName: "plus")
                }
            )
            .onAppear {
                dataManager.fetchPantryItems()
            }
            .sheet(isPresented: $showAddItemView) {
                AddEditPantryItemView()
            }
        }
    }
}

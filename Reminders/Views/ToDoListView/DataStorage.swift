//
//  DataStorage.swift
//  Reminders
//
//  Created by Ali Fayed on 01/06/2021.
//

import SwiftUI

extension ToDoListView {
     func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            do {
                try viewContext.save()
            } catch {

            }
        }
    }
     func addItem(text: String) {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.createdAt = Date()
            newItem.itemName = text
            do {
                if newItem.itemName != nil, newItem.itemName != "" {
                    try viewContext.save()
                }
            } catch {

            }
        }
        self.text = ""
    }
}

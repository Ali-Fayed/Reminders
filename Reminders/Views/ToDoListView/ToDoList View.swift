//
//  ToDoList View.swift
//  Reminders
//
//  Created by Ali Fayed on 01/06/2021.
//

import SwiftUI
import CoreData

struct ToDoListView: View {
    
    @State private var text: String = ""
    @State private var showingAlert = false
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.createdAt, ascending: false)],
        animation: .default)
    private var items: FetchedResults<Item>
    private let dataForamtter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("your items")) {
                    ForEach(items) { toDoListItem in
                        VStack(alignment: .leading) {
                            Text(toDoListItem.itemName!).font(.headline).padding(5).font(.headline)
                            Text("\(toDoListItem.createdAt!, formatter: dataForamtter)").font(.body).foregroundColor(.red)
                        }
                    }.onDelete(perform: deleteItems)
                }
            }.toolbar {
                Button(action: alert) {
                    Label("Add Item", systemImage: "plus")
                }
            }.navigationTitle("To Do List").listStyle(GroupedListStyle())
            

        }
    }
    //
    private func addItem(text: String) {
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
///
    private func alert () {
        let alert = UIAlertController(title: "Add New ToDo item", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Enter your new item..."
        })
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in

            if let name = alert.textFields?.first?.text {
                addItem(text: name)
            }
        }))
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
    }
///
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            do {
                try viewContext.save()
            } catch {

            }
        }
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}

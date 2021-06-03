//
//  ToDoList View.swift
//  Reminders
//
//  Created by Ali Fayed on 01/06/2021.
//

import SwiftUI
import CoreData

struct ToDoListView: View {
    
    @State  var text: String = ""
    @State  var showingAlert = false
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.createdAt, ascending: false)],
        animation: .default)
     var items: FetchedResults<Item>
     let dataForamtter: DateFormatter = {
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
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}


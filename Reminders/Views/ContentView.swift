//
//  ContentView.swift
//  Reminders
//
//  Created by Ali Fayed on 01/06/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
   
    var body: some View {
        TabView {
            ToDoListView().tabItem {
                Image(systemName: "house")
                Text("ToDo")
            }
            RemindersView().tabItem {
                Image(systemName: "pencil")
                Text("Reminders")
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

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
            HomeView().tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            RemindersView().tabItem {
                Image(systemName: "pencil")
                Text("Home")
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

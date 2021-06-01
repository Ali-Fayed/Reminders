//
//  RemindersView.swift
//  Reminders
//
//  Created by Ali Fayed on 01/06/2021.
//

import SwiftUI

struct RemindersView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("your reminders")) {
           
                }
            }.toolbar {
                EditButton()
            }.navigationTitle("Reminders").listStyle(GroupedListStyle())

        }
    }
}
struct RemindersView_Previews: PreviewProvider {
    static var previews: some View {
        RemindersView()
    }
}

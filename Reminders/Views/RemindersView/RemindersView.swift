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
private func alert () {
    let alert = UIAlertController(title: "Add New ToDo item", message: nil, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

    alert.addTextField(configurationHandler: { textField in
        textField.placeholder = "Enter your new item..."
    })
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in

        if let name = alert.textFields?.first?.text {
        }
    }))
    UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
}
struct RemindersView_Previews: PreviewProvider {
    static var previews: some View {
        RemindersView()
    }
}

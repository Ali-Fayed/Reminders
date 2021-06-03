//
//  UIKitViews.swift
//  Reminders
//
//  Created by fixed on 02/06/2021.
//

import SwiftUI

extension ToDoListView {
    func alert () {
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
}

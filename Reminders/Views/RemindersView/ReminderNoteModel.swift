//
//  ReminderNoteModel.swift
//  Reminders
//
//  Created by Macbook on 02/06/2021.
//

import Foundation

struct ReminderNoteModel: Identifiable, Codable {
    var id = UUID()
    var noteTitle: String
    // let noteDescription: String
    var date: Date
    var category: CategoryModel?
}
struct CategoryModel: Identifiable, Codable {
    var id: String {catName ?? ""}
    var catName: String?
    var imageName: String?
}
class ReminderNotesStrore : ObservableObject {
    @Published var notes : [ReminderNoteModel] = []
}
let reminderCategories = [CategoryModel( catName: "Birthday", imageName:"rectangle.stack.person.crop" ),CategoryModel( catName: "Work", imageName: "briefcase.fill") ,CategoryModel( catName: "Event" , imageName:  "person.crop.square.fill.and.at.rectangle"), CategoryModel(catName: "others", imageName: "rectangle.and.pencil.and.ellipsis")]

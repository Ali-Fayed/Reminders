//
//  ReminderNoteRow.swift
//  Reminders
//
//  Created by Macbook on 03/06/2021.
//

import SwiftUI

struct ReminderNoteRow: View {
    let noteModel: ReminderNoteModel
    private let dataForamtter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
    var body: some View {
        HStack {
            Image (systemName: noteModel.category?.imageName
                    ?? "pencil.and.outline")
                .padding(4)
            Text(noteModel.noteTitle)
            Spacer()
            Text("\(noteModel.date, formatter: dataForamtter)")
                .font(.caption)
                .foregroundColor(Color.yellow)
        }
    }
}

struct ReminderNoteRow_Previews: PreviewProvider {
    static var previews: some View {
        ReminderNoteRow(noteModel: ReminderNoteModel(noteTitle: "title", date: Date(), category: CategoryModel(catName: "", imageName: "plus")))
    }
}

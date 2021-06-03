//
//  RemindersView.swift
//  Reminders
//
//  Created by Ali Fayed on 01/06/2021.
//

import SwiftUI
import Combine
struct RemindersView: View {
    @AppStorage("reminderNote", store: UserDefaults(suiteName: "group.com.fixedSolution.Reminders"))
    var noteData: Data = Data()
    @ObservedObject var reminderNotes = ReminderNotesStrore()
    @State var isPlusClicked: Bool = false
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("your reminders")) {
                    ForEach (reminderNotes.notes) { note in
                        ReminderNoteRow(noteModel: note)
                    }
                }
            }.toolbar {
                Button(action: { isPlusClicked = true}
                ,label: {
                    Image(systemName: "plus")
                }).accentColor(.yellow)
                    .popover(isPresented: $isPlusClicked, attachmentAnchor: .point(UnitPoint.bottom), arrowEdge: .top, content: {
                    AddReminder(reminderNotes: reminderNotes)
                })
            }.navigationTitle("Reminders").listStyle(InsetGroupedListStyle()
            )
        }
    }
}
struct RemindersView_Previews: PreviewProvider {
    static var previews: some View {
        RemindersView()
    }
}

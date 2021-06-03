//
//  AddReminder.swift
//  Reminders
//
//  Created by Macbook on 02/06/2021.
//

import SwiftUI

struct AddReminder: View {
    @AppStorage("reminderNote", store: UserDefaults(suiteName: "group.com.fixedSolution.Reminders"))
    var noteData: Data = Data()
    @Environment(\.presentationMode) var presentationMode
    
    @State var noteText: String = ""
    @State var noteDate: Date = Date()
    @State var categorySelected: CategoryModel = CategoryModel()
    let reminderNotes: ReminderNotesStrore
    var body: some View {
        VStack {
            Section(header: Text("Categories")) {
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(reminderCategories, id:\.id){ cat in
                            CategoryCard(cat: cat)
                                .onTapGesture {
                                    categorySelected = cat
                                }
                            Spacer()
                        }
                    }
                }.frame(height: 100, alignment: .center)
            }
            TextField("a small thing todo...", text: $noteText)
                .padding()
                .border(Color.yellow)
            DatePicker(selection: $noteDate) {
                           Text("date to remind you").bold()
                       }.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .accentColor(.yellow)
            Button("save", action: {
                presentationMode.wrappedValue.dismiss()
            }).foregroundColor(.white)
            .frame(width: 200, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .padding(4)
            .font(.title)
            .background(noteText.isEmpty ? Color.gray : Color.yellow)
            .cornerRadius(10, antialiased: false)
            Spacer()
        }.padding(20)
        .onDisappear() {
            reminderNotes.notes.append(ReminderNoteModel( noteTitle: noteText, date: noteDate, category: categorySelected))
        }
    }
//    func saveNote(note: ReminderNoteModel)  {
//        guard let noteEncoded = try? JSONEncoder().encode(note) else {return}
//        noteData = noteEncoded
//    }
}

struct AddReminder_Previews: PreviewProvider {
    static var previews: some View {
        AddReminder(reminderNotes: ReminderNotesStrore())
    }
}

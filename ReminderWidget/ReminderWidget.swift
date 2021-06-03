//
//  ReminderWidget.swift
//  ReminderWidget
//
//  Created by Macbook on 03/06/2021.
//

import WidgetKit
import SwiftUI

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ReminderNoteModel
}
struct Provider: TimelineProvider {
    @AppStorage("reminderNote", store: UserDefaults(suiteName: "group.com.fixedSolution.Reminders"))
    var noteData: Data = Data()
    
    func placeholder(in context: Context) -> SimpleEntry {
        let note = try? JSONDecoder().decode(ReminderNoteModel.self, from: noteData)
        return SimpleEntry(date: Date(), configuration: note ?? ReminderNoteModel(noteTitle: "no data", date: Date()))
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        guard let note = try? JSONDecoder().decode(ReminderNoteModel.self, from: noteData) else {return}
        let entry = SimpleEntry(date: Date(), configuration: note)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) {
        guard let note = try? JSONDecoder().decode(ReminderNoteModel.self, from: noteData) else {return}
        var entries: [SimpleEntry] = []
        let entry = SimpleEntry(date: Date(), configuration: note)
        entries.append(entry)
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}



struct ReminderWidgetEntryView : View {
    var entry: Provider.Entry
    var body: some View {
        Text(entry.configuration.noteTitle)
            .font(.headline)
            .foregroundColor(.black)
    }
}

@main
struct ReminderWidget: Widget {
    let kind: String = "ReminderWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration (kind: kind, provider: Provider(), content: { entry in
            ReminderWidgetEntryView(entry: entry)
        })
        //        .configurationDisplayName("My Widget")
        //        .description("This is an example widget.")
    }
}

struct ReminderWidget_Previews: PreviewProvider {
    static var previews: some View {
        ReminderWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ReminderNoteModel(noteTitle: "", date: Date())
        ))
        .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

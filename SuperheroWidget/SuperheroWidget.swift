//
//  SuperheroWidget.swift
//  SuperheroWidget
//
//  Created by Tatiana Bondarenko on 3/2/23.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    @AppStorage("hero", store: UserDefaults(suiteName: "group.com.tanyaBond.HeroWidget"))
    var heroData: Data = Data()

    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), hero: Hero(image: "1", name: "test", realName: "test"))
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        if let hero = try? JSONDecoder().decode(Hero.self, from: heroData) {
            let entry = SimpleEntry(date: Date(), configuration: configuration, hero: hero)
            completion(entry)
        }
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        if let hero = try? JSONDecoder().decode(Hero.self, from: heroData) {
            let entry = SimpleEntry(date: Date(), configuration: configuration, hero: hero)
            let timeline = Timeline(entries: [entry], policy: .never)
            completion(timeline)
        }
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let hero: Hero
}

struct SuperheroWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        CircularImageView(image: Image(entry.hero.image))
    }
}

struct SuperheroWidget: Widget {
    let kind: String = "SuperheroWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            SuperheroWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Widget hero")
        .description("Hero Widget")
    }
}

struct SuperheroWidget_Previews: PreviewProvider {
    static var previews: some View {
        SuperheroWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), hero: Hero(image: "1", name: "test", realName: "test")))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

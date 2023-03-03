//
//  MainView.swift
//  HeroWidget
//
//  Created by Tatiana Bondarenko on 3/2/23.
//

import SwiftUI
import WidgetKit

let array = [superman, batman, green, superwoman]

struct MainView: View {

    @AppStorage("hero", store: UserDefaults(suiteName: "group.com.tanyaBond.HeroWidget"))
    var heroData: Data = Data()

    var body: some View {
        VStack {
            ForEach(array) { hero in
                HeroView(hero: hero)
                    .onTapGesture {
                        saveToDefaults(hero: hero)
                    }
            }
        }
    }

    func saveToDefaults(hero: Hero) {
        if let heroDataToSave = try? JSONEncoder().encode(hero) {
            heroData = heroDataToSave
            print(hero.name)
            WidgetCenter.shared.reloadTimelines(ofKind: "SuperheroWidget")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

//
//  ContentView.swift
//  HeroWidget
//
//  Created by Tatiana Bondarenko on 3/2/23.
//

import SwiftUI

struct HeroView: View {
    let hero: Hero

    var body: some View {
        HStack {
            CircularImageView(image: Image(hero.image))
                .frame(width: 100, height: 100, alignment: .center)
                .padding()
            Spacer()
            VStack {
                Text(hero.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.purple)
                Text(hero.realName)
                    .fontWeight(.bold)
            }
            Spacer()
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width, alignment: .center)
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView(hero: batman)
    }
}

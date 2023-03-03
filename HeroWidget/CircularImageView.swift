//
//  CircularImageView.swift
//  HeroWidget
//
//  Created by Tatiana Bondarenko on 3/2/23.
//

import SwiftUI

struct CircularImageView: View {
    var image: Image
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.purple, lineWidth: 5))
            .shadow(radius: 15)
    }
}

struct CircularImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularImageView(image: Image("1"))
    }
}

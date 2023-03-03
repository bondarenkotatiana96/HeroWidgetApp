//
//  SuperheroWidgetBundle.swift
//  SuperheroWidget
//
//  Created by Tatiana Bondarenko on 3/2/23.
//

import WidgetKit
import SwiftUI

@main
struct SuperheroWidgetBundle: WidgetBundle {
    var body: some Widget {
        SuperheroWidget()
        SuperheroWidgetLiveActivity()
    }
}

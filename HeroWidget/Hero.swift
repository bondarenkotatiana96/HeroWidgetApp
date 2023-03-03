//
//  Hero.swift
//  HeroWidget
//
//  Created by Tatiana Bondarenko on 3/2/23.
//

import Foundation

struct Hero: Identifiable, Codable {
    var id : String {image}
    let image: String
    let name: String
    let realName: String
}

let superman = Hero(image: "1", name: "Superman", realName: "Peter Parker")
let green = Hero(image: "2", name: "Green", realName: "Peter Parker2")
let batman = Hero(image: "3", name: "Batman", realName: "Peter Parker3")
let superwoman = Hero(image: "4", name: "Superwoman", realName: "Tanya Bond")

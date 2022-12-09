//
//  MainViewModel.swift
//  GeorgianMemenator
//
//  Created by Shalva Avanashvili on 12.01.2021.
//  Copyright © 2021 Shalva Avanashvili. All rights reserved.
//

import SwiftUI
import Foundation

class MainViewModel: ObservableObject {
    @Published private(set) var currentMemeName: String!
    
    let categories = [
        MemeCategory(title: "Reddit", icon: Image("reddit")),
        MemeCategory(title: "Create", icon: Image("add")),
        MemeCategory(title: "Cat status codes", icon: Image("cat")),
        MemeCategory(title: "Girchi", icon: Image("cone")),
        MemeCategory(title: "9GAG", icon: Image("9gag")),
        MemeCategory(title: "References", icon: Image("hand")),
        MemeCategory(title: "Submit feedback", icon: Image("feedback")),
    ]
    
    init() {
        generateRandomMeme()
    }
    
    func generateRandomMeme() {
        let randomNumber = Int.random(in: 1...18)
        currentMemeName = "memenator_\(randomNumber)"
    }
}

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
        MemeCategory(title: "References", icon: Image("hand")),
        MemeCategory(title: "Cat tags list", icon: Image("cat2"))
    ]
    
    init() {
        generateRandomMeme()
    }
    
    func generateRandomMeme() {
        let randomNumber = Int.random(in: 1...18)
        currentMemeName = "memenator_\(randomNumber)"
    }
}

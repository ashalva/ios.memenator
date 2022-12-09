//
//  GirchiViewModel.swift
//  GeorgianMemenator
//
//  Created by Shalva Avanashvili on 14.01.2021.
//  Copyright © 2021 Shalva Avanashvili. All rights reserved.
//

import Foundation

class GirchiViewModel: ObservableObject {
    @Published private(set) var currentMemeName: String!
    
    init() {
        generateRandomMeme()
    }
    
    func generateRandomMeme() {
        let randomNumber = Int.random(in: 1...26)
        currentMemeName = "memenator_\(randomNumber)"
    }
}

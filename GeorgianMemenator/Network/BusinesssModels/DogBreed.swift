//
//  DogBreed.swift
//  GeorgianMemenator
//
//  Created by Qeti Avanashvili on 31.01.23.
//  Copyright © 2023 Shalva Avanashvili. All rights reserved.
//

import Foundation

struct DogBreed: Identifiable {
    let id: String
    let name: String
    let description: String
    let minLife: Int
    let maxLife: Int
    let maleMinWeight: Int
    let maleMaxWeight: Int
    let femaleMinWeight: Int
    let femaleMaxWeight: Int
}

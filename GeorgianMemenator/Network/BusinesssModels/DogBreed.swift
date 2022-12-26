//
//  DogBreed.swift
//  GeorgianMemenator
//
//  Created by Qeti Avanashvili on 31.01.23.
//  Copyright © 2023 Shalva Avanashvili. All rights reserved.
//

import Foundation

struct DogBreed: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let minAge: Int
    let maxAge: Int
}

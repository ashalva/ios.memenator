//
//  DogBreedsListViewModel.swift
//  GeorgianMemenator
//
//  Created by Qeti Avanashvili on 08.01.23.
//  Copyright © 2023 Shalva Avanashvili. All rights reserved.
//

import SwiftUI
import Foundation

class DogBreedsListViewModel: ObservableObject {
    @Published var dogBreeds = [
        DogBreed(name: "nagazi",description: "a",minLife: 4, maxLife: 10,maleMinWeight: 12,maleMaxWeight: 14,femaleMinWeight: 23,femaleMaxWeight: 26),
                 
        DogBreed(name: "bulldog",description: "b",minLife: 4, maxLife: 10,maleMinWeight: 12,maleMaxWeight: 14,femaleMinWeight: 23,femaleMaxWeight: 26),
        DogBreed(name: "labrador",description: "c",minLife: 4, maxLife: 10,maleMinWeight: 12,maleMaxWeight: 14,femaleMinWeight: 23,femaleMaxWeight: 26)
    ]
}

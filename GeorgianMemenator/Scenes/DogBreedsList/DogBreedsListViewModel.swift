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
        DogBreed(name: "poodel"),
        DogBreed(name: "bulldog"),
        DogBreed(name: "labrador")
    ]
    }

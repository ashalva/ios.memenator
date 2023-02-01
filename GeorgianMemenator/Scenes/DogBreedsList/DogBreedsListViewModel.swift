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
        DogBreed(name: "poodel", minAge: 4, maxAge: 15),
        DogBreed(name: "bulldog",minAge: 7, maxAge: 12),
        DogBreed(name: "labrador",minAge: 5, maxAge: 13)
    ]
}

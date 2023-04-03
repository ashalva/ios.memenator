//
//  DogBreedDetailViewModel.swift
//  GeorgianMemenator
//
//  Created by Qeti Avanashvili on 22.03.23.
//
import SwiftUI
import Foundation
import Combine

class DogBreedDetailViewModel: ObservableObject {
    @Published var dogBreedDetail: DogBreed?
    
    private let dogBreedDetailService: DogBreedsServing
    private let dogBreedId: String
    
    init(dogBreedDetailService: DogBreedsServing, dogBreedId: String) {
        self.dogBreedDetailService = dogBreedDetailService
        self.dogBreedId = dogBreedId
    }
   
    func getDogBreedDetail() {
        dogBreedDetailService
            .getDogBreedDetails(with: dogBreedId)
    }
}

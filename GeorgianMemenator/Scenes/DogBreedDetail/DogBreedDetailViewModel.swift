//
//  DogBreedDetailViewModel.swift
//  GeorgianMemenator
//
//  Created by Qeti Avanashvili on 22.03.23.
//
import Foundation
import Combine

class DogBreedDetailViewModel: ObservableObject {
    @Published var dogBreedDetail: DogBreed?
   
    private let dogBreedDetailService: DogBreedsServing
    private let dogBreedId: String
    private var cancellables = Set<AnyCancellable>()
    
    init(dogBreedDetailService: DogBreedsServing, dogBreedId: String) {
        self.dogBreedDetailService = dogBreedDetailService
        self.dogBreedId = dogBreedId
    }
   
    func getDogBreedDetail() {
        dogBreedDetailService
            .getDogBreedDetails(with: dogBreedId)
            .sink(
                receiveCompletion: { [weak self] val in
                    if case .failure = val {
                    }
                }, receiveValue: { [weak self] val in
                    self?.dogBreedDetail = val
                })
            .store(in: &cancellables)
    }
}

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
    @Published private(set) var hasError: Bool = false
    @Published private(set) var isLoading: Bool = false
    
    private let dogBreedDetailService: DogBreedsServing
    private let dogBreedId: String
    private var cancellables = Set<AnyCancellable>()
    
    init(dogBreedDetailService: DogBreedsServing, dogBreedId: String) {
        self.dogBreedDetailService = dogBreedDetailService
        self.dogBreedId = dogBreedId
    }
   
    func getDogBreedDetail() {
        isLoading = true
        dogBreedDetailService
            .getDogBreedDetails(with: dogBreedId)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] val in
                    if case .failure = val {
                        self?.isLoading = false
                        self?.hasError = true
                    }
                }, receiveValue: { [weak self] val in
                    self?.dogBreedDetail = val
                    self?.isLoading = false
                    self?.hasError = false
                })
            .store(in: &cancellables)
    }
}

//
//  DogBreedsListViewModel.swift
//  GeorgianMemenator
//
//  Created by Qeti Avanashvili on 08.01.23.
//  Copyright © 2023 Shalva Avanashvili. All rights reserved.
//

import SwiftUI
import Foundation
import Combine

class DogBreedsListViewModel: ObservableObject {
    @Published var dogBreeds = [DogBreed]()
    @Published private(set) var hasError: Bool = false
    @Published private(set) var isLoading: Bool = false
    
    private let dogBreedsService: DogBreedsServing
    private(set) var imageLoader = ImageLoader()
    private var cancellables = Set<AnyCancellable>()
    
    init(dogBreedsService: DogBreedsServing) {
        self.dogBreedsService = dogBreedsService
    }
    
    deinit {
        cancellables.removeAll()
    }
    
    func initialFetch() {
        getDogBreeds()
    }
    
    func getDogBreeds() {
        isLoading = true
        dogBreedsService
            .getDogBreeds()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] val in
                    if case .failure = val {
                        self?.isLoading = false
                        self?.hasError = true
                    }
                }, receiveValue: { [weak self] val in
                    self?.dogBreeds = val
                    self?.isLoading = false
                    self?.hasError = false
                })
            .store(in: &cancellables)
    }
}

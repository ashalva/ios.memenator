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
    private let dogBreedsService: DogBreedsServing
    
    @Published var dogBreeds = [DogBreed]()
    
    @Published private(set) var currentPost: [DogBreed]?
    
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
        dogBreedsService
            .getDogBreeds()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { resp in
                    if case .failure = resp {
                    }
                }, receiveValue: { [weak self] val in
                    self?.dogBreeds = val
                })
            .store(in: &cancellables)
    }
}

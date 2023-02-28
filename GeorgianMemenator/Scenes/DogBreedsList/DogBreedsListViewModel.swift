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
    
    @Published private(set) var hasError: Bool = false
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var isImageLoading: Bool = false
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
    
    func finishImageLoading() {
        isImageLoading = false
    }
    
    func getDogBreeds() {
        dogBreedsService
            .getDogBreeds()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] resp in
                    if case .failure = resp {
                        self?.hasError = true
                        self?.isLoading = false
                        self?.isImageLoading = false
                    }
                }, receiveValue: { [weak self] val in
                    self?.dogBreeds = val
                    self?.isLoading = false
                    self?.isImageLoading = false
                })
            .store(in: &cancellables)
    }
}

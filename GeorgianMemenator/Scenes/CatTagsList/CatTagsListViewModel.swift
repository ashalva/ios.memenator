//
//  CatTagsListViewModel.swift
//  GeorgianMemenator
//
//  Created by Giorgi Makadze on 09.01.2023.
//  Copyright © 2023 Shalva Avanashvili. All rights reserved.
//

import SwiftUI
import Foundation
import Combine

class CatTagsListViewModel: ObservableObject {
    private let catTagsService: CatListServing
    
    @Published var tags: [CatTag] = []
    
    @Published private(set) var hasError: Bool = false
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var isImageLoading: Bool = false
    
    private(set) var imageLoader = ImageLoader()
    
    private var cancellables = Set<AnyCancellable>()
    
    init(catTagsService: CatListServing) {
        self.catTagsService = catTagsService
    }
    
    deinit {
        cancellables.removeAll()
    }
    
    func initialFetch() {
        getCatTags()
    }
    
    func finishImageLoading() {
        isImageLoading = false
    }
    
    func getCatTags() {
        isLoading = true
        isImageLoading = true
        
        catTagsService
            .getCatTagss()
            .receive(on: DispatchQueue.main)
            .sink(
            receiveCompletion: { [weak self] resp in
                if case .failure = resp {
                    self?.hasError = true
                    self?.isLoading = false
                    self?.isImageLoading = false
                }
            }, receiveValue: { [weak self] val in
                self?.tags = val
                self?.isLoading = false
                self?.isImageLoading = false
            })
           .store(in: &cancellables)
    }
    
}

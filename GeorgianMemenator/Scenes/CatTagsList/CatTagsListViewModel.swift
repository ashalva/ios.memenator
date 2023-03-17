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
    
    @Published private(set) var hasError: Bool = false
    @Published private(set) var isLoading: Bool = false
    
    @Published var tags: [CatTag] = []
    
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
    
    func getCatTags() {
        isLoading = true
        
        catTagsService
            .getCatTagss()
            .receive(on: DispatchQueue.main)
            .sink(
            receiveCompletion: {
                [weak self] resp in
                if case .failure = resp {
                    self?.hasError = true
                    self?.isLoading = false
                }
            }, receiveValue: { [weak self] val in
                self?.tags = val
                self?.isLoading = false
            })
           .store(in: &cancellables)
    }
    
}

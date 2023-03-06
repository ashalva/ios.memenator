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
        
        catTagsService
            .getCatTagss()
            .receive(on: DispatchQueue.main)
            .sink(
            receiveCompletion: { [weak self] resp in
                if case .failure = resp {
                }
            }, receiveValue: { [weak self] val in
                self?.tags = val
            })
           .store(in: &cancellables)
    }
    
}

//
//  RedditViewModel.swift
//  GeorgianMemenator
//
//  Created by Shalva Avanashvili on 14.01.2021.
//  Copyright © 2021 Shalva Avanashvili. All rights reserved.
//

import Combine
import Foundation


class RedditViewModel: ObservableObject {
    private let redditService: RedditServing
    
    @Published private(set) var hasError: Bool = false
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var isImageLoading: Bool = false
    @Published private(set) var currentPost: RedditPost?
    
    private(set) var imageLoader = ImageLoader()

    private var cancellables = Set<AnyCancellable>()
    
    init(redditService: RedditServing) {
        self.redditService = redditService
        
    }
    
    deinit {
        cancellables.removeAll()
    }
    
    func initialFetch() {
        getRandomRedditPost()
    }
    
    func finishImageLoading() {
        isImageLoading = false
    }
    
    func getRandomRedditPost() {
        isLoading = true
        isImageLoading = true
        
        redditService
            .getRandomPost()
            .receive(on: DispatchQueue.main)
            .sink(
            receiveCompletion: { [weak self] resp in
                if case .failure = resp {
                    self?.hasError = true
                    self?.isLoading = false
                    self?.isImageLoading = false
                }
            }, receiveValue: { [weak self] val in
                self?.currentPost = val
                self?.isLoading = false
                self?.isImageLoading = false
                if let url = self?.currentPost?.url {
                    self?.imageLoader.getData(from: url)
                }
            })
            .store(in: &cancellables)
    }
}


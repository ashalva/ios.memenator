//
//  FeedbackViewModel.swift
//  GeorgianMemenator
//
//  Created by Shalva Avanashvili on 17.04.2021.
//  Copyright © 2021 Shalva Avanashvili. All rights reserved.
//

import Foundation
import Applysis
import Combine

class FeedbackViewModel: ObservableObject {
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var submitted: Bool = false
    @Published private(set) var hasError: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    deinit {
        cancellables.removeAll()
    }
    
    func submit(
        email: String,
        title: String,
        feedbackText: String
    ) {
        isLoading = true
        
        let feedback = Feedback(
            text: feedbackText,
            title: title,
            date: Date(),
            rating: nil,
            author: email,
            region: nil,
            version: .appVersion,
            tags: nil
        )
        
        Applysis.shared.submitFeedback(feedback)
            .receive(on: DispatchQueue.main)
            .debounce(for: 0.1, scheduler: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] resp in
                switch resp {
                case .finished:
                    self?.isLoading = false
                    self?.submitted = true
                case .failure:
                    self?.isLoading = false
                    self?.hasError = true
                }
            }, receiveValue: { [weak self] r in
                self?.isLoading = false
                self?.submitted = true
            })
            .store(in: &cancellables)
    }
}

extension String {
    static var appVersion: String? {
        let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        
        if let v = appVersion, let b = build {
            return "\(v).\(b)"
        }
        
        return nil
    }
}

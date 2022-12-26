//
//  RedditService.swift
//  GeorgianMemenator
//
//  Created by Shalva Avanashvili on 14.01.2021.
//  Copyright © 2021 Shalva Avanashvili. All rights reserved.
//

import Combine
import Foundation

protocol RedditServing {
    func getRandomPost() -> AnyPublisher<RedditPost, Error>
}

class RedditService: RedditServing {
    private let redditApiUrl = "https://meme-api.com/"
    
    func getRandomPost() -> AnyPublisher<RedditPost, Error> {
        let request = Endpoint<RedditPostDTO>(baseURL: redditApiUrl)
            .appendingPathParameter("gimme")
            .usingDefaultParameters()
        
        return try! request
            .usingMethod(.GET)
            .build()
            .asFuture()
            .compactMap({ RedditPostMapper.toEntity(dto: $0) })
            .eraseToAnyPublisher()

    }
}

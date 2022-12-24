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
    func getRandomPost() -> Future<RedditPost, Error>
}

class RedditService: RedditServing {
    private let redditApiUrl = "https://meme-api.herokuapp.com/"
    
    func getRandomPost() -> Future<RedditPost, Error> {
        let request = Endpoint<RedditPost>(baseURL: redditApiUrl)
            .appendingPathParameter("gimme")
            .usingDefaultParameters()
        
        return try! request
            .usingMethod(.GET)
            .loggingResponse()
            .build()
            .asFuture()
    }
}

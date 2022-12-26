//
//  RedditPost.swift
//  GeorgianMemenator
//
//  Created by Shalva Avanashvili on 14.01.2021.
//  Copyright © 2021 Shalva Avanashvili. All rights reserved.
//

import Foundation

struct RedditPost: Decodable {
    let postLink: String
    let subreddit, title: String
    let url: String
    let nsfw, spoiler: Bool
    let author: String
    let ups: Int
    let preview: [String]
}

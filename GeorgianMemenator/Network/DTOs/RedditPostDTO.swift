//
//  RedditPostDTO.swift
//  GeorgianMemenator
//
//  Created by Shalva Avanashvili on 26.12.22.
//  Copyright © 2022 Shalva Avanashvili. All rights reserved.
//

import Foundation

struct RedditPostDTO: Decodable {
    let postLink: String
    let subreddit, title: String
    let url: String
    let nsfw, spoiler: Bool
    let author: String
    let ups: Int
    let preview: [String]
}

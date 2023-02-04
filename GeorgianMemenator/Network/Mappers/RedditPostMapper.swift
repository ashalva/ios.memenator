//
//  RedditPostMapper.swift
//  GeorgianMemenator
//
//  Created by Shalva Avanashvili on 26.12.22.
//  Copyright © 2022 Shalva Avanashvili. All rights reserved.
//

import Foundation

enum RedditPostMapper {
    static func toEntity(dto: RedditPostDTO) -> RedditPost {
        .init(
            postLink: dto.postLink,
            subreddit: dto.subreddit,
            title: dto.title,
            url: dto.url,
            nsfw: dto.nsfw,
            spoiler: dto.spoiler,
            author: dto.author,
            ups: dto.ups,
            preview: dto.preview
        )
    }
}

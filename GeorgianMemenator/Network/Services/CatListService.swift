//
//  CatListService.swift
//  GeorgianMemenator
//
//  Created by Giorgi Makadze on 07.02.2023.
//

import Foundation
import Combine


protocol CatListServing {
    func getCatTagss() -> AnyPublisher<[CatTag], Error>
}

class CatListService: CatListServing {
    private let catTagApiURL = "https://cataas.com/api"

    func getCatTagss() -> AnyPublisher<[CatTag], Error> {
        let request = Endpoint<[String]>(baseURL: catTagApiURL)
            .appendingPathParameter("tags")
            .usingDefaultParameters()
        
        return try! request
            .usingMethod(.GET)
            .loggingResponse()
            .build()
            .asFuture()
            .map {
                $0.map { tag in CatTag(name: tag) }
            }
            .eraseToAnyPublisher()
    }
}

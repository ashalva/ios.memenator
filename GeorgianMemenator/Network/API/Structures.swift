//
//  Structures.swift
//  GeorgianMemenator
//
//  Created by Shalva Avanashvili on 14.01.2021.
//  Copyright © 2021 Shalva Avanashvili. All rights reserved.
//

import Foundation

struct Pair {
    let key: String
    let value: String
}

// MARK: - Method
public enum RequestMethod: String {
    case GET = "GET"
    case POST = "POST"
}

// MARK: - Body
struct APIError: Decodable, Error {
    let statusCode: Int
}

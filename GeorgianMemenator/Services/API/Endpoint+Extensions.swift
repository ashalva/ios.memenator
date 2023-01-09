//
//  Endpoint+Extensions.swift
//  GeorgianMemenator
//
//  Created by Shalva Avanashvili on 14.01.2021.
//  Copyright © 2021 Shalva Avanashvili. All rights reserved.
//

import Foundation
import Combine

public extension Endpoint {
    func asFuture() -> Future<Response, Error> {
        return Future<Response, Error> { promise in
            let task = URLSession.shared.dataTask(with: self.request) { data, response, error in
                if self.shouldLogResponse == true {
                    if let data = data {
                        print("🟥🟥🟥")
                        print(String(data: data, encoding: String.Encoding.utf8) ?? "")
                    } else {
                        print("🟥🟥🟥 Response data not returned")
                    }
                }
                guard error == nil else {
                    promise(.failure(error!))
                    return
                }
                do {
                    promise(.success(try self.decoder.decode(Response.self, from: data!.valid)))
                } catch let error {
                    promise(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    func usingDefaultParameters() -> Endpoint {
        usingContentType("application/json")
    }
}

private extension Data {
    var valid: Data {
        if isEmpty {
            return "{}".data(using: .utf8)!
        }
        return self
    }
}

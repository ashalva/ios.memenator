//
//  Endpoint.swift
//  GeorgianMemenator
//
//  Created by Shalva Avanashvili on 14.01.2021.
//  Copyright © 2021 Shalva Avanashvili. All rights reserved.
//

import Foundation

//MARK: - CLIENT -
public final class Endpoint<Response: Decodable> {
    private let baseURL: String
    
    private var url: URL!
    private var headers: [Pair] = []
    private var pathParams: [String] = []
    private var queryItems: [Pair] = []
    private var method: RequestMethod = .POST
    private var httpBody: Data? = nil

    public private(set) var shouldLogResponse: Bool = false
    public private(set) var encoder = JSONEncoder()
    public private(set) var decoder = JSONDecoder()
    private(set) var request: URLRequest!
    
    public init(baseURL: String) {
        self.baseURL = baseURL
        url = URL(string: baseURL)!
    }
    
    /// Sets the custom path parameter for the endpoint
    /// - Parameter value: value for the path
    /// - Returns: Endpoint
    @discardableResult
    public func appendingPathParameter(_ value: String) -> Endpoint {
        url.appendPathComponent(value)
        return self
    }
    
    /// Sets the custom query parameter for the endpoint
    /// - Parameters:
    ///   - key: query parameter key
    ///   - value: query parameter value
    /// - Returns: Endpoint
    @discardableResult
    public func appendingQueryItem(key: String, value: String?) -> Endpoint {
        if let value = value {
            queryItems.append(Pair(key: key, value: value))
        }
        return self
    }
    
    /// Sets the custom header for the endpoint
    /// - Parameters:
    ///   - key: header key
    ///   - value: header value
    /// - Returns: Endpoint
    @discardableResult
    public func appendingHeader(key: String, value: String) -> Endpoint {
        headers.append(Pair(key: key, value: value))
        return self
    }
    
    /// Sets the request http method
    /// - Parameter method: value of the method e.g POST, GET etc
    /// - Returns: Endpoint
    @discardableResult
    public func usingMethod(_ method: RequestMethod) -> Endpoint {
        self.method = method
        return self
    }
    
    /// Sets the User-Agent header value
    /// - Parameter userAgent: value of the User-Agent header
    /// - Returns: Endpoint
    @discardableResult
    public func usingUserAgent(_ userAgent: String) -> Endpoint {
        self.headers.append(Pair(key: "User-Agent", value: userAgent))
        return self
    }
    
    /// Sets Content-Type header value
    /// - Parameter mimeType: value of the mimeType
    /// - Returns: Endpoint
    @discardableResult
    public func usingContentType(_ mimeType: String) -> Endpoint {
        self.headers.append(Pair(key: "Content-Type", value: mimeType))
        return self
    }
    
    /// Sets Authorisation header based on the bearer
    /// - Parameter bearer: value for the authorisation header
    /// - Returns: Endpoint
    @discardableResult
    public func signed(_ bearer: String) -> Endpoint {
        headers.append(Pair(key: "Authorization", value: bearer))
        return self
    }
    
    /// Sets the body for the Endpoint
    /// - Parameter body: Body
    /// - Returns: Endpoint
    @discardableResult
    public func bySettingBody<T: Encodable>(_ body: T) -> Endpoint {
        httpBody = try? encoder.encode(body)
        return self
    }
    
    /// Sets custom date formatter strategy
    /// - Parameter formatter: date formmatter, how the date should be exctracted form the response
    /// - Returns: Endpoint
    @discardableResult
    public func usingDateDecodingStrategy(_ formatter: DateFormatter) -> Endpoint {
        decoder.dateDecodingStrategy = .formatted(formatter)
        return self
    }

    @discardableResult
    public func loggingResponse() -> Endpoint {
        shouldLogResponse = true
        return self
    }
    
    /// Builds the request based on all builder methods
    /// - Throws: Throws the exception, if the endpoint is malformed
    /// - Returns: Endpoint
    @discardableResult
    public func build() throws -> Endpoint {
        // Query items
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        if !queryItems.isEmpty {
            components?.queryItems = queryItems
                .map {
                    URLQueryItem(
                        name: $0.key,
                        value: $0.value
                    )
            }
        }
        
        // URLRequest setup
        request = URLRequest(url: components!.url!)
        request.httpMethod = method.rawValue
        headers.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        request.httpBody = httpBody
        
        return self
    }
}

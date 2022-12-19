//
//  CatStatusCodesViewModel.swift
//  GeorgianMemenator
//
//  Created by Shalva Avanashvili on 14.01.2021.
//  Copyright © 2021 Shalva Avanashvili. All rights reserved.
//

import SwiftUI
import Combine
import Foundation

class CatStatusCodesViewModel: ObservableObject {
    private var selection: Int = 0
    
    @Published private(set) var isImageLoading: Bool = false
    private(set) var imageLoader = ImageLoader()
    
    let statusCodes: [String] = [
        "100", "101", "102", "201", "202", "204", "206", "207", "300", "301", "302", "303", "304", "305", "307", "400",
        "401", "402", "403", "404", "405", "406", "408", "409", "410", "411", "412", "413", "414", "415", "416", "417", "418",
        "420", "421", "422", "423", "424", "425", "426", "429", "431", "444", "450", "451", "499", "500", "501", "502", "503",
        "504", "506", "507", "508", "509", "510", "511", "599"
    ]
    
    init() {
        selection = 0
    }
    
    func initialFetch() {
        getStatusCode(for: 0)
    }
    
    func getStatusCode(for index: Int) {
        isImageLoading = true
        imageLoader.getData(from: "https://http.cat/\(statusCodes[index]).jpg")
    }
    
    
    func finishImageLoading() {
        isImageLoading = false
    }
}

extension Binding {
    /// Execute block when value is changed.
    ///
    /// Example:
    ///
    ///     Slider(value: $amount.didSet { print($0) }, in: 0...10)
    func didSet(execute: @escaping (Value) ->Void) -> Binding {
        return Binding(
            get: {
                return self.wrappedValue
            },
            set: {
                self.wrappedValue = $0
                execute($0)
            }
        )
    }
}

//
//  ActivityIndicatorView.swift
//  GeorgianMemenator
//
//  Created by Shalva Avanashvili on 14.01.2021.
//  Copyright © 2021 Shalva Avanashvili. All rights reserved.
//

import SwiftUI
import UIKit

public struct ActivityIndicator: UIViewRepresentable {
    
    public typealias UIView = UIActivityIndicatorView
    public var isAnimating: Bool = true
    public var configuration = { (indicator: UIView) in }
    
    public init(isAnimating: Bool, configuration: ((UIView) -> Void)? = nil) {
        self.isAnimating = isAnimating
        if let configuration = configuration {
            self.configuration = configuration
        }
    }
    
    public func makeUIView(context: UIViewRepresentableContext<Self>) -> UIView {
        let v = UIView()
        v.style = .large
        
        return v
    }
    
    public func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<Self>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
        configuration(uiView)
    }
}

public extension View where Self == ActivityIndicator {
    func configure(_ configuration: @escaping (Self.UIView) -> Void) -> Self {
        Self.init(isAnimating: self.isAnimating, configuration: configuration)
    }
}

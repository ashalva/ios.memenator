//
//  UIView+Extensions.swift
//  GeorgianMemenator
//
//  Created by Shalva Avanashvili on 18.01.2021.
//  Copyright © 2021 Shalva Avanashvili. All rights reserved.
//

import UIKit

extension UIView {
    func asImage(rect: CGRect) -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: rect)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

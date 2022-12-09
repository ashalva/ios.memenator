//
//  CIFilter+Extensions.swift
//  GeorgianMemenator
//
//  Created by Shalva Avanashvili on 18.01.2021.
//  Copyright © 2021 Shalva Avanashvili. All rights reserved.
//

import UIKit
import CoreImage
import CoreImage.CIFilterBuiltins

extension CIFilter {
    static func applySepia(image: UIImage) -> UIImage? {
        let context = CIContext()
        let currentFilter = CIFilter.sepiaTone()
        
        let beginImage = CIImage(image: image)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        currentFilter.intensity = 50
        
        guard let outputImage = currentFilter.outputImage else { return nil }
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            return UIImage(cgImage: cgimg)
        }
        
        return nil
    }
}

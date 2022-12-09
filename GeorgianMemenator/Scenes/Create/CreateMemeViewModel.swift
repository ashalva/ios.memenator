//
//  CreateMemeViewModel.swift
//  GeorgianMemenator
//
//  Created by Shalva Avanashvili on 18.01.2021.
//  Copyright © 2021 Shalva Avanashvili. All rights reserved.
//

import UIKit
import Foundation

class CreateMemeViewModel: ObservableObject {
    @Published var imageSaved: Bool = false
    
    func calculateHeight(screenWidth: CGFloat, maxHeight: CGFloat, image: UIImage) -> CGFloat {
        let imageHeight = image.size.height
        let imageWidth = image.size.width
        
        if imageWidth > imageHeight {
            let proportion = imageWidth / screenWidth
            
            return imageHeight / proportion
        } else {
            return maxHeight
        }
    }
    
    func saveImage(image: UIImage) {
        let imageSaver = ImageSaver() { success in
            self.imageSaved = success
        }
        imageSaver.writeToPhotoAlbum(image: image)
    }
}

class ImageSaver: NSObject {
    private var completion: (Bool) -> ()
    
    init (completion: @escaping (Bool) -> ()) {
        self.completion = completion
    }
    
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
    }

    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        self.completion(error == nil)
    }
}

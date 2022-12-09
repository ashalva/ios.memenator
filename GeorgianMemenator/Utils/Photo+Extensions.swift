//
//  Photo+Extensions.swift
//  GeorgianMemenator
//
//  Created by Shalva Avanashvili on 18.01.2021.
//  Copyright © 2021 Shalva Avanashvili. All rights reserved.
//

import PhotosUI
import Foundation

extension PHPhotoLibrary {
    static var isAuthorised: Bool {
        PHPhotoLibrary.authorizationStatus() == .authorized
    }
    
    static func performWhenAuthorized(_ completion: @escaping () -> Void) {
        if PHPhotoLibrary.authorizationStatus() != .authorized {
            PHPhotoLibrary.requestAuthorization { status in
                DispatchQueue.main.async {
                    if status == .authorized || status == .limited {
                        completion()
                    }
                }
            }
        } else {
            completion()
        }
    }
}

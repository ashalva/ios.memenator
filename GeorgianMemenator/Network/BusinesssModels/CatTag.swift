//
//  CatTagDetail.swift
//  GeorgianMemenator
//
//  Created by Giorgi Makadze on 31.01.2023.
//  Copyright © 2023 Shalva Avanashvili. All rights reserved.
//

import Foundation

struct CatTag: Identifiable {
    let id: String = UUID().uuidString
    let name: String
}

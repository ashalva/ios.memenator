//
//  CatTagsListViewModel.swift
//  GeorgianMemenator
//
//  Created by Giorgi Makadze on 09.01.2023.
//  Copyright © 2023 Shalva Avanashvili. All rights reserved.
//

import SwiftUI
import Foundation

class CatTagsListViewModel: ObservableObject {
    @Published var tags: [CatTag] = [
        CatTag(name: "Sphynx cat"),
        CatTag(name: "Munchkin cat"),
        CatTag(name: "Bengal cat")
    ]
}

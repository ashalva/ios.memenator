//
//  MemeCategory.swift
//  GeorgianMemenator
//
//  Created by Shalva Avanashvili on 16.01.2021.
//  Copyright © 2021 Shalva Avanashvili. All rights reserved.
//

import SwiftUI
import Foundation

struct MemeCategory: Identifiable {
    var id: String = UUID().uuidString
    
    let title: String
    let icon: Image
    
    init(title: String, icon: Image) {
        self.title = title
        self.icon = icon
    }
}

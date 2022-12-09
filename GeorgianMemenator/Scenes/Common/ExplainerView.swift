//
//  ExplainerView.swift
//  GeorgianMemenator
//
//  Created by Shalva Avanashvili on 16.01.2021.
//  Copyright © 2021 Shalva Avanashvili. All rights reserved.
//

import SwiftUI
import Foundation

struct ExplainerView: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(Font.system(size: 14))
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.leading)
                .padding(.leading, 16)
            
            Text(value)
                .font(Font.system(size: 16))
                .multilineTextAlignment(.leading)
            
            Spacer()
        }
    }
}

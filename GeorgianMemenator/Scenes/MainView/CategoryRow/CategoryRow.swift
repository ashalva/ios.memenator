//
//  CategoryRow.swift
//  GeorgianMemenator
//
//  Created by Shalva Avanashvili on 16.01.2021.
//  Copyright © 2021 Shalva Avanashvili. All rights reserved.
//

import SwiftUI
import Foundation


struct CategoryRow: View {
    var category: MemeCategory

    var body: some View {
        HStack {
            category.icon
                .resizable()
                .frame(width: 44, height: 44)
            Text(category.title)

            Spacer()
        }
    }
}

//struct CategoryRow_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryRow(landmark: landmarks[0])
//    }
//}

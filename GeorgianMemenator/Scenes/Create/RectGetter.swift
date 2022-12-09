//
//  RectGetter.swift
//  GeorgianMemenator
//
//  Created by Shalva Avanashvili on 18.01.2021.
//  Copyright © 2021 Shalva Avanashvili. All rights reserved.
//

import SwiftUI

struct RectGetter: View {
    @Binding var rect: CGRect
    let backgroundColor: Color

    var body: some View {
        GeometryReader { proxy in
            self.createView(proxy: proxy)
                .background(backgroundColor)
        }
    }

    func createView(proxy: GeometryProxy) -> some View {
        DispatchQueue.main.async {
            self.rect = proxy.frame(in: .global)
        }

        return Rectangle().fill(Color.clear)
    }
}

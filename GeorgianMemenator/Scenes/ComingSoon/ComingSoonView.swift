//
//  ComingSoonView.swift
//  GeorgianMemenator
//
//  Created by Shalva Avanashvili on 16.01.2021.
//  Copyright © 2021 Shalva Avanashvili. All rights reserved.
//

import SwiftUI

struct ComingSoonView: View {
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Feature is under development, coming soon!")
                    .font(.title)
                    .padding(.top, 32)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
            }
            .frame(
                width: geometry.size.width,
                height: geometry.size.height,
                alignment: .top
            )
            .background(Color.listBackground)
            .navigationBarTitle("Coming Soon", displayMode: .inline)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

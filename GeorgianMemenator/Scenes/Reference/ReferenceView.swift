//
//  ReferenceView.swift
//  GeorgianMemenator
//
//  Created by Shalva Avanashvili on 16.01.2021.
//  Copyright © 2021 Shalva Avanashvili. All rights reserved.
//

import SwiftUI

struct ReferenceView: View {
    var body: some View {
        VStack {
            Text("🙏")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(.vertical, 16)
            List {
                Section(header: Text("APIS")) {
                    Link("Reddit", destination: URL(string: "https://github.com/D3vd/Meme_Api")!)
                    Link("Cat status codes", destination: URL(string: "https://http.cat/")!)
                    Link("Girchi", destination: URL(string: "https://www.facebook.com/groups/1505557899631626")!)
                }
                
                Section(header: Text("Icons")) {
                    Link("Freepik", destination: URL(string: "https://www.flaticon.com/authors/freepik")!)
                    Link("Pixel perfect", destination: URL(string: "https://www.flaticon.com/authors/pixel-perfect")!)
                }
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationTitle("References")
    }
}

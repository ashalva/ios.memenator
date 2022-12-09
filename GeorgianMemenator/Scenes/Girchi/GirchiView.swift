//
//  GirchiView.swift
//  GeorgianMemenator
//
//  Created by Shalva Avanashvili on 14.01.2021.
//  Copyright © 2021 Shalva Avanashvili. All rights reserved.
//

import SwiftUI
import Foundation

struct GirchiView: View {
    @ObservedObject var viewModel: GirchiViewModel
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                
                Text("Random memes from Georgian meme leaders!")
                    .font(.title)
                    .padding(.top, 32)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                
                Image(self.viewModel.currentMemeName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 16)
                    .frame(
                        width: geometry.size.width,
                        height: 350,
                        alignment: .center
                    )
                
                Button(action: {
                    self.viewModel.generateRandomMeme()
                }, label: {
                    Text("Next")
                })
                    .buttonStyle(OutlineButton())
                    .padding(.top, 16)
            }
            .accentColor(.orange)
            .frame(
                width: geometry.size.width,
                height: geometry.size.height,
                alignment: .top
            )
            .navigationBarTitle("Girchi", displayMode: .inline)
        }
    }
}

struct Girchi_Previews: PreviewProvider {
    static var previews: some View {
        MainView(
            viewModel: MainViewModel()
        )
    }
}

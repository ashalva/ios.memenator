//
//  CatStatusCodesView.swift
//  GeorgianMemenator
//
//  Created by Shalva Avanashvili on 14.01.2021.
//  Copyright © 2021 Shalva Avanashvili. All rights reserved.
//

import SwiftUI
import Foundation


struct CatStatusCodesView: View {
    @State var image: UIImage = UIImage()
    @State private var selection = 0
    
    @ObservedObject var viewModel: CatStatusCodesViewModel
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Choose status code")
                    .font(.title)
                    .padding(.top, 16)
                
                Picker(
                    selection: $selection.didSet(execute: { i in viewModel.getStatusCode(for: i)}),
                    label: Text("Status Codes")
                ) {
                    ForEach(0 ..< viewModel.statusCodes.count, id: \.self) {
                        Text(self.viewModel.statusCodes[$0]).tag($0)
                    }
                }
                
                ZStack {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(
                            width: geometry.size.width,
                            height: 300,
                            alignment: .center
                        )
                        .onReceive(viewModel.imageLoader.didChange) { data in
                            self.viewModel.finishImageLoading()
                            self.image = UIImage(data: data) ?? UIImage()
                        }
                        .background(Color.listBackground)
                    
                    if viewModel.isImageLoading {
                        ActivityIndicator(isAnimating: true)
                    }
                }
            }
            .frame(
                width: geometry.size.width,
                height: geometry.size.height,
                alignment: .top
            )
            .navigationBarTitle("Cat Status Codes", displayMode: .inline)
        }
        .onAppear(perform: {
            viewModel.initialFetch()
        })
        .background(Color.listBackground)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct CatStatusCodesView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(
            viewModel: MainViewModel()
        )
    }
}

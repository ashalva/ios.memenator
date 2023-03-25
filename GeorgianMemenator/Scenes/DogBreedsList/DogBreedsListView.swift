//
//  DogBreedsListView.swift
//  GeorgianMemenator
//
//  Created by Qeti Avanashvili on 08.01.23.
//  Copyright © 2023 Shalva Avanashvili. All rights reserved.
//

import SwiftUI
import Foundation

struct DogBreedsListView: View {
    @ObservedObject var viewModel: DogBreedsListViewModel
    var body: some View {
        VStack {
            if viewModel.hasError {
                Text("Error")
                    .font(.title)
                    .padding(.top, 32)
            } else if viewModel.isLoading {
                ActivityIndicator(isAnimating: true)
            } else {
                NavigationView {
                    List(viewModel.dogBreeds) { dogBreed in
                        NavigationLink(destination: EmptyView()) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(dogBreed.name)
                                Text("min life: \(dogBreed.minLife), max life: \(dogBreed.maxLife)")
                            }
                        }
                    }
                }
            }
        }
        
        .onAppear(perform: {
            viewModel.initialFetch()
        })
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct DogBreedsListView_Previews: PreviewProvider {
    static var previews: some View {
        DogBreedsListView(
            viewModel: DogBreedsListViewModel(dogBreedsService: DogBreedsService())
        )
    }
}

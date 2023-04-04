//
//  DogBreedDetailView.swift
//  GeorgianMemenator
//
//  Created by Qeti Avanashvili on 22.03.23.
//

import SwiftUI
import Foundation

struct DogBreedDetailView: View {
    @ObservedObject var viewModel: DogBreedDetailViewModel
    var body: some View {
        VStack {
            if viewModel.hasError {
                Text("Error")
                    .font(.title)
                    .padding(.top, 32)
            } else if viewModel.isLoading {
                ActivityIndicator(isAnimating: true)
            }
        }
    }
}

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
            } else if viewModel.isLoading {
                ActivityIndicator(isAnimating: true)
            } else {
                VStack(alignment: .leading, spacing: 4) {
                    Text(viewModel.dogBreedDetail?.name ?? "no name")
                    Text(viewModel.dogBreedDetail?.description ?? "no name")
                    Text("min life: \(viewModel.dogBreedDetail?.minLife ?? 0)")
                    Text("max life: \(viewModel.dogBreedDetail?.maxLife ?? 0)")
                    Text("male min weight: \(viewModel.dogBreedDetail?.maleMaxWeight ?? 0)")
                    Text("male max weight: \(viewModel.dogBreedDetail?.maleMaxWeight ?? 0)")
                    Text("female min weight: \(viewModel.dogBreedDetail?.femaleMinWeight ?? 0)")
                    Text("female max weight: \(viewModel.dogBreedDetail?.femaleMaxWeight ?? 0)")
                }
                .padding(EdgeInsets(top: 1, leading: 16, bottom: 1, trailing: 16))
                Spacer()
                    .navigationTitle("Details")
            }
        }
        .onAppear(perform: {
            viewModel.initialFetch()
        })
    }
}

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
        EmptyView()
    }
}

struct DogBreedDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DogBreedDetailView(viewModel: DogBreedDetailViewModel())
    }
}

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
        List(viewModel.dogBreeds) { dogBreed in
            VStack {
                Text(dogBreed.name)
                Text("min life: \(dogBreed.minLife), max life: \(dogBreed.maxLife)")
            }
        }
    }
}

struct DogBreedsListView_Previews: PreviewProvider {
    static var previews: some View {
        DogBreedsListView(viewModel: DogBreedsListViewModel())
    }
}

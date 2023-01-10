//
//  DogBreedsListViewModel.swift
//  GeorgianMemenator
//
//  Created by Qeti Avanashvili on 08.01.23.
//  Copyright © 2023 Shalva Avanashvili. All rights reserved.
//

import SwiftUI
import Foundation

class DogBreedsListViewModel: ObservableObject {
    var body: some View {
        EmptyView()
        
    }
}

struct DogBreedsListViewModel_Previews: PreviewProvider {
    
    static var previews: some View {
        DogBreedsListView(viewModel: DogBreedsListViewModel())
    }
}



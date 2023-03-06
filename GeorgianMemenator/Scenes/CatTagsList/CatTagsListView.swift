//
//  CatTagsListView.swift
//  GeorgianMemenator
//
//  Created by Giorgi Makadze on 09.01.2023.
//  Copyright © 2023 Shalva Avanashvili. All rights reserved.
//

import SwiftUI
import Foundation

struct CatTagsListView: View {
    @ObservedObject var viewModel: CatTagsListViewModel
    @State var image: UIImage = UIImage()
    
    var body: some View {
        List(viewModel.tags) { tag in
            Text(tag.name)
        }
        .onAppear(perform: {
            viewModel.initialFetch()
        })
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct CatTagsListView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(
            viewModel: MainViewModel()
        )
            
    }
}

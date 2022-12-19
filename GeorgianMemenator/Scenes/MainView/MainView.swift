//
//  MainView.swift
//  GeorgianMemenator
//
//  Created by Shalva Avanashvili on 12.01.2021.
//  Copyright © 2021 Shalva Avanashvili. All rights reserved.
//

import SwiftUI
import Combine

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel
    
    private let fbVM = FeedbackViewModel()
    
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                VStack {
                    Text("Memenator has collected memes for you!")
                        .foregroundColor(.textColor)
                        .padding(.top, 32)
                    
                    Text("Please, select category:")
                        .foregroundColor(.textColor)
                        .padding(.top, 16)
                    
                    List {
                        NavigationLink(destination:
                                        RedditView(
                                            viewModel: RedditViewModel(
                                                redditService: RedditService()
                                            )
                                        )
                        ) {
                            CategoryRow(category: viewModel.categories[0])
                        }
                        
                        NavigationLink(destination:
                                    CreateMemeView(
                                        viewModel: CreateMemeViewModel()
                                    )
                        ) {
                            CategoryRow(category: viewModel.categories[1])
                        }
                        
                        NavigationLink(destination:
                                        CatStatusCodesView(
                                            viewModel: CatStatusCodesViewModel()
                                        )
                        ) {
                            CategoryRow(category: viewModel.categories[2])
                        }
                        
                        NavigationLink(destination:
                                        GirchiView(
                                            viewModel: GirchiViewModel()
                                        )
                        ) {
                            CategoryRow(category: viewModel.categories[3])
                        }

                        NavigationLink(destination:
                                        ReferenceView()
                        ) {
                            CategoryRow(category: viewModel.categories[5])
                        }
                        
                        NavigationLink(destination:
                                        FeedbackView(
                                            viewModel: fbVM
                                        )
                        ) {
                            CategoryRow(category: viewModel.categories[6])
                        }
                    }
                }
                .frame(
                    width: proxy.size.width,
                    height: proxy.size.height,
                    alignment: .top
                )
            }
            .navigationBarTitle("Categories", displayMode: .inline)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(
            viewModel: MainViewModel()
        )
    }
}

struct OutlineButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(configuration.isPressed ? .gray : .accentColor)
            .padding()
            .background(
                RoundedRectangle(
                    cornerRadius: 8,
                    style: .continuous
                ).stroke(Color.accentColor)
            )
    }
}

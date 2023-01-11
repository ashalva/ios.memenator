//
//  RedditView.swift
//  GeorgianMemenator
//
//  Created by Shalva Avanashvili on 14.01.2021.
//  Copyright © 2021 Shalva Avanashvili. All rights reserved.
//

import SwiftUI
import Foundation

struct RedditView: View {
    @State var image: UIImage = UIImage()
    @ObservedObject var viewModel: RedditViewModel
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                if viewModel.hasError {
                    Text("Error")
                        .font(.title)
                        .padding(.top, 32)
                } else {
                    Text("Random memes from Reddit")
                        .font(.title)
                        .padding(.top, 32)
                    
                    if let subReddit = viewModel.currentPost?.subreddit {
                        ExplainerView(
                            title: "subreddit: ",
                            value: subReddit
                        )
                        .padding(.top, 32)
                    }
                    
                    if let author = viewModel.currentPost?.author {
                        ExplainerView(
                            title: "author: ",
                            value: author
                        )
                    }
                    
                    ZStack {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.top, 8)
                            .frame(
                                width: geometry.size.width,
                                height: 320,
                                alignment: .center
                            )
                            .onReceive(viewModel.imageLoader.didChange) { data in
                                self.viewModel.finishImageLoading()
                                self.image = UIImage(data: data) ?? UIImage()
                            }
                        
                        if viewModel.isImageLoading {
                            ActivityIndicator(isAnimating: true)
                        }
                    }
                    
                    Button(action: {
                        self.viewModel.getRandomRedditPost()
                    }, label: {
                        Text("Next")
                    })
                    .padding(.top, 8)
                    .buttonStyle(OutlineButton())
                }
            }
            .accentColor(.orange)
            .frame(
                width: geometry.size.width,
                height: geometry.size.height,
                alignment: .top
            )
            .navigationBarTitle("Reddit", displayMode: .inline)
            .background(Color.listBackground)
        }
        .onAppear(perform: {
            viewModel.initialFetch()
        })
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct Reddit_Previews: PreviewProvider {
    static var previews: some View {
        MainView(
            viewModel: MainViewModel()
        )
    }
}

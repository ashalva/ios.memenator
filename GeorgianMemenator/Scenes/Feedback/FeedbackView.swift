//
//  FeedbackView.swift
//  GeorgianMemenator
//
//  Created by Shalva Avanashvili on 17.04.2021.
//  Copyright © 2021 Shalva Avanashvili. All rights reserved.
//

import SwiftUI
import Foundation
import Applysis


struct FeedbackView: View {
    @State var image: UIImage = UIImage()
    @State private var selection = 0
    
    @State private var feedbackText: String = ""
    @State private var feedbackTitle: String = ""
    @State private var userEmail: String = ""
    
    @ObservedObject var viewModel: FeedbackViewModel
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                if viewModel.isLoading {
                    ActivityIndicator(isAnimating: true)
                } else {
                    if viewModel.submitted {
                        Text("Thanks for the feedback!")
                            .font(.title)
                            .foregroundColor(Color.green)
                            .padding(.top, 32)
                    } else if viewModel.hasError {
                        Text("Something went wrong, sorry :(")
                            .font(.title)
                            .foregroundColor(Color.red)
                            .padding(.top, 32)
                    }
                    
                    TextField("Email", text: $userEmail)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .font(Font.system(size: 18))
                        .frame(height: 36)
                        .textContentType(.emailAddress)
                    
                    TextField("Title", text: $feedbackTitle)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .font(Font.system(size: 18))
                        .frame(height: 36)
                    
                    TextEditor(text: $feedbackText)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .font(Font.system(size: 18))
                        .frame(height: 128)
                        .background(Color.listBackground)
                    
                    Button("Submit", action: {
                        viewModel.submit(
                            email: userEmail,
                            title: feedbackTitle,
                            feedbackText: feedbackText
                        )
                        
                        userEmail = ""
                        feedbackTitle = ""
                        feedbackText = ""
                    })
                    .disabled(
                        userEmail.isEmpty ||
                        feedbackTitle.isEmpty ||
                        feedbackText.isEmpty
                    )
                    .padding(.top, 16)
                }
            }
            .frame(
                width: geometry.size.width,
                height: geometry.size.height,
                alignment: .top
            )
            .padding(.top, 16)
            .navigationBarTitle("Submit feedback", displayMode: .inline)
        }
        .background(Color.listBackground)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct FeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView(viewModel: FeedbackViewModel())
    }
}

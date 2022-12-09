//
//  CreateMemeView.swift
//  GeorgianMemenator
//
//  Created by Shalva Avanashvili on 18.01.2021.
//  Copyright © 2021 Shalva Avanashvili. All rights reserved.
//

import SwiftUI
import PhotosUI

struct CreateMemeView: View {
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var memeRectangle: CGRect = .zero
    @State private var image: Image?
    @State private var topText: String = ""
    @State private var bottomText: String = ""
    @State private var uploadText = "Upload image"
    
    @ObservedObject private var viewModel: CreateMemeViewModel
    
    init(viewModel: CreateMemeViewModel) {
        UIScrollView.appearance().keyboardDismissMode = .onDrag
        
        self.viewModel = viewModel
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    if image == nil {
                        Text("Create meme!")
                            .font(.title)
                            .padding(.top, 32)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 16)
                        
                        Text("Start with uploading media.")
                            .padding(.vertical, 8)
                            .font(Font.system(size: 16))
                    }
                    
                    if let image = image {
                        Text(viewModel.imageSaved ? "Meme saved!" : "Enter texts")
                            .padding(.top, 16)
                            .padding(.leading, 16)
                            .font(Font.system(size: 20))
                            .frame(width: geometry.size.width, alignment: .leading)
                            .foregroundColor(viewModel.imageSaved ? Color.green :Color.textColor)
                        
                        TextField("Top text", text: $topText)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .font(Font.system(size: 18))
                            .frame(height: 36)
                        
                        TextField("Bottom text", text: $bottomText)
                            .padding(.horizontal, 16)
                            .padding(.bottom, 8)
                            .font(Font.system(size: 18))
                            .frame(height: 36)
                        
                        VStack {
                            Text(topText)
                                .padding(8)
                                .font(Font.system(size: 20))
                                .foregroundColor(Color.black)
                                .multilineTextAlignment(.center)
                            
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(height: viewModel.calculateHeight(
                                    screenWidth: geometry.size.width - 32,
                                    maxHeight: 320,
                                    image: inputImage!
                                )
                                )
                                .background(Color.red)
                                .cornerRadius(18)
                            
                            Text(bottomText)
                                .padding(8)
                                .font(Font.system(size: 20))
                                .foregroundColor(Color.black)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.horizontal, 16)
                        .background(RectGetter(rect: $memeRectangle, backgroundColor: Color.white))
                    }
                    
                    Button(uploadText, action: {
                        PHPhotoLibrary.performWhenAuthorized {
                            showingImagePicker = true
                        }
                    })
                    .padding(.top, 16)
                }
            }
            .frame(
                width: geometry.size.width,
                height: geometry.size.height,
                alignment: .top
            )
            .background(Color.listBackground)
            .navigationBarTitle("Create", displayMode: .inline)
            .navigationBarItems(
                trailing: Button("Save") {
                    if let image = UIApplication.shared.windows[0].rootViewController?.view.asImage(rect: self.memeRectangle) {
                        viewModel.saveImage(image: image)
                    }
                }.disabled(inputImage == nil)
            )
            .edgesIgnoringSafeArea(.bottom)
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: self.$inputImage)
            }
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        
        uploadText = "Upload another"
    }
}

struct CreateMemeView_Previews: PreviewProvider {
    static var previews: some View {
        CreateMemeView(
            viewModel: CreateMemeViewModel()
        )
    }
}

//
//  TitleImageView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/10.
//

import SwiftUI
import PhotosUI

struct TitleImageView: View {
    var imageName: String = ""
    var title: String = ""
    var imageDescription = ""
    var isTitleShow: Bool = true
    var width: CGFloat = .infinity
    var height: CGFloat = 120.0
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    var body: some View {
        VStack(alignment: .center) {
            if(self.isTitleShow) {
                Text(self.title)
                    .font(.system(size: HEADER2_FONT_SIZE))
                    .padding([.bottom], 0)
            }

            ZStack {
                PhotosPicker(
                    selection: $selectedItem,
                    matching: .images,
                    photoLibrary: .shared()) {
                        if let selectedImageData,
                           let uiImage = UIImage(data: selectedImageData) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: width, height: height)
                                    .cornerRadius(10)
                                    .overlay(RoundedRectangle(cornerRadius: 10.0)
                                            .stroke(STACK_BORDER_COLOR_GRAY, lineWidth: 2))
                            }
                        else {
                            Image("")
                                .resizable()
                                //.scaledToFit()
                                .frame(width: width, height: height)
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 10.0)
                                        .stroke(STACK_BORDER_COLOR_GRAY, lineWidth: 2))
                                .background(STACK_BACKGROUND_COLOR_GRAY)
                        }
                    }
                    .onChange(of: selectedItem) { newItem in
                        Task {
                            //Retrieve selected asset in thhe form of Data
                            if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                selectedImageData = data
                            }
                        }
                    }
                
                if(self.selectedImageData == nil) {
                    PhotosPicker(
                        selection: $selectedItem,
                        matching: .images,
                        photoLibrary: .shared()) {
                            Text(self.imageDescription)
                                //.frame(alignment: .center)
                                .font(.system(size: BODY_FONT_SIZE))
                                .foregroundColor(STACK_BORDER_COLOR_GRAY)
                                .padding([.leading, .trailing], 36)

                        }
                        .onChange(of: selectedItem) { newItem in
                            Task {
                                //Retrieve selected asset in thhe form of Data
                                if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                    selectedImageData = data
                                }
                            }
                        }
                }
            }

        }
        
    }
}

struct TitleImageView_Previews: PreviewProvider {
    static var previews: some View {
        TitleImageView(imageName: "", title: "??????", imageDescription: "???????????????\n?????????????????????????????????????????????????????????????????????????????????????????????")
    }
}

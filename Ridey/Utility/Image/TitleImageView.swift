//
//  TitleImageView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/10.
//

import SwiftUI

struct TitleImageView: View {
    var imageName: String = ""
    var title: String = ""
    var imageDescription = ""
    var isTitleShow: Bool = true
    var width: CGFloat = .infinity
    var height: CGFloat = 120.0
    
    var body: some View {
        VStack {
            if(self.isTitleShow) {
                Text(self.title)
                    .font(.system(size: HEADER2_FONT_SIZE))
                    .padding([.bottom], 0)
            }

            ZStack {
                Image(self.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: width, height: height)
                    .overlay(RoundedRectangle(cornerRadius: 10.0)
                            .stroke(STACK_BORDER_COLOR_GRAY, lineWidth: 2))
                    .background(STACK_BACKGROUND_COLOR_GRAY)

                if(self.imageName.isEmpty) {
                    Text(self.imageDescription)
                        .font(.system(size: BODY_FONT_SIZE))
                        .foregroundColor(STACK_BORDER_COLOR_GRAY)
                        .padding([.leading, .trailing], 36)
                }

            }

        }
        
    }
}

struct TitleImageView_Previews: PreviewProvider {
    static var previews: some View {
        TitleImageView(imageName: "", title: "正面", imageDescription: "請點此上傳\n請上傳可見姓名、出生日期和照片的身分證相片，請自行遮蔽重要資訊")
    }
}

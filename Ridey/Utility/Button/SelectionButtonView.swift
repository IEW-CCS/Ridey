//
//  SelectionButtonView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/12.
//

import SwiftUI

struct SelectionButtonView: View {
    var title: String = ""
    var isTitleDisplay: Bool = true
    @Binding var buttonText: String
    var width: CGFloat = .infinity
    @Binding var isPressed: Bool
    @Binding var validationTip: String

    var body: some View {
        VStack(alignment: .leading) {
            if(isTitleDisplay) {
                Text(self.title)
                    .font(.system(size: HEADER2_FONT_SIZE))
                    .padding([.leading, .trailing], 20)
            }

            Button(action: { self.isPressed = !self.isPressed }) {
                HStack {
                    Text(buttonText)
                        .font(.system(size: BODY_FONT_SIZE))
                        .padding([.leading], 10)
                        .foregroundColor(BORDER_COLOR_BLACK)
                    Spacer()
                    Image(systemName: "arrowtriangle.down")
                        .resizable()
                        .frame(width: 14, height:14)
                        .foregroundColor(TEXTEDITOR_BRODER_COLOR_GRAY)
                        .padding([.trailing], 10)
                }
                
            }
            .frame(minWidth: 0, maxWidth: self.width, minHeight: 45, maxHeight: 45)
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5.0)
                    .stroke(TEXTEDITOR_BRODER_COLOR_GRAY, lineWidth: 1.5))
            .padding([.leading, .trailing], 20)
            
            if(!validationTip.isEmpty) {
                Text(validationTip)
                    .font(.system(size: BODY_FONT_SIZE))
                    .foregroundColor(BACKGROUND_COLOR_ORANGE)
                    .padding([.leading, .trailing], 20)
            }

        }
        
    }
}

struct SelectionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionButtonView(title: "567", buttonText: .constant("1234"), isPressed: .constant(false), validationTip: .constant("Test Tip"))
    }
}

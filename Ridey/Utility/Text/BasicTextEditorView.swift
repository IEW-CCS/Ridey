//
//  BasicTextEditorView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/9.
//

import SwiftUI

struct BasicTextEditorView: View {
    @Binding var inputText: String
    @Binding var placeHolder: String
    @FocusState private var isFocused: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            TextField("", text:  $inputText)
                .padding([.top, .bottom, .leading, .trailing], 5)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 45, maxHeight: 45)
                .foregroundColor(BORDER_COLOR_BLACK)
                .font(.system(size: HEADER2_FONT_SIZE))
                .lineLimit(1)
                .cornerRadius(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 5.0)
                        .stroke(
                            isFocused ? BORDER_COLOR_SKY_BLUE: BORDER_COLOR_BLACK, lineWidth: isFocused ? 2 : 1.5))
                .shadow(color: isFocused ? BORDER_COLOR_SKY_BLUE : .clear, radius: 2.0)
                        
                
                .padding([.leading, .trailing], 20)
                .submitLabel(.done)
                .focused($isFocused)

            if(!placeHolder.isEmpty && !isFocused && inputText.isEmpty) {
                Text(self.placeHolder)
                    .padding([.top, .bottom, .leading, .trailing], 5)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 45, maxHeight: 45, alignment: .leading)
                    .foregroundColor(BORDER_COLOR_BLACK)
                    .font(.system(size: HEADER2_FONT_SIZE))
                    .opacity(0.5)
                    .padding([.leading, .trailing], 20)
                
            }
        }
        

        
        /*
        TextField("", text: inputText.isEmpty ? $placeHolder : $inputText)
            .padding([.top, .bottom, .leading, .trailing], 5)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 45, maxHeight: 45)
            .foregroundColor(BORDER_COLOR_BLACK)
            .font(.system(size: HEADER2_FONT_SIZE))
            .lineLimit(1)
            .opacity(inputText.isEmpty ? 0.3 : 1)
            //.background(.white)
            //.background(BUTTON_BACKGROUND_COLOR)
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5.0)
                    .stroke(BORDER_COLOR_BLACK, lineWidth: 1.5))
            .padding([.leading, .trailing], 20)
            .submitLabel(.done)*/
    }
}

struct BasicTextEditorView_Previews: PreviewProvider {
    
    static var previews: some View {
        BasicTextEditorView(inputText: .constant(""), placeHolder: .constant("電子信箱"))
    }
}

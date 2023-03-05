//
//  BasicTextEditorView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/9.
//

import SwiftUI

struct BasicTextEditorView: View {
    @State var isSecured: Bool = false
    @Binding var inputText: String
    @Binding var placeHolder: String
    @FocusState private var isFocused: Bool
    @Binding var validationTip: String
    
    var body: some View {
        VStack(alignment: .leading) {
            if(isSecured) {
                SecureField("", text:  $inputText, prompt: Text(placeHolder))
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
            } else {
                TextField("", text:  $inputText, prompt: Text(placeHolder))
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
            }
            
            if(!validationTip.isEmpty) {
                Text(validationTip)
                    .font(.system(size: BODY_FONT_SIZE))
                    .foregroundColor(BACKGROUND_COLOR_ORANGE)
                    .padding([.leading, .trailing], 20)
            }

            /*
            if(!placeHolder.isEmpty && !isFocused && inputText.isEmpty) {
                Text(self.placeHolder)
                    .padding([.top, .bottom, .leading, .trailing], 5)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 45, maxHeight: 45, alignment: .leading)
                    .foregroundColor(BORDER_COLOR_BLACK)
                    .font(.system(size: HEADER2_FONT_SIZE))
                    .opacity(0.5)
                    .padding([.leading, .trailing], 20)
                
            }*/
        }
    }
}

struct BasicTextEditorView_Previews: PreviewProvider {
    
    static var previews: some View {
        BasicTextEditorView(inputText: .constant(""), placeHolder: .constant("電子信箱"), validationTip: .constant(""))
    }
}

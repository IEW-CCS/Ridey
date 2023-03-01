//
//  TitleSelectionTextEditorView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/13.
//

import SwiftUI

struct TitleSelectionTextEditorView: View {
    var title: String = ""
    @Binding var inputText: String
    @Binding var isPressed: Bool
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(self.title)
                .font(.system(size: BODY_FONT_SIZE))
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding([.top], 5)
                .padding([.bottom], 0)
                .padding([.leading, .trailing], 10)
                .cornerRadius(5)
                .background(BORDER_COLOR_WHITE)
                
            TextEditor(text: $inputText)
                .font(.system(size: BODY_FONT_SIZE))
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 36, maxHeight: 36)
                .padding([.leading, .trailing], 5)
                .foregroundColor(BORDER_COLOR_BLACK)
                .background(BORDER_COLOR_WHITE)
                .focused($isFocused)
                .submitLabel(.done)
                .onTapGesture(perform: {
                    self.isPressed = !(self.isPressed)
                })
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
        .cornerRadius(5)
        .background(BORDER_COLOR_WHITE)
        .overlay(
            RoundedRectangle(cornerRadius: 5.0)
                .stroke(
                    isFocused ? BORDER_COLOR_ORANGE: BORDER_COLOR_BLACK, lineWidth: isFocused ? 2 : 1.5))
        .shadow(color: isFocused ? BORDER_COLOR_ORANGE : .clear, radius: 2.0)
    }
}

struct TitleSelectionTextEditorView_Previews: PreviewProvider {
    static var previews: some View {
        TitleSelectionTextEditorView(title: "出發時間", inputText: .constant("2023/02/20"), isPressed: .constant(true))
    }
}

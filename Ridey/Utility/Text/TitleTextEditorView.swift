//
//  TitleTextEditorView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/9.
//

import SwiftUI

struct TitleTextEditorView: View {
    var title: String = ""
    @Binding var inputText: String
    var lineNumber: Int = 1
    var width: CGFloat = .infinity
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.title)
                .font(.system(size: HEADER2_FONT_SIZE))
            
            TextEditor(text: $inputText)
                .padding([.top, .bottom, .leading, .trailing], 5)
                .frame(minWidth: 0, maxWidth: width, minHeight: 45 * CGFloat(self.lineNumber), maxHeight: 45 * CGFloat(self.lineNumber))
                /*.frame(minWidth: 0, maxWidth: .infinity, minHeight: 45 * CGFloat(self.lineNumber), maxHeight: 45 * CGFloat(self.lineNumber))*/
                .foregroundColor(BORDER_COLOR_BLACK)
                .font(.system(size: BODY_FONT_SIZE))
                .lineLimit(1)
                .cornerRadius(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 5.0)
                        .stroke(
                            isFocused ? BORDER_COLOR_SKY_BLUE: BORDER_COLOR_BLACK, lineWidth: isFocused ? 2 : 1.5))
                .shadow(color: isFocused ? BORDER_COLOR_SKY_BLUE : .clear, radius: 2.0)
        }
                .padding([.leading, .trailing], 20)
                .submitLabel(.done)
                .focused($isFocused)
    }
}

struct TitleTextEditorView_Previews: PreviewProvider {
    static var previews: some View {
        TitleTextEditorView(title: "緊急聯絡人與本人關係", inputText: .constant("123"), lineNumber: 1)
    }
}

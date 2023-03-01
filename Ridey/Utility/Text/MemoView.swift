//
//  MemoView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/9.
//

import SwiftUI

struct MemoView: View {
    var title: String = ""
    var content: String = ""
    
    var body: some View {
        VStack {
            Text(self.title)
                .font(.system(size: HEADER_FONT_SIZE))
                .frame(maxWidth: .infinity)
                .padding([.top, .bottom], 12)
                .foregroundColor(.white)
                .background(BACKGROUND_COLOR_ORANGE)

            ScrollView {
                Text(self.content)
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.system(size: BODY2_FONT_SIZE))
                    .padding([.leading, .trailing], 20)
                    .foregroundColor(STACK_FOREGROUND_COLOR_BLACK)
                    .background(STACK_BACKGROUND_COLOR_GRAY)
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
            }
        }
        .frame(maxWidth: .infinity, minHeight: 360, maxHeight: 360, alignment: .topLeading)
        .background(STACK_BACKGROUND_COLOR_GRAY)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 20.0)
                .stroke(BORDER_COLOR_ORANGE, lineWidth: 1))
        .padding([.leading, .trailing], 20)
        
        
    }
}

struct MemoView_Previews: PreviewProvider {
    static var previews: some View {
        MemoView(title: "會員條款", content: membershipTerms)
    }
}

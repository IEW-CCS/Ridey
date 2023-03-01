//
//  CapsuleLabelView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/9.
//

import SwiftUI

struct CapsuleLabelView: View {
    var label: String = ""
    var body: some View {
        Text(self.label)
            .font(.system(size: HEADER2_FONT_SIZE))
            .padding([.leading, .trailing], 8)
            .padding([.top, .bottom], 3)
            .overlay(
                RoundedRectangle(cornerRadius: 20.0)
                    .stroke(BORDER_COLOR_BLACK, lineWidth: 1))
            .padding([.top], 20)
    }
}

struct CapsuleLabelView_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleLabelView(label: "Hello World!")
    }
}

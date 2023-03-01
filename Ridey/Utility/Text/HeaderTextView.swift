//
//  TextView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/8.
//

import SwiftUI

struct HeaderTextView: View {
    var text: String = ""
    
    var body: some View {
        Text(self.text)
            .underline()
            .foregroundColor(TEXT_COLOR_ORANGE)
            .font(.system(size: TITLE_FONT_SIZE))
            .padding([.leading, .trailing], 20)
            .padding([.top], 20)
    }
}

struct HeaderTextView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderTextView(text: "Hello, World")
    }
}

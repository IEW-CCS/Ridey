//
//  CustomSegmentedView4.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/16.
//

import SwiftUI

struct CustomSegmentedView4: View {
    @Binding var selectedSegment: Int
    var segments: [String]
    @Binding var value: String
    @Binding var validationTip: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack() {
                ForEach(segments.indices, id:\.self) { index in
                    Button(action: {
                        withAnimation(.interactiveSpring()) {
                            selectedSegment = index
                            value = segments[index]
                        }
                    }) {
                        Text(segments[index])
                            .font(.system(size: NORMAL_BUTTON_FONT_SIZE))
                            .frame(minWidth: 0, maxWidth: .infinity)
                        
                            .padding(.vertical, 15)
                            //.padding(.horizontal, 5)
                        
                            .background(selectedSegment == index ? BACKGROUND_COLOR_ORANGE : STACK_BACKGROUND_COLOR_GRAY)
                            .cornerRadius(5)
                    }
                    
                    .foregroundColor(selectedSegment == index ? .white: BORDER_COLOR_BLACK)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5.0)
                            .stroke(selectedSegment == index ? BACKGROUND_COLOR_ORANGE : STACK_BORDER_COLOR_GRAY, lineWidth: 1.5))
                    .opacity(selectedSegment == index ? 1 : 0.8)
                }

            }

            if(!validationTip.isEmpty) {
                Text(validationTip)
                    .font(.system(size: BODY_FONT_SIZE))
                    .foregroundColor(BACKGROUND_COLOR_ORANGE)
                    //.padding([.leading, .trailing], 20)
            }

        }
    }
}

struct CustomSegmentedView4_Previews: PreviewProvider {
    static var previews: some View {
        CustomSegmentedView4(selectedSegment: .constant(2), segments: ["男", "女", "其他"], value: .constant(""), validationTip: .constant("Test Tip"))
    }
}

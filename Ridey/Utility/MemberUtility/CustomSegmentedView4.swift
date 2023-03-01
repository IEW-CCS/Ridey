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
    
    var body: some View {
        HStack() {
            ForEach(segments.indices, id:\.self) { index in
                Button(action: {
                    withAnimation(.interactiveSpring()) {
                        selectedSegment = index
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
                /*
                .background(
                        Rectangle()
                            .fill(selectedSegment == index ?  BORDER_COLOR_WHITE : .clear)
                            .cornerRadius(15)
                            .shadow(
                                color: Color.gray.opacity(0.7),
                                radius: 15,
                                x: 0,
                                y: 0
                            )
                )*/

            }

        }
    }
}

struct CustomSegmentedView4_Previews: PreviewProvider {
    static var previews: some View {
        CustomSegmentedView4(selectedSegment: .constant(2), segments: ["男", "女", "其他"])
    }
}

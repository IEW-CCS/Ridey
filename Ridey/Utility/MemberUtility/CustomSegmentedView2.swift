//
//  CustomSegmentedView2.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/15.
//

import SwiftUI

struct CustomSegmentedView2: View {
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
                        .frame(minWidth: 0, maxWidth: 100)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 5)
                        .background(selectedSegment == index ? BACKGROUND_COLOR_ORANGE: STACK_BORDER_COLOR_GRAY)
                        .cornerRadius(30)
                }
                .foregroundColor(selectedSegment == index ? .white : BORDER_COLOR_BLACK)
                .opacity(selectedSegment == index ? 1 : 0.8)

            }
            Spacer()
        }
    }
}

struct CustomSegmentedView2_Previews: PreviewProvider {
    static var previews: some View {
        CustomSegmentedView2(selectedSegment: .constant(0), segments: ["媒合中", "已媒合"])
    }
}

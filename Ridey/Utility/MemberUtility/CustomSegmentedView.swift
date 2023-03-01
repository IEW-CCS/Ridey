//
//  CustomSegmentedView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/15.
//

import SwiftUI

struct CustomSegmentedView: View {
    @Binding var selectedSegment: Int
    var segments: [String]
    let color = BORDER_COLOR_WHITE
    
    var body: some View {
        HStack() {
            ForEach(segments.indices, id:\.self) { index in
                Button(action: {
                    withAnimation(.interactiveSpring()) {
                        selectedSegment = index
                    }
                }) {
                    VStack {
                        Text(segments[index])
                            .font(.system(size: NORMAL_BUTTON_FONT_SIZE))
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 5)
                            .background(color.opacity(0.8))
                            .cornerRadius(10)
                        
                        Divider()
                            .frame(height: 2)
                            .overlay((selectedSegment == index) ? BACKGROUND_COLOR_ORANGE : BORDER_COLOR_WHITE)
                            .padding([.leading, .trailing], 5)

                    }
                    
                }
                
                .foregroundColor(BORDER_COLOR_BLACK)
                .opacity(selectedSegment == index ? 1 : 0.5)
            }
        }
    }
}

struct CustomSegmentedView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSegmentedView(selectedSegment: .constant(1), segments: ["預定搭乘", "預計駕駛", "已完成共乘"])
    }
}

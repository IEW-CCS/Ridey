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
    @State private var isBottomReached: Bool = false
    @Binding var isChecked: Bool
    @Binding var validationTip: String

    @State private var scrollOffset: CGPoint = .zero
    @State private var contentSize: CGSize = .zero
    @State private var scrollSize: CGSize = .zero

    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                Text(self.title)
                    .font(.system(size: HEADER_FONT_SIZE))
                    .frame(maxWidth: .infinity)
                    .padding([.top, .bottom], 12)
                    .foregroundColor(.white)
                    .background(BACKGROUND_COLOR_ORANGE)

                ScrollView {
                    Text(self.content)
                        .coordinateSpace(name: "text")
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.system(size: BODY2_FONT_SIZE))
                        .padding([.leading, .trailing], 20)
                        .foregroundColor(STACK_FOREGROUND_COLOR_BLACK)
                        .background(STACK_BACKGROUND_COLOR_GRAY)
                        .lineLimit(nil)
                        .multilineTextAlignment(.leading)
                        .readingScrollView(from: "scroll", into: $scrollOffset)
                        .overlay(
                            GeometryReader { proxy in
                                Color.clear.onAppear { contentSize = proxy.size }
                            }
                        )
                }
                .overlay(
                    GeometryReader { proxy in
                        Color.clear.onAppear { scrollSize = proxy.size }
                    }
                )

                .onChange(of: scrollOffset, perform: { value in
                    if((value.y + scrollSize.height + 1 - contentSize.height) >= 0) {
                        //print("Offset = \(value.y + scrollSize.height + 1 - contentSize.height)")
                        isBottomReached = true
                        validationTip = ""
                    }
                })
                .coordinateSpace(name: "scroll")
            }
            .frame(maxWidth: .infinity, minHeight: 360, maxHeight: 360, alignment: .topLeading)
            .background(STACK_BACKGROUND_COLOR_GRAY)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 20.0)
                    .stroke(BORDER_COLOR_ORANGE, lineWidth: 1))
            .padding([.leading, .trailing], 20)

            CheckBoxView(id: "1",
                         label: "我已詳閱會員條款",
                         size: 24,
                         textSize: TITLE_FONT_SIZE,
                         callback: checkboxSelected)
            .padding(.horizontal, 20)
            .padding(.top, 10)
            .disabled(!isBottomReached)

            if(!validationTip.isEmpty) {
                Text(validationTip)
                    .font(.system(size: BODY_FONT_SIZE))
                    .foregroundColor(BACKGROUND_COLOR_ORANGE)
                    .padding([.leading, .trailing], 55)
            }
            
            //Text("ScrollView Y offset: \(scrollOffset.y)")
            //Text("scrollSize height: \(scrollSize.height)")
            //Text("contentSize height: \(contentSize.height)")
        }
        .onAppear() {
            validationTip = "請完整閱讀上方的會員條款"
        }

    }
    
    func checkboxSelected(id: String, isMarked: Bool) {
            print("\(id) is marked: \(isMarked)")
        isChecked = isMarked
    }

}

struct MemoView_Previews: PreviewProvider {
    static var previews: some View {
        MemoView(title: "會員條款", content: membershipTerms, isChecked: .constant(false), validationTip: .constant("請完整閱讀上方的會員條款"))
    }
}

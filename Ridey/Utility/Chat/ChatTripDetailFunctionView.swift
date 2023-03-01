//
//  ChatTripDetailFunctionView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/21.
//

import SwiftUI

struct ChatTripDetailFunctionView: View {
    var driverName: String = ""
    var time: String = ""
    var fromTo: String = ""

    var body: some View {
        VStack(spacing: 5) {
            VStack(alignment: .leading) {
                Text("您申請了由 \(self.driverName) 所駕駛：")
                    .font(.system(size: BODY_FONT_SIZE))
                    .bold()
                    //.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                Text("\(self.time) \(self.fromTo) \n的共乘行程")
                    .font(.system(size: BODY_FONT_SIZE))
                    //.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 5)
            }
            
            VStack(alignment: .center, spacing: 15) {
                Button(action: {  }) {
                    Text("查看詳細資訊")
                        .font(.system(size: BODY_FONT_SIZE))
                }
                .buttonStyle(BasicCompactButtonStyle(width: 90))
                //.padding(.leading, 20)
            }
        }
        .padding()
        .background(STACK_BACKGROUND_COLOR_LIGHT_GRAY)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20.0)
                .stroke(BACKGROUND_COLOR_ORANGE, lineWidth: 1))
        .padding(.horizontal, 20)
    }
}

struct ChatTripDetailFunctionView_Previews: PreviewProvider {
    static var previews: some View {
        ChatTripDetailFunctionView(driverName: "SpiderMan", time: "10/30 上午11:00", fromTo: "台北車站 → 台南車站")
    }
}

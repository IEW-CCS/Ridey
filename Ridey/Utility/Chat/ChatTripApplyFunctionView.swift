//
//  ChatTripApplyFunctionView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/21.
//

import SwiftUI

struct ChatTripApplyFunctionView: View {
    var driverName: String = ""
    var time: String = ""
    var fromTo: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("您曾經瀏覽由 \(self.driverName) 所駕駛：")
                .font(.system(size: BODY_FONT_SIZE))
                .bold()
            
            Text("\(self.time) \(self.fromTo) \n的共乘行程")
                .font(.system(size: BODY_FONT_SIZE))
                .padding(.bottom, 5)
            
            HStack(spacing: 15) {
                //Spacer()
                Button(action: {  }) {
                    Text("查看詳細資訊")
                        .font(.system(size: BODY_FONT_SIZE))
                }
                .buttonStyle(BasicCompactButtonStyle(width: 90))
                .padding(.leading, 20)

                Button(action: {  }) {
                    Text("申請共乘")
                        .font(.system(size: BODY_FONT_SIZE))
                }
                .buttonStyle(BasicCompactButtonStyle(width: 90))
                .padding(.trailing, 20)
                //Spacer()
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

struct ChatTripApplyFunctionView_Previews: PreviewProvider {
    static var previews: some View {
        ChatTripApplyFunctionView(driverName: "SpiderMan", time: "10/30 上午11:00", fromTo: "台北車站 → 台南車站")
    }
}

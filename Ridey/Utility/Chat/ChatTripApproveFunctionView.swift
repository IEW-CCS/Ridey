//
//  ChatTripApproveFunctionView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/21.
//

import SwiftUI

struct ChatTripApproveFunctionView: View {
    var passengerName: String = ""
    var time: String = ""
    var fromTo: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("\(self.passengerName) 申請了由您所駕駛：")
                .font(.system(size: BODY_FONT_SIZE))
                .bold()
            
            Text("\(self.time) \(self.fromTo) \n的共乘行程")
                .font(.system(size: BODY_FONT_SIZE))
                .padding(.bottom, 5)
            
            HStack(spacing: 15) {
                //Spacer()
                Button(action: {  }) {
                    Text("拒絕")
                        .font(.system(size: BODY_FONT_SIZE))
                }
                .buttonStyle(BasicCompactButtonStyle(width: 90))
                .padding(.leading, 20)

                Button(action: {  }) {
                    Text("確認")
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

struct ChatTripApproveFunctionView_Previews: PreviewProvider {
    static var previews: some View {
        ChatTripApproveFunctionView(passengerName: "IronMan", time: "10/30 上午11:00", fromTo: "台北車站 → 台南車站")
    }
}

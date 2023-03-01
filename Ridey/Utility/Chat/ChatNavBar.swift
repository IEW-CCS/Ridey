//
//  ChatNavBar.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/21.
//

import SwiftUI

struct ChatNavBar: View {
    let backHandler: (() -> Void)
    //let title: String
    let titleType: Int // -1: Chat List Navigation Bar
                       //  0: Chat Trip Detail Navigation Bar
                       //  1: Chat Name Title Navigation Bar
    
    let chatInfo: ChatInformation

    var body: some View {
        HStack(alignment: .center) {
            Button(action: { self.backHandler() }) {
                Image("arrow_left")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .foregroundColor(BORDER_COLOR_BLACK)
                    .frame(width: 24, height: 24)
            }
            
            if(titleType == -1) {
                Text("訊息")
                    .font(.system(size: HEADER_FONT_SIZE))
                    .foregroundColor(BORDER_COLOR_BLACK)
                Spacer()
            } else if(titleType == 0) {
                VStack(spacing: 5) {
                    Text(chatInfo.time)
                        .font(.system(size: BODY_FONT_SIZE))
                    
                    Text(chatInfo.fromTo)
                        .font(.system(size: BODY_FONT_SIZE))
                        .bold()

                    HStack(spacing: 0) {
                        Text("由 ")
                            .font(.system(size: BODY2_FONT_SIZE))
                        Image(chatInfo.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            
                        Text(chatInfo.driverName)
                            .font(.system(size: BODY2_FONT_SIZE))
                            .padding(.leading, 3)
                        
                        Text(" 駕駛")
                            .font(.system(size: BODY2_FONT_SIZE))
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity)
            } else if(titleType == 1) {
                Spacer()
                VStack {
                    Text(chatInfo.driverName)
                        .font(.system(size: TITLE_FONT_SIZE))
                }
                Spacer()
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding(.horizontal, 20)
    }
}

struct ChatNavBar_Previews: PreviewProvider {
    static var previews: some View {
        ChatNavBar(backHandler: {}, titleType: 0, chatInfo: chatInfo1)
    }
}

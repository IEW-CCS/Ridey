//
//  SendMessageCell.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/22.
//

import SwiftUI

struct SendMessageCell: View {
    var messageContent: MessageContent
    
    var body: some View {
        HStack {
            Spacer()
            
            HStack(alignment: .bottom) {
                //Spacer()

                Text(messageContent.time)
                    .font(.system(size: BODY3_FONT_SIZE))
                    .foregroundColor(TEXT_COLOR_GRAY)
                    .padding(.trailing, 5)

                Text(messageContent.message)
                    .font(.system(size: BODY_FONT_SIZE))
                    .foregroundColor(.black)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(BACKGROUND_COLOR_LIGHT_ORANGE)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20.0)
                    .stroke(.clear, lineWidth: 1))
            //.frame(minWidth: 0, maxWidth: .infinity)
            .padding(.leading, 50)
            .padding(.trailing, 20)
        }
    }
}

struct SendMessageCell_Previews: PreviewProvider {
    static var previews: some View {
        SendMessageCell(messageContent: message4)
    }
}

//
//  ReceiveMessageCell.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/22.
//

import SwiftUI

struct ReceiveMessageCell: View {
    var messageContent: MessageContent
    
    var body: some View {
        HStack {
            HStack(alignment: .bottom) {
                Image(messageContent.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                
                VStack(alignment: .leading) {
                    HStack(spacing: 10) {
                        Text(messageContent.sender)
                            .font(.system(size: BODY_FONT_SIZE))
                            .foregroundColor(STACK_BORDER_COLOR_GRAY)
                        
                        if(messageContent.isDriver) {
                            Image("handler_icon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 12, height: 12)
                        }
                    }
                    
                    Text(messageContent.message)
                        .font(.system(size: BODY_FONT_SIZE))
                        .foregroundColor(BORDER_COLOR_BLACK)
                }
                
                Text(messageContent.time)
                    .font(.system(size: BODY3_FONT_SIZE))
                    .foregroundColor(STACK_BORDER_COLOR_GRAY)
                    .padding(.leading, 5)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(BORDER_COLOR_WHITE)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20.0)
                    .stroke(.clear, lineWidth: 1))
            .padding(.leading, 20)
            .padding(.trailing, 50)
            
            Spacer()
        }
    }
}

struct ReceiveMessageCell_Previews: PreviewProvider {
    static var previews: some View {
        ReceiveMessageCell(messageContent: message2)
    }
}

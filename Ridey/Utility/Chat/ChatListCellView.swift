//
//  ChatListCellView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/21.
//

import SwiftUI

struct ChatListCellView: View {
    var chatInfo: ChatInformation
    
    var body: some View {
        HStack(alignment: .center) {
            Image(chatInfo.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 75, height: 75)
            
            if(chatInfo.typeGroupChat == 0) {
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        Image("car_icon")
                            .resizable()
                            .renderingMode(.template)
                            .scaledToFit()
                            .foregroundColor(BORDER_COLOR_BLACK)
                            .frame(width: 20, height: 20)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("\(chatInfo.time) 的共乘行程")
                                .font(.system(size: BODY_FONT_SIZE))
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            
                            Text(chatInfo.fromTo)
                                .font(.system(size: BODY_FONT_SIZE))
                                .bold()
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                //.padding(.top, 1)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        Spacer()
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    
                    Text(chatInfo.lastMessage)
                        .font(.system(size: BODY2_FONT_SIZE))
                        .foregroundColor(STACK_BORDER_COLOR_GRAY)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        //.padding(.top, 1)
                        .lineLimit(1)
                }
                .padding(.horizontal, 10)
            } else {
                VStack(alignment: .leading, spacing: 5) {
                    Text(chatInfo.driverName)
                        .font(.system(size: TITLE_FONT_SIZE))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                    
                    Text(chatInfo.lastMessage)
                        .font(.system(size: BODY2_FONT_SIZE))
                        .foregroundColor(STACK_BORDER_COLOR_GRAY)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        //.padding(.top, 1)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                    
                    //Spacer()
                }
                .padding(.horizontal, 10)
            }
            
            HStack {
                if(chatInfo.typeHasNewMessage == 0) {
                    Image("green_circle_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .padding(.leading, 10)
                }
            }
            .frame(minWidth: 30, maxWidth: 30)
            
            Spacer()
        }
        
    }
}

struct ChatListCellView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListCellView(chatInfo: chatInfo5)
    }
}

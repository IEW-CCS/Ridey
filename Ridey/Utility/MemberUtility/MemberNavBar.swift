//
//  MemberNavBar.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/1/29.
//

import SwiftUI

struct MemberNavBar: View {
    let backHandler: (() -> Void)
    let title: String
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack {
                    Button(action: { self.backHandler() }) {
                        //HStack {
                            Image("bw_ridey_icon")
                                .resizable()
                                .frame(width: 36, height:36)
                        //}.foregroundColor(Color.blue)
                    }
                    Spacer()
                    /*
                    Text(title)
                        .font(.system(size: 20))
                        .lineLimit(1)
                        .foregroundColor(Color.white)
                    Spacer()*/
                    Image("chat_icon")
                        .resizable()
                        .frame(width: 24, height:24)
                    Image("alarm_icon")
                        .resizable()
                        .frame(width: 24, height:24)
                    
                    Image("spider_man")
                        .resizable()
                        .frame(width: 40, height:40)
                        .clipShape(Circle())
                        .overlay(RoundedRectangle(cornerRadius: 20.0)
                                .stroke(BUTTON_COLOR_ORANGE, lineWidth: 2))
                }
                .padding([.leading, .trailing], 16)
                //.padding([.top, .bottom], 6)
                //Divider()
                Spacer()
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
            .frame(height: 40)
            
            Text(title)
                .font(.system(size: HEADER_FONT_SIZE))
                .lineLimit(1)
                .foregroundColor(Color.white)
        }
        
        
    }
}

struct MemberNavBar_Previews: PreviewProvider {
    static var previews: some View {
        MemberNavBar(backHandler: {}, title: "會員專區")
    }
}

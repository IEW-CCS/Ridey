//
//  MemberProfileView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/14.
//

import SwiftUI

struct MemberProfileView: View {
    var body: some View {
        VStack {
            ZStack {
                /*
                VStack {
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 30, maxHeight: 30)
                .background(BACKGROUND_COLOR_ORANGE)
                .offset(x:0, y:-125)
                */
                
                VStack {
                    Image("spider_man")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .background(BACKGROUND_COLOR_LIGHT_ORANGE)
                        .frame(width: 100, height: 100)
                        .cornerRadius(50)
                        .overlay(RoundedRectangle(cornerRadius: 50)
                            .stroke(.white, lineWidth: 6))
                    
                   Text("Hi, Spider Man")
                        .foregroundColor(.white)
                        .font(.system(size: HEADER_FONT_SIZE))
                        //.padding([.top], 15)
                    
                    Text("Ridey陪你一起享受每段旅程。")
                         .foregroundColor(.white)
                         .font(.system(size: BODY_FONT_SIZE))
                         //.padding([.top], 1)
                        
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 280, maxHeight: 280)
                .background(BACKGROUND_COLOR_ORANGE)
                .cornerRadius(30, corners: [.bottomLeft, .bottomRight])
                //.clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))
                //.clipShape(Rectangle().clipShape( RoundedCorner(radius: 20, corners: [.bottomLeft, .bottomRight]) ))
                .overlay(
                    RoundedRectangle(cornerRadius: 30.0)
                        .stroke(BACKGROUND_COLOR_ORANGE, lineWidth: 1))
                HStack {
                    Spacer()
                    MemberTripSummaryView(createdTrips: 5, takenTrips: 13)
                        .padding([.trailing], 20)
                        .offset(x:0, y: 150)
                }
                
            }
            Spacer()
        }
    }
}

struct MemberProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MemberProfileView()
    }
}

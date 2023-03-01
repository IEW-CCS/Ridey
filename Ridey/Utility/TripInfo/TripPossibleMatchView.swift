//
//  TripPossibleMatchView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/16.
//

import SwiftUI

struct TripPossibleMatchView: View {
    var tripInfo: TripInformation
    
    var body: some View {
        HStack(alignment: .top) {
            Text(tripInfo.itemNo)
                .font(.system(size: HEADER_FONT_SIZE))
                .padding([.leading, .trailing], 15)
                .padding([.top, .bottom], 15)
            Spacer()
            VStack(alignment: .leading) {
                Text(tripInfo.startLocation)
                    .font(.system(size: HEADER_FONT_SIZE))
                    .padding([.top], 15)
                    .padding([.bottom], 5)

                Text(tripInfo.startTime)
                    .font(.system(size: BODY_FONT_SIZE))
                    .padding([.bottom], 10)
                    //.foregroundColor(STACK_BORDER_COLOR_GRAY)
            }
            
            Spacer()
            Text(" → ")
                .font(.system(size: HEADER_FONT_SIZE))
                .padding([.top], 15)
            Spacer()
            VStack(alignment: .leading) {
                Text(tripInfo.toLocation)
                    .font(.system(size: HEADER_FONT_SIZE))
                    .padding([.top], 15)
                    .padding([.bottom], 5)
                
                HStack {
                    Text("行駛時間")
                        .font(.system(size: BODY_FONT_SIZE))
                        .foregroundColor(STACK_BORDER_COLOR_GRAY)
                    Text(tripInfo.durationTime)
                        .font(.system(size: 15))
                }
                .padding([.bottom], 1)
                
                HStack {
                    Text("共乘評價")
                        .font(.system(size: BODY_FONT_SIZE))
                        .foregroundColor(STACK_BORDER_COLOR_GRAY)
                    Text(tripInfo.driveScoring)
                        .font(.system(size: 15))
                }
                .padding([.bottom], 10)
            }
            
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(STACK_BACKGROUND_COLOR_LIGHT_GRAY)
        .cornerRadius(15.0)
        .overlay(
            RoundedRectangle(cornerRadius: 15.0)
                .stroke(STACK_BORDER_COLOR_GRAY, lineWidth: 1))
        .padding([.leading, .trailing], 20)
        .padding([.top, .bottom], 1)
    }
}

struct TripPossibleMatchView_Previews: PreviewProvider {
    static var previews: some View {
        TripPossibleMatchView(tripInfo: tripInfo1)
    }
}

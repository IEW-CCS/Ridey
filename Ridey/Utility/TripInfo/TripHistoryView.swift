//
//  TripHistoryView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/15.
//

import SwiftUI

struct TripHistoryView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var router: Router

    var ridePlan: RidePlan
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(ridePlan.isDriver ? "駕駛" : "搭乘")
                    .font(.system(size: HEADER_FONT_SIZE))
                    .frame(maxWidth: 45)
                    .padding(2)
                    .foregroundColor(ridePlan.isDriver ? BACKGROUND_COLOR_DARK_GREEN : BACKGROUND_COLOR_DARK_BLUE)
                    .background(ridePlan.isDriver ? BACKGROUND_COLOR_LIGHT_GREEN : BACKGROUND_COLOR_LIGHT_BLUE)
                    .cornerRadius(5.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5.0)
                            .stroke(ridePlan.isDriver ? BACKGROUND_COLOR_LIGHT_GREEN : BACKGROUND_COLOR_LIGHT_BLUE, lineWidth: 1))
                    .padding([.top, .bottom, .leading], 10)
                    
                Text(ridePlan.fromLocation + " → " + ridePlan.toLocation)
                    .font(.system(size: HEADER_FONT_SIZE))
                    .padding([.trailing], 10)
                    .padding([.bottom], 10)
                    .padding([.top], 10)
                
                Spacer()
            }
            
            Text(ridePlan.startTime)
                //.foregroundColor(STACK_BORDER_COLOR_GRAY)
                .font(.system(size: BODY_FONT_SIZE))
                .padding([.leading, .trailing], 10)
                .padding([.top, .bottom], 1)
            
            
            //Divider()
                //.overlay(STACK_BORDER_COLOR_GRAY)
                //.padding([.top], 10)
                //.padding([.bottom], 20)
            HStack {
                Text("由高司機駕駛")
                    .font(.system(size: BODY2_FONT_SIZE))
                    .foregroundColor(STACK_BORDER_COLOR_GRAY)
                    //.padding([.leading, .trailing], 10)
                    .padding([.bottom], 5)
                
                Spacer()
                
                NavigationLink(value: "ChatListView") {
                    Button(action: {
                        print("Enter chat rooms button Clicked")
                        router.navPath.append("ChatListView")
                    }) {
                        Text("查看聊聊")
                    }
                    .buttonStyle(CapsuleButtonStyle(width: 90))
                    .padding([.bottom], 5)
                }
            }
            .padding([.leading, .trailing], 20)
            .padding([.top, .bottom], 10)
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

struct TripHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        TripHistoryView(ridePlan: ridePlan1)
    }
}

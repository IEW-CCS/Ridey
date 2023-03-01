//
//  TripInfoView2.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/15.
//

import SwiftUI

struct TripInfoView2: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var router: Router

    var ridePlan: RidePlan
        
    var body: some View {
        VStack(alignment: .leading) {
            Text(ridePlan.fromLocation + " → " + ridePlan.toLocation)
                .font(.system(size: HEADER_FONT_SIZE))
                .padding([.leading, .trailing], 10)
                .padding([.bottom], 1)
                .padding([.top], 10)
            
            Text(ridePlan.startTime)
                //.foregroundColor(STACK_BORDER_COLOR_GRAY)
                .font(.system(size: BODY_FONT_SIZE))
                .padding([.leading, .trailing], 10)
                .padding([.top, .bottom], 1)
            
            
            //Divider()
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
                        print("Contact driver button Clicked")
                        router.navPath.append("ChatListView")
                    }) {
                        Text("聯繫駕駛")
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

struct TripInfoView2_Previews: PreviewProvider {
    static var previews: some View {
        TripInfoView2(ridePlan: ridePlan1)
    }
}

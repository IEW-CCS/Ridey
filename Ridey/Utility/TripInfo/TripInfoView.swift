//
//  TripInfoView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/15.
//

import SwiftUI

struct TripInfoView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var router: Router
    //@State private var selection: Int? = nil

    var titleDisplay: Bool = false
    var ridePlan: RidePlan
    
    var body: some View {
        VStack(alignment: .leading) {
            if(self.titleDisplay) {
                HStack {
                    Image("clock_clockwise_icon")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 24, height: 24)
                    
                    Text("下一趟旅程")
                        .font(.system(size: HEADER_FONT_SIZE))
                }
                .padding([.leading, .trailing], 10)
                .padding([.top], 10)
                .padding([.bottom], 0)
            }
            
            Text(ridePlan.fromLocation + " → " + ridePlan.toLocation)
                .font(.system(size: HEADER_FONT_SIZE))
                .padding([.leading, .trailing], 10)
                .padding([.bottom], 1)
                .padding([.top], self.titleDisplay ? 1 : 10)
            
            Text(ridePlan.startTime)
                .font(.system(size: BODY_FONT_SIZE))
                .padding([.leading, .trailing], 10)
                .padding([.top, .bottom], 1)
            
            
            HStack {
                Text("由高司機駕駛")
                    .font(.system(size: BODY2_FONT_SIZE))
                    .foregroundColor(STACK_BORDER_COLOR_GRAY)
                    .padding([.bottom], 5)
                
                Spacer()
                NavigationLink(value: "ChatListView") {
                    Button(action: {
                        print("Contact driver buttonn clicked")
                        router.navPath.append("ChatListView")
                    }) {
                        Text("聯繫駕駛")
                    }
                    .buttonStyle(CapsuleButtonStyle(width: 90))
                    .padding([.bottom], 5)
                }
                /*
                .navigationDestination(for: String.self) { view in
                    if(view == "ChatListView") {
                        ChatListView()
                    }
                }*/

                NavigationLink(value: "ChatListView") {
                    Button(action: {
                        print("Enter chhat rooms buttonn clicked")
                        router.navPath.append("ChatListView")
                    }) {
                        Text("進入聊聊")
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
        .navigationTitle("")
        .navigationBarHidden(true)
        //.navigationDestination(for: String.self) { value in
        //    ChatListView()
        //}

    }
}

struct TripInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TripInfoView(titleDisplay: true, ridePlan: ridePlan1)
                .environmentObject(Router())
        }
    }
}

//
//  DrivePlanView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/15.
//

import SwiftUI

struct DrivePlanView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var router: Router

    var ridePlan: RidePlan
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(ridePlan.fromLocation + " → " + ridePlan.toLocation)
                .font(.system(size: HEADER_FONT_SIZE))
                .padding([.leading, .trailing], 10)
                .padding([.top], 10)
                .padding([.bottom], 1)
            
            Text(ridePlan.startTime)
                .foregroundColor(STACK_BORDER_COLOR_GRAY)
                .font(.system(size: BODY_FONT_SIZE))
                .padding([.leading, .trailing], 10)
                .padding([.top, .bottom], 1)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("已確認")
                        .font(.system(size: BODY_FONT_SIZE))
                        .padding([.top, .bottom], 5)
                    HStack {
                        Image(systemName: "person.circle")
                            .foregroundColor(.red)
                        Image(systemName: "person.circle")
                            .foregroundColor(.green)
                        Image(systemName: "person.circle")
                            .foregroundColor(.blue)
                    }
                    .padding([.top, .bottom], 1)
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("待確認請求")
                        .font(.system(size: BODY_FONT_SIZE))
                        .padding([.top, .bottom], 5)
                    HStack {
                        Image(systemName: "person.circle")
                            .foregroundColor(.red)
                        Image(systemName: "person.circle")
                            .foregroundColor(.green)
                        Image(systemName: "person.circle")
                            .foregroundColor(.blue)
                        Image(systemName: "person.circle")
                            .foregroundColor(.purple)
                    }
                    .padding([.top, .bottom], 1)
                }
            }
            .padding([.leading, .trailing], 10)
            .padding([.top, .bottom], 1)
            Divider()
                //.padding([.top], 10)
                //.padding([.bottom], 20)
            HStack {
                Button(action: { print("Button Clicked") }) {
                    Text("管理行程")
                }
                .buttonStyle(CapsuleButtonStyle())
                .padding([.leading, .trailing], 10)
                .padding([.top, .bottom], 5)
                
                Spacer()
                NavigationLink(value: "ChatListView") {
                    Button(action: {
                        print("Enter chhat rooms button Clicked")
                        router.navPath.append("ChatListView")
                    }) {
                        Text("進來聊聊")
                    }
                    .buttonStyle(CapsuleButtonStyle())
                    .padding([.leading, .trailing], 10)
                    .padding([.top, .bottom], 5)
                }
            }
            .padding([.leading, .trailing], 70)
            .padding([.top, .bottom], 3)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(STACK_BACKGROUND_COLOR_LIGHT_GRAY)
        .cornerRadius(5.0)
        .overlay(
            RoundedRectangle(cornerRadius: 5.0)
                .stroke(STACK_BORDER_COLOR_GRAY, lineWidth: 1))
        .padding([.leading, .trailing], 10)
        .padding([.top, .bottom], 1)
    }
}

struct DrivePlanView_Previews: PreviewProvider {
    static var previews: some View {
        DrivePlanView(ridePlan: ridePlan1)
    }
}

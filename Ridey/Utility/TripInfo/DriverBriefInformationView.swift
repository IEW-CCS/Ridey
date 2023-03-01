//
//  DriverBriefInformationView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/17.
//

import SwiftUI

struct DriverBriefInformationView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var router: Router

    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("駕駛資訊")
                    .font(.system(size: HEADER_FONT_SIZE))
                    .padding([.leading, .trailing], 20)
                HStack(alignment: .top) {
                    Image("spider_man")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .cornerRadius(30)
                        .padding([.trailing], 20)
                    VStack(alignment: .leading) {
                        HStack {
                            Text("SpiderMan")
                                .font(.system(size: BODY_FONT_SIZE))
                            
                            Spacer()
                            
                            Image(systemName: "star.fill")
                                .renderingMode(.template)
                                .foregroundColor(BACKGROUND_COLOR_ORANGE)
                            Text("4.7 共4則評價")
                                .font(.system(size: BODY2_FONT_SIZE))
                        }
                        .frame(width: .infinity)
                        .padding([.bottom], 5)
                        
                        Text("大家好，我是Spider Man，很高興認識你們。")
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 60).font(.system(size: 14))
                            .font(.system(size: BODY_FONT_SIZE))
                            .padding(10)
                            .foregroundColor(.black)
                            .background(BACKGROUND_COLOR_LIGHT_ORANGE)
                            .cornerRadius(10)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    
                    //Spacer()
                }
                .padding([.leading, .trailing], 20)
                Divider()
                    .frame(height: 1.0)
                    .overlay(STACK_BORDER_COLOR_GRAY)

            }
            .padding([.top, .bottom], 5)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("目前共乘人數：")
                        .foregroundColor(STACK_BORDER_COLOR_GRAY)
                        .font(.system(size: BODY_FONT_SIZE))
                    Text("2人")
                        .font(.system(size: BODY_FONT_SIZE))
                }
                .padding([.leading, .trailing], 20)
                
                HStack {
                    Text("提供行李載送：")
                        .foregroundColor(STACK_BORDER_COLOR_GRAY)
                        .font(.system(size: BODY_FONT_SIZE))
                    Text("每人1件")
                        .font(.system(size: BODY_FONT_SIZE))
                }
                .padding([.leading, .trailing], 20)
                Divider()
                    .frame(height: 1.0)
                    .overlay(STACK_BORDER_COLOR_GRAY)
            }
            .font(.system(size: 16))
            .padding([.top, .bottom], 5)

            
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("S.H.I.E.L.D Helicarrier")
                            .font(.system(size: BODY_FONT_SIZE))
                            .padding([.bottom], 5)
                        HStack {
                            Text("出廠年份：")
                                .foregroundColor(STACK_BORDER_COLOR_GRAY)
                                .font(.system(size: BODY_FONT_SIZE))
                            Text("2050 年")
                                .font(.system(size: BODY_FONT_SIZE))
                        }
                        
                        HStack {
                            Text("最大載客：")
                                .foregroundColor(STACK_BORDER_COLOR_GRAY)
                                .font(.system(size: BODY_FONT_SIZE))
                            Text("3200 人")
                                .font(.system(size: BODY_FONT_SIZE))
                        }
                    }
                    
                    Image("helicarrier")
                        .resizable()
                        .scaledToFit()
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100, maxHeight: 100)
                        .cornerRadius(15)
                }
                .padding([.leading, .trailing], 20)

                Text("車輛照片：")
                    .font(.system(size: HEADER2_FONT_SIZE))
                    .padding([.leading, .trailing], 20)
                    .foregroundColor(STACK_BORDER_COLOR_GRAY)
                
                HStack {
                    Image("helicarrier_inside1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .cornerRadius(15)
                    Image("helicarrier_inside2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .cornerRadius(15)
                }
                .padding([.leading, .trailing], 20)
                
                Divider()
                    .frame(height: 1.0)
                    .overlay(STACK_BORDER_COLOR_GRAY)
            }
            .font(.system(size: 16))
            .padding([.top, .bottom], 5)

            HStack {
                Spacer()
                Button(action: { print("Button Clicked") }) {
                    Text("詳細資訊")
                }
                .buttonStyle(CapsuleButtonStyle(width: 100))
                .padding([.top, .bottom], 5)
                
                Spacer()
                
                NavigationLink(value: "ChatListView") {
                    Button(action: {
                        print("Contact driver button Clicked")
                        router.navPath.append("ChatListView")
                    }) {
                        Text("聯繫駕駛")
                    }
                    .buttonStyle(CapsuleButtonStyle(width: 100))
                }

                Spacer()

            }
            .padding([.leading, .trailing], 20)
            .padding([.bottom], 10)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(STACK_BACKGROUND_COLOR_LIGHT_GRAY)
        .cornerRadius(15.0)
        .overlay(
            RoundedRectangle(cornerRadius: 15.0)
                .stroke(STACK_BORDER_COLOR_GRAY, lineWidth: 1))
    }
}

struct DriverBriefInformationView_Previews: PreviewProvider {
    static var previews: some View {
        DriverBriefInformationView()
    }
}

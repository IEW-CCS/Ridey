//
//  TripDescriptionView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/17.
//

import SwiftUI

struct TripDescriptionView: View {
    @State private var isMapPresented: Bool = false
    private var annotationItems = [AnnotatedItem(name: "Times Square", coordinate: .init(latitude: 40.75773, longitude: -73.985708))]
    
    var body: some View {
        
        VStack(alignment: .leading) {
           VStack(alignment: .leading) {
                Text("旅程資訊")
                    .font(.system(size: HEADER_FONT_SIZE))
                    .padding([.top, .bottom])
                    //.padding([.leading, .trailing], 20)
                
                Text("上車地點")
                    .foregroundColor(STACK_BORDER_COLOR_GRAY)
                    .font(.system(size: BODY_FONT_SIZE))

                Text("台北車站")
                    .font(.system(size: HEADER2_FONT_SIZE))
                
                
                HStack {
                    Text("台北市中正區北平西路3號 候車區")
                        .font(.system(size: BODY_FONT_SIZE))
                    Button(action: {isMapPresented = true} ) {
                        Image(systemName: "map")
                            .renderingMode(.template)
                            .foregroundColor(BORDER_COLOR_BLACK)
                    }
                }
                .padding([.bottom], 10)

                Text("下車地點")
                    .foregroundColor(STACK_BORDER_COLOR_GRAY)
                    .font(.system(size: BODY_FONT_SIZE))
                Text("台南車站")
                    .font(.system(size: HEADER2_FONT_SIZE))
                
                
                HStack {
                    Text("台南市東區前鋒路210號 前站出口")
                        .font(.system(size: BODY_FONT_SIZE))
                    
                    Button(action: {isMapPresented = true} ) {
                        Image(systemName: "map")
                            .renderingMode(.template)
                            .foregroundColor(BORDER_COLOR_BLACK)
                    }
                }
                .padding([.bottom], 10)
            }
            //.frame(minWidth: 0, maxWidth: .infinity)
            .padding([.leading, .trailing], 20)

            HStack {
                Spacer()
            }
            .padding(0)
            
            VStack(alignment: .leading) {
                Text("出發時間")
                    .foregroundColor(STACK_BORDER_COLOR_GRAY)
                    .font(.system(size: BODY_FONT_SIZE))
                Text("7月1日 上午11:30")
                    .font(.system(size: HEADER2_FONT_SIZE))
                    .padding([.bottom], 10)
                Text("費用總計")
                    .foregroundColor(STACK_BORDER_COLOR_GRAY)
                    .font(.system(size: BODY_FONT_SIZE))
                Text("NT$ 491")
                    .font(.system(size: HEADER2_FONT_SIZE))
                    .padding([.bottom], 10)

                Text("可獲得綠能點數")
                    .foregroundColor(STACK_BORDER_COLOR_GRAY)
                    .font(.system(size: BODY_FONT_SIZE))
                
                
                HStack(alignment: .top) {
                    Image("green_point_icon")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFit()

                        .foregroundColor(GREEN_POINT_COLOR_GREEN)
                        .frame(width: 20, height: 20)
                    Text("15點")
                        .font(.system(size: HEADER2_FONT_SIZE))
                        .foregroundColor(GREEN_POINT_COLOR_GREEN)
                        .padding([.bottom])
                }
            }
            //.frame(minWidth: 0, maxWidth: .infinity)
            .padding([.leading, .trailing], 20)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(STACK_BACKGROUND_COLOR_LIGHT_GRAY)
        .cornerRadius(15.0)
        .overlay(
            RoundedRectangle(cornerRadius: 15.0)
                .stroke(STACK_BORDER_COLOR_GRAY, lineWidth: 1))
        .sheet(isPresented: $isMapPresented) {
            ZStack {
                Color.black.opacity(0.5)
                    .background(BackgroundClearView())
                    //.blur(radius: 15)
                    .ignoresSafeArea()
                MapPopupView(isPresented: $isMapPresented)
            }
        }
    }
}

struct TripDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        TripDescriptionView()
    }
}

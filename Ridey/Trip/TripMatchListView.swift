//
//  TripMatchListView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/16.
//

import SwiftUI

struct TripMatchListView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack(alignment: .leading)  {
            //RideyTitleView()
            RideyLogoView(backHandler: { self.presentationMode.wrappedValue.dismiss() })
            
            Text("7月1日 09:00 - 21:00")
                .font(.system(size: BODY_FONT_SIZE))
                .padding([.leading, .trailing])
                .padding([.bottom], 5)
            HStack {
                Spacer()
                Text("本時段共有5趟共乘可供配對")
                    .font(.system(size: BODY_FONT_SIZE))
                    .padding([.trailing], 20)
                    .foregroundColor(STACK_BORDER_COLOR_GRAY)
            }
            .padding([.bottom], 5)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    
                    ForEach(0...4, id: \.self) { index in
                        
                        //Text("TripMatchListView index: \(index)")
                        
                        NavigationLink(value: "TripDetail\(index)") {
                            TripPossibleMatchView(tripInfo: tripInfoList[index])
                        }
                        .accentColor(BORDER_COLOR_BLACK)
                    }

                    Text("找不到理想的共乘嗎？")
                        .font(.system(size: BODY_FONT_SIZE))
                        .padding([.leading, .trailing], 20)
                        .padding([.top], 10)
                        .foregroundColor(STACK_BORDER_COLOR_GRAY)
                    
                    HStack(alignment: .center) {
                        Button(action: { self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("提出共乘需求")
                        }
                        .buttonStyle(BasicButtonStyle())

                        Text("或")
                        
                        Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                            Text("重新尋找共乘")
                        }
                        .buttonStyle(BasicButtonStyle())
                    }
                    .padding([.top], 5)
                }
                //.navigationDestination(for: String.self) { index in
                //    TripDetailView()
                //}
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct TripMatchListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TripMatchListView()
                .environmentObject(Router())
        }
        
    }
}

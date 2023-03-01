//
//  TripDetailView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/16.
//

import SwiftUI

struct TripDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack(alignment: .leading)  {
            //RideyTitleView()
            RideyLogoView(backHandler: { self.presentationMode.wrappedValue.dismiss() })
            
            ScrollView {
                VStack(alignment: .leading) {
                    HeaderTextView(text: "共乘行程")
                    
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            HStack(alignment: .top) {
                                Image("chinese_start_icon")
                                    .resizable()
                                    .frame(width: 22, height: 22)
                                
                                Text("台北市")
                                    .foregroundColor(STACK_BORDER_COLOR_GRAY)
                                    .font(.system(size: HEADER2_FONT_SIZE))
                                Spacer()
                            }
                            Text("台北車站")
                                .font(.system(size: HEADER_FONT_SIZE))
                                .padding([.bottom], 5)
                        }
                        .padding([.leading, .trailing], 20)
                        
                        VStack(alignment: .leading) {
                            HStack(alignment: .top) {
                                Image("chinese_arrive_icon")
                                    .resizable()
                                    .frame(width: 22, height: 22)
                                
                                Text("台南市")
                                    .foregroundColor(STACK_BORDER_COLOR_GRAY)
                                    .font(.system(size: HEADER2_FONT_SIZE))
                                Spacer()
                            }
                            Text("台南車站")
                                .font(.system(size: HEADER_FONT_SIZE))
                                .padding([.bottom], 5)
                            
                        }
                        .padding([.leading, .trailing], 20)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("7月1日 上午11:30")
                            .font(.system(size: BODY_FONT_SIZE))
                        Text("309公里。約4小時3分鐘")
                            .font(.system(size: BODY_FONT_SIZE))

                    }
                    .padding([.leading, .trailing], 20)
                    
                    DriverBriefInformationView()
                        .padding([.leading, .trailing], 20)
                        .padding([.top])
                    
                    TripDescriptionView()
                        .padding([.leading, .trailing], 20)
                    
                    HStack {
                        Spacer()
                        
                        NavigationLink(value: "TripApplyView") {
                            Button(action: {
                                print("Apply trip button clicked")
                                router.navPath.append("TripApplyView")
                            }) {
                                Text("申請共乘")
                            }
                            .buttonStyle(ActiveCapsuleButtonStyle(width: 90))
                            .padding([.leading, .trailing], 20)
                            .padding([.top], 20)
                        }

                        Spacer()
                    }
                    Spacer()
                }
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct TripDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TripDetailView()
                .environmentObject(Router())
        }
       
    }
}

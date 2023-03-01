//
//  ContentView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/1/28.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @EnvironmentObject var router: Router
    @EnvironmentObject var registerUser: RegisterUser

    @State private var presentAlert = false
    @State private var alertMessage = ""
    @State private var selectedTab: Int = 0
    
    var body: some View {
        VStack(alignment: .leading)  {
            
            VStack {
                HStack(alignment: .top) {
                    RideyLogoView(backHandler: { })
                    
                    Spacer()
                    
                    if(registerUser.isRegisterUser) {
                        NavigationLink(value: "MemberMainView") {
                            Image("spider_man")
                                .resizable()
                                .frame(width: 60, height:60)
                                .clipShape(Circle())
                                .overlay(RoundedRectangle(cornerRadius: 30.0)
                                        .stroke(BUTTON_COLOR_ORANGE, lineWidth: 2))
                                .padding([.leading, .trailing], 20)
                        }
                    } else {
                        NavigationLink(value: "LoginView") {
                            HeaderTextView(text: "登入\\註冊")
                        }
                    }
                }
                
                ScrollView {
                    CustomSegmentedView3(selectedSegment: $selectedTab, segments: ["尋找共乘", "創造共乘"])
                        .padding([.top, .bottom], 10)
                        .padding([.leading, .trailing], 10)
                    
                    if(selectedTab == 0) {
                        SearchTripView()
                    } else {
                        CreateTripView()
                    }
                    
                    HStack {
                        Image("member_icon")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(ICON_FOREGROUND_COLOR)
                            .frame(width: 60, height:60)
                            .clipShape(Circle()).overlay(RoundedRectangle(cornerRadius: 30.0)
                                    .stroke(BUTTON_COLOR_ORANGE, lineWidth: 2))
                            .onTapGesture {
                                presentAlert = true
                                alertMessage = "會員申請"
                            }
                        Spacer()
                        
                        NavigationLink(value: "DriverApplyView") {
                            Image("driver_icon")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(ICON_FOREGROUND_COLOR)
                                .frame(width: 60, height:60)
                                .clipShape(Circle()).overlay(RoundedRectangle(cornerRadius: 30.0)
                                        .stroke(BUTTON_COLOR_ORANGE, lineWidth: 2))
                        }
                        
                        Spacer()
                        Image("hall_icon")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(ICON_FOREGROUND_COLOR)
                            .frame(width: 60, height:60)
                            .clipShape(Circle()).overlay(RoundedRectangle(cornerRadius: 30.0)
                                    .stroke(BUTTON_COLOR_ORANGE, lineWidth: 2))
                            .onTapGesture {
                                presentAlert = true
                                alertMessage = "共乘大廳"
                            }
                    }
                    .padding(.horizontal, 80)
                    .padding([.top], 15)
                    .padding([.bottom], 1)
                    
                    Spacer()
                }
                .alert("功能訊息", isPresented: $presentAlert, actions: {
                    
                }, message: {
                    Text(alertMessage)
                })
            }
        }
        .navigationDestination(for: String.self) { viewName in
            
            if(viewName == "MemberMainView") {
                MemberMainView()
            } else if(viewName == "MemberTripListView") {
                MemberTripListView()
            }  else if(viewName == "TripMatchListView") {
                TripMatchListView()
            } else if(viewName == "TripCreateCompleteView") {
                TripCreateCompleteView()
            } else if(viewName == "TripApplyView") {
                TripApplyView()
            } else if(viewName == "LoginView") {
                LoginView()
            } else if(viewName == "RegisterGoogleView") {
                RegisterGoogleView()
            } else if(viewName == "RegisterEMailView") {
                RegisterEMailView()
            } else if(viewName == "RegisterEMailVerificationView") {
                RegisterEMailVerificationView()
            } else if(viewName == "RegisterOTPVerificationView") {
                RegisterOTPVerificationView()
            } else if(viewName == "RegisterMemberView") {
                RegisterMemberView()
            } else if(viewName == "RegisterCompleteView") {
                RegisterCompleteView()
            } else if(viewName == "DriverApplyView") {
                DriverApplyView()
            } else if(viewName == "DriverIDImageView") {
                DriverIDImageView()
            } else if(viewName == "DriverMemberDataView") {
                DriverMemberDataView()
            } else if(viewName == "DriverCarDataView") {
                DriverCarDataView()
            } else if(viewName == "DriverCompleteView") {
                DriverCompleteView()
            }  else if(viewName == "ChatListView") {
                ChatListView()
            } else {
                TripDetailView()
            }
        }
        .onTapGesture {
            hideKeyboard()
        }

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView()
                .environmentObject(Router())
                .environmentObject(RegisterUser())
        }
        
    }
}

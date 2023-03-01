//
//  MemberView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/1/29.
//

import SwiftUI

struct MemberMainView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var router: Router
    
    var body: some View {
        
        VStack(spacing: 8) {
            
            MemberNavBar(backHandler: { self.presentationMode.wrappedValue.dismiss()
            }, title: "會員專區")
                //.padding([.top], 10)
                //.padding([.bottom], 0)
            ScrollView {
                VStack {
                    
                    MemberProfileView()
                    
                    TripInfoView(titleDisplay: true, ridePlan: ridePlan1)
                        .padding([.top], 70)
                }

                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Image("text_book_icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        //Spacer()
                        Text("我的旅程")
                            .font(.system(size: TITLE_FONT_SIZE))
                            .bold()
                        Spacer()
                    }
                    //.frame(width: .infinity)
                    .padding([.leading, .trailing], 30)
                    
                    
                    HStack {
                        Text("預定共乘")
                            .font(.system(size: HEADER_FONT_SIZE))
                            .foregroundColor(STACK_BORDER_COLOR_GRAY)
                        Spacer()
                        
                        NavigationLink(value: "MemberTripListView") {
                            Button(action: {
                                print("Reserved trip button cclicked")
                                router.navPath.append("MemberTripListView")
                            }) {
                                Image("double_arrow_right_icon")
                                    .resizable()
                                    .renderingMode(.template)
                                    .foregroundColor(BORDER_COLOR_BLACK)
                                    .scaledToFit()
                                    .frame(width: 20, height:20)
                            }
                        }
                    }
                    .padding([.leading], 50)
                    .padding([.trailing], 40)
                    .padding([.top], 20)
                    
                    HStack {
                        Text("已完成共乘")
                            .font(.system(size: HEADER_FONT_SIZE))
                            .foregroundColor(STACK_BORDER_COLOR_GRAY)
                        Spacer()
                        
                        NavigationLink(value: "MemberTripListView") {
                            Button(action: {
                                print("Reserved trip button cclicked")
                                router.navPath.append("MemberTripListView")
                            }) {
                                Image("double_arrow_right_icon")
                                    .resizable()
                                    .renderingMode(.template)
                                    .foregroundColor(BORDER_COLOR_BLACK)
                                    .scaledToFit()
                                    .frame(width: 20, height:20)
                            }
                        }
                    }
                    .padding([.leading], 50)
                    .padding([.trailing], 40)
                    .padding([.top], 20)
                }
                .padding([.top], 15)
                
                Divider()
                    .frame(height: 1)
                    .overlay(STACK_BORDER_COLOR_GRAY)
                    .padding([.leading, .trailing], 30)
                    
                VStack(alignment: .leading) {
                    HStack {
                        Image("person_icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        //Spacer()
                        Text("個人資料")
                            .font(.system(size: TITLE_FONT_SIZE))
                            .bold()
                        Spacer()
                    }
                    //.frame(width: .infinity)
                    .padding([.leading, .trailing], 30)
                    
                    HStack {
                        Text("會員資料編輯")
                            .font(.system(size: HEADER_FONT_SIZE))
                            .foregroundColor(STACK_BORDER_COLOR_GRAY)
                        Spacer()
                        
                        Button(action: {  }) {
                            
                            Image("double_arrow_right_icon")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(BORDER_COLOR_BLACK)
                                .scaledToFit()
                            .frame(width: 20, height:20)}
 
                    }
                    //.frame(width: .infinity)
                    .padding([.leading], 50)
                    .padding([.trailing], 40)
                    .padding([.top], 5)
                }
                .padding([.top], 15)
                Divider()
                    .frame(height: 1)
                    .overlay(STACK_BORDER_COLOR_GRAY)
                    .padding([.leading, .trailing], 30)

                VStack(alignment: .leading) {
                    HStack(spacing: 10) {
                        Image("question_mark_icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)

                        //Spacer()
                        Text("其他")
                            .font(.system(size: TITLE_FONT_SIZE))
                            .bold()
                        Spacer()
                    }
                    //.frame(width: .infinity)
                    .padding([.leading, .trailing], 30)
                    
                    HStack {
                        Text("聯絡我們")
                            .font(.system(size: HEADER_FONT_SIZE))
                            .foregroundColor(STACK_BORDER_COLOR_GRAY)
                        Spacer()
                        
                        Button(action: {  }) {
                            
                            Image("double_arrow_right_icon")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(BORDER_COLOR_BLACK)
                                .scaledToFit()
                            .frame(width: 20, height:20)}
                                
                            
                    }
                    //.frame(width: .infinity)
                    .padding([.leading], 50)
                    .padding([.trailing], 40)
                    //.padding([.top], 5)
                    
                    HStack {
                        Text("隱私權中心")
                            .font(.system(size: HEADER_FONT_SIZE))
                            .foregroundColor(STACK_BORDER_COLOR_GRAY)
                        Spacer()
                        
                        Button(action: {  }) {
                            
                            Image("double_arrow_right_icon")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(BORDER_COLOR_BLACK)
                                .scaledToFit()
                            .frame(width: 20, height:20)}
                                
                            
                    }
                    //.frame(width: .infinity)
                    .padding([.leading], 50)
                    .padding([.trailing], 40)
                    //.padding([.top], 5)
                }
                .padding([.top], 15)
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct MemberMainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MemberMainView()
                .environmentObject(Router())
        }
    }
}

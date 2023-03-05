//
//  DriverIDImageView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/10.
//

import SwiftUI

struct DriverIDImageView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var router: Router
    @State private var isGoodPeopleDisplay: Bool = false

    var body: some View {
        VStack {
            //RideyTitleView()
            RideyLogoView(backHandler: { self.presentationMode.wrappedValue.dismiss() })
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        HeaderTextView(text: "成為共乘駕駛")
                        Spacer()
                        CapsuleLabelView(label: "證件上傳")
                        Text("2/4")
                            .padding([.top, .trailing], 20)
                    }
                    
                    Text(DRIVER_ID_IMAGE_DESCRIPTION)
                        .padding(20)
                        .font(.system(size: 16))
                    
                    VStack(alignment: .leading) {
                        Text("身分證")
                            .font(.system(size: 20))
                            .padding([.leading, .trailing], 20)
                            .padding([.bottom], 2)
                        
                        HStack(spacing: 15) {
                            TitleImageView(imageName: "", title: "正面", imageDescription: IMAGE_BACKGROUND_TEXT1)
                            
                            TitleImageView(imageName: "", title: "反面", imageDescription: IMAGE_BACKGROUND_TEXT2)
                        }
                        .padding([.leading, .trailing], 20)
                    }

                    VStack(alignment: .leading) {
                        Text("本人與證件自拍照")
                            .font(.system(size: 20))
                            .padding([.top], 10)
                            .padding([.bottom], 2)
                        Text(DRIVER_ID_IMAGE_DESCRIPTION2)
                            .padding([.top, .bottom], 2)
                            .font(.system(size: 16))
                        TitleImageView(imageName: "", title: "", imageDescription: IMAGE_BACKGROUND_TEXT2, isTitleShow: false, width: 160)
                    }
                    .padding([.leading, .trailing], 20)

                    VStack(alignment: .leading) {
                        Text("駕照")
                            .font(.system(size: 20))
                            .padding([.top], 10)
                            .padding([.leading, .trailing], 20)
                            .padding([.bottom], 2)
                        
                        HStack(spacing: 15) {
                            TitleImageView(imageName: "", title: "正面", imageDescription: IMAGE_BACKGROUND_TEXT2)
                            
                            TitleImageView(imageName: "", title: "反面", imageDescription: IMAGE_BACKGROUND_TEXT2)
                        }
                        .padding([.leading, .trailing], 20)
                    }

                    VStack(alignment: .leading) {
                        Text("行照")
                            .font(.system(size: 20))
                            .padding([.top], 10)
                            .padding([.leading, .trailing], 20)
                            .padding([.bottom], 2)
                        
                        HStack {
                            Spacer()
                            TitleImageView(imageName: "", title: "正面", imageDescription: IMAGE_BACKGROUND_TEXT2, width: 150, height: 180)
                            Spacer()
                            TitleImageView(imageName: "", title: "反面", imageDescription: IMAGE_BACKGROUND_TEXT2, width: 150, height: 180)
                            Spacer()
                        }
                        .padding([.leading, .trailing], 20)
                    }
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("良民證及無肇事證明")
                                .font(.system(size: 20))
                                .padding([.leading, .trailing], 20)
                                .padding([.bottom], 2)
                             Spacer()
                            Button(action: { self.isGoodPeopleDisplay = !self.isGoodPeopleDisplay }) {
                                HStack {
                                    Image(systemName: self.isGoodPeopleDisplay ? "arrowtriangle.up" : "arrowtriangle.down")
                                        .resizable()
                                        .frame(width: 14, height:14)
                                    Text(self.isGoodPeopleDisplay ? "收合" : "展開")
                                        .font(.system(size: 14))
                                }
                                .foregroundColor(STACK_BORDER_COLOR_GRAY)
                                .padding([.leading, .trailing], 20)
                                .padding([.bottom], 2)
                                
                            }
                        }

                        Text(DRIVER_GOOD_PEOPLE_PROOF)
                            .padding([.leading, .trailing], 20)
                            .padding([.top, .bottom], 2)
                            .font(.system(size: 16))

                        if(self.isGoodPeopleDisplay) {
                            HStack {
                                Spacer()
                                TitleImageView(imageName: "", title: "良民證", imageDescription: IMAGE_BACKGROUND_TEXT2, width: 150, height: 180)
                                Spacer()
                                TitleImageView(imageName: "", title: "無肇事證明", imageDescription: IMAGE_BACKGROUND_TEXT2, width: 150, height: 180)
                                Spacer()
                            }
                            .padding([.leading, .trailing], 20)
                        }
                    }
                    
                    NavigationLink(value: "DriverMemberDataView") {
                        Button(action: {
                            print("Next button Clicked")
                            router.navPath.append("DriverMemberDataView")
                        }) {
                            Text("下一步")
                        }
                        .buttonStyle(ActiveCapsuleButtonStyle())
                        .padding([.top], 20)
                    }
                    
                    Spacer()
                }
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct DriverIDImageView_Previews: PreviewProvider {
    static var previews: some View {
        DriverIDImageView()
            .environmentObject(Router())
            .environmentObject(RegisterUser())
    }
}

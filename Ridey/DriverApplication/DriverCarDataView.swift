//
//  DriverCarDataView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/10.
//

import SwiftUI

struct DriverCarDataView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var router: Router
    
    @State var carBrand: String = ""
    @State var isCarBrandDisplay: Bool = false
    @State var carYear: String = ""
    @State var carNumber: String = ""
    
    var body: some View {
        VStack {
            //RideyTitleView()
            RideyLogoView(backHandler: { self.presentationMode.wrappedValue.dismiss() })
            
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        HeaderTextView(text: "成為共乘駕駛")
                        Spacer()
                        CapsuleLabelView(label: "車輛資訊")
                        Text("4/4")
                            .padding([.top, .trailing], 20)
                            
                    }
                    
                    Text(DRIVER_CAR_WELCOME_DESCRIPTION)
                        .padding(20)
                        .font(.system(size: 16))
                    
                    VStack {
                        SelectionButtonView(title: "車輛廠牌", buttonText: $carBrand, isPressed: $isCarBrandDisplay)
                        
                        TitleTextEditorView(title: "車輛出廠年份（民國年）", inputText: $carYear)
                            .padding([.top], 15)
                            .keyboardType(.numberPad)
     
                        TitleTextEditorView(title: "車牌號碼", inputText: $carNumber)
                            .padding([.top], 15)
                            .keyboardType(.default)
                    }

                    VStack(alignment: .leading) {
                        Text("車輛外觀")
                            .font(.system(size: HEADER2_FONT_SIZE))
                            .padding([.bottom], 2)
                        
                        TitleImageView(imageName: "", title: "", imageDescription: IMAGE_BACKGROUND_TEXT2, isTitleShow: false, width: 160)
                    }
                    .padding([.leading, .trailing], 20)
                    .padding([.top], 15)
                    
                    VStack(alignment: .leading) {
                        Text("其他車輛照片（如內裝、其他外觀）")
                            .font(.system(size: HEADER2_FONT_SIZE))
                            .padding([.bottom], 2)
                        
                        TitleImageView(imageName: "", title: "", imageDescription: "+", isTitleShow: false, width: 80, height: 80)
                        
                        Text("最多可上傳5張照片")
                            .frame(width: .infinity)
                            .font(.system(size: 14))
                            .foregroundColor(STACK_BORDER_COLOR_GRAY)
                            .padding([.trailing], 20)
                    }
                    .padding([.leading, .trailing], 20)
                    .padding([.top], 15)
                    
                    HStack {
                        Spacer()
                        NavigationLink(value: "DriverCompleteView") {
                            Button(action: {
                                print("Save button Clicked")
                                router.navPath.append("DriverCompleteView")
                            }) {
                                Text("略過")
                            }
                            .buttonStyle(CapsuleButtonStyle(width: 90))
                            .padding([.leading], 20)
                        }

                        Spacer()
                        
                        NavigationLink(value: "DriverCompleteView") {
                            Button(action: {
                                print("Ignore button Clicked")
                                router.navPath.append("DriverCompleteView")
                            }) {
                                Text("儲存")
                            }
                            .buttonStyle(ActiveCapsuleButtonStyle(width: 90))
                        }
                        
                        Spacer()
                    }
                    .padding([.top], 20)
                    
                    Spacer()
                }
            }
        }
        .onSubmit {
            hideKeyboard()
        }
        .onTapGesture {
            hideKeyboard()
        }

        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct DriverCarDataView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DriverCarDataView()
                .environmentObject(Router())
                .environmentObject(RegisterUser())
        }
        
    }
}

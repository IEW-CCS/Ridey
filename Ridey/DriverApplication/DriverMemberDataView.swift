//
//  DriverMemberDataView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/10.
//

import SwiftUI

struct DriverMemberDataView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var router: Router
    
    @State var driverIntroduction: String = ""
    @State var driverExxperience: String = ""
    @State var driverFavorite: String = ""
    @State var driverSchool: String = ""
    @State var driverGraduate: String = "畢業"
    @State var isSmoke: String = ""
    @State var isYearDisplay: Bool = false
    @State var isFavoriteDisplay: Bool = false
    @State var isGraduateDisplay: Bool = false
    @State var selectedSmokingTab: Int = -1
    @State var selectedPetTab: Int = -1
    
    var body: some View {
        VStack {
            //RideyTitleView()
            RideyLogoView(backHandler: { self.presentationMode.wrappedValue.dismiss() })
            
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        HeaderTextView(text: "成為共乘駕駛")
                        Spacer()
                        CapsuleLabelView(label: "駕駛資訊")
                        Text("3/4")
                            .padding([.top, .trailing], 20)
                            
                    }
                    
                    VStack(alignment: .trailing) {
                        Text(DRIVER_INFO_WELCOME_DESCRIPTION)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding(15)
                            .font(.system(size: 16))

                        TitleTextEditorView(title: "駕駛自我介紹", inputText: $driverIntroduction, lineNumber: 3)
                       
                        Text("最多可填入50個字")
                            .font(.system(size: 14))
                            .foregroundColor(STACK_BORDER_COLOR_GRAY)
                            .padding([.trailing], 20)
                    }
                    
                    VStack {
                        SelectionButtonView(title: "您的駕駛經驗", buttonText: $driverExxperience, isPressed: $isYearDisplay)
                        if(self.isYearDisplay) {
                            BasicGridView(dataArray: DRIVE_YEAR, columns: 3, selectedData: $driverExxperience, isPresented: $isYearDisplay)
                                .frame(width: .infinity)
                                .font(.system(size: 24))
                                .overlay(RoundedRectangle(cornerRadius: 5.0)
                                        .stroke(STACK_BORDER_COLOR_GRAY, lineWidth: 2))
                                .padding()
                                
                        }

                        SelectionButtonView(title: "您開車偏好的氛圍", buttonText: $driverFavorite, isPressed: $isFavoriteDisplay)
                        
                        if(self.isFavoriteDisplay) {
                            BasicGridView(dataArray: DRIVE_FAVORITE, columns: 2, selectedData: $driverFavorite, isPresented: $isFavoriteDisplay)
                                .frame(width: .infinity)
                                .font(.system(size: 24))
                                .overlay(RoundedRectangle(cornerRadius: 5.0)
                                        .stroke(STACK_BORDER_COLOR_GRAY, lineWidth: 2))
                                .padding()
                        }
                        
                        HStack(alignment: .bottom) {
                            TitleTextEditorView(title: "您的最高學歷(非必填)", inputText: $driverSchool)
                                .padding([.top], 15)
                            SelectionButtonView(title: "", isTitleDisplay: false,  buttonText: $driverGraduate, width: 80, isPressed: $isGraduateDisplay)
                        }
                        TitleTextEditorView(title: "Covid-19疫苗接種劑數(非必填)", inputText: $driverSchool)
                            .padding([.top], 15)
                            .keyboardType(.numberPad)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("抽菸習慣")
                            .font(.system(size: 18))
                            .padding([.leading, .trailing], 20)
                            .padding([.top], 15)
                        
                        CustomSegmentedView4(selectedSegment: $selectedSmokingTab, segments: ["有", "無", "未指定"])
                            .padding([.leading, .trailing], 20)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("接受乘客攜帶寵物")
                            .font(.system(size: 18))
                            .padding([.leading, .trailing], 20)
                            .padding([.top], 15)
                        
                        CustomSegmentedView4(selectedSegment: $selectedPetTab, segments: ["是", "否", "未指定"])
                            .padding([.leading, .trailing], 20)
                        
                    }
                    
                    NavigationLink(value: "DriverCarDataView") {
                        Button(action: {
                            print("Next button Clicked")
                            router.navPath.append("DriverCarDataView")
                        }) {
                            Text("下一步")
                        }
                        .buttonStyle(ActiveCapsuleButtonStyle())
                        .padding([.top, .bottom], 20)
                    }

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

struct DriverMemberDataView_Previews: PreviewProvider {
    static var previews: some View {
        DriverMemberDataView()
            .environmentObject(Router())
            .environmentObject(RegisterUser())
    }
}

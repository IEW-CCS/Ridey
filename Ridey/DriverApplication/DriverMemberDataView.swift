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
    
    @State private var driverSchool: String = ""
    @State private var driverGraduate: String = "畢業"
    @State private var isSmoke: String = ""
    @State private var isYearDisplay: Bool = false
    @State private var isFavoriteDisplay: Bool = false
    @State private var isGraduateDisplay: Bool = false
    
    @State private var selectedSmokingTab: Int = -1
    @State private var selectedPetTab: Int = -1

    @State private var driverIntroduction: String = ""
    @State private var driverExperience: String = ""
    @State private var driverFavorite: String = ""
    @State private var driverSmoke: String = ""
    @State private var driverPet: String = ""
    
    @State private var driverIntroductionTip: String = ""
    @State private var driverExxperienceTip: String = ""
    @State private var driverFavoriteTip: String = ""
    @State private var driverSmokeTip: String = ""
    @State private var driverPetTip: String = ""

    enum DriverValidationTip: Int {
        case na = 0
        case introduction = 1
        case experience = 2
        case favorite = 3
        case smoke = 4
        case pet = 5
        
        var text: String {
            switch self {
                case .na: return ""
                case .introduction: return "請輸入自我介紹"
                case .experience: return "請選擇駕駛經驗"
                case .favorite: return "請選擇偏好氛圍"
                case .smoke: return "請選擇抽菸習慣"
                case .pet: return "請選擇是否接受乘客攜帶寵物"
            }
        }
    }

    
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

                        TitleTextEditorView(title: "駕駛自我介紹", inputText: $driverIntroduction, lineNumber: 3, validationTip: $driverIntroductionTip)
                       
                        Text("最多可填入50個字")
                            .font(.system(size: 14))
                            .foregroundColor(STACK_BORDER_COLOR_GRAY)
                            .padding([.trailing], 20)
                    }
                    
                    VStack {
                        SelectionButtonView(title: "您的駕駛經驗", buttonText: $driverExperience, isPressed: $isYearDisplay, validationTip: $driverExxperienceTip)
                            .padding(.vertical, 10)
                        
                        if(self.isYearDisplay) {
                            BasicGridView(dataArray: DRIVE_YEAR, columns: 3, selectedData: $driverExperience, isPresented: $isYearDisplay)
                                .frame(width: .infinity)
                                .font(.system(size: 24))
                                .overlay(RoundedRectangle(cornerRadius: 5.0)
                                        .stroke(STACK_BORDER_COLOR_GRAY, lineWidth: 2))
                                .padding()
                                
                        }

                        SelectionButtonView(title: "您開車偏好的氛圍", buttonText: $driverFavorite, isPressed: $isFavoriteDisplay, validationTip: $driverFavoriteTip)
                            .padding(.vertical, 10)
                        
                        if(self.isFavoriteDisplay) {
                            BasicGridView(dataArray: DRIVE_FAVORITE, columns: 2, selectedData: $driverFavorite, isPresented: $isFavoriteDisplay)
                                .frame(width: .infinity)
                                .font(.system(size: 24))
                                .overlay(RoundedRectangle(cornerRadius: 5.0)
                                        .stroke(STACK_BORDER_COLOR_GRAY, lineWidth: 2))
                                .padding()
                        }
                        
                        HStack(alignment: .bottom) {
                            TitleTextEditorView(title: "您的最高學歷(非必填)", inputText: $driverSchool, validationTip: .constant(""))
                                .padding([.top], 15)
                            SelectionButtonView(title: "", isTitleDisplay: false,  buttonText: $driverGraduate, width: 80, isPressed: $isGraduateDisplay, validationTip: .constant(""))
                        }
                        TitleTextEditorView(title: "Covid-19疫苗接種劑數(非必填)", inputText: $driverSchool, validationTip: .constant(""))
                            .padding([.top], 15)
                            .keyboardType(.numberPad)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("抽菸習慣")
                            .font(.system(size: 18))
                            .padding([.leading, .trailing], 20)
                            .padding([.top], 15)
                        
                        CustomSegmentedView4(selectedSegment: $selectedSmokingTab, segments: ["有", "無", "未指定"], value: $driverSmoke, validationTip: $driverSmokeTip)
                            .padding([.leading, .trailing], 20)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("接受乘客攜帶寵物")
                            .font(.system(size: 18))
                            .padding([.leading, .trailing], 20)
                            .padding([.top], 15)
                        
                        CustomSegmentedView4(selectedSegment: $selectedPetTab, segments: ["是", "否", "未指定"], value: $driverPet, validationTip: $driverPetTip)
                            .padding([.leading, .trailing], 20)
                    }
                    
                    NavigationLink(value: "DriverCarDataView") {
                        Button(action: {
                            print("Next button Clicked")
                            if(!driverValidation()) {
                                return
                            }
                            
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
    
    func driverValidation() -> Bool {
        var result: Bool = true

        driverIntroductionTip = self.driverIntroduction.isEmpty ? DriverValidationTip.introduction.text : DriverValidationTip.na.text
        result = self.driverIntroduction.isEmpty ? false : true

        driverExxperienceTip = self.driverExperience.isEmpty ? DriverValidationTip.experience.text : DriverValidationTip.na.text
        result = self.driverExperience.isEmpty ? false : true

        driverFavoriteTip = self.driverFavorite.isEmpty ? DriverValidationTip.favorite.text : DriverValidationTip.na.text
        result = self.driverFavorite.isEmpty ? false : true

        driverSmokeTip = (self.selectedSmokingTab == -1) ? DriverValidationTip.smoke.text : DriverValidationTip.na.text
        result = (self.selectedSmokingTab == -1) ? false : true

        driverPetTip = (self.selectedPetTab == -1) ? DriverValidationTip.pet.text : DriverValidationTip.na.text
        result = (self.selectedPetTab == -1) ? false : true

        return result
    }

}

struct DriverMemberDataView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DriverMemberDataView()
                .environmentObject(Router())
                .environmentObject(RegisterUser())
        }
    }
}

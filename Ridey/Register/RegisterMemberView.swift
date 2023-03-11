//
//  RegisterMemberView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/9.
//

import SwiftUI

struct RegisterMemberView: View {
    @State var model: RegisterMemberViewModel
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var router: Router
    @EnvironmentObject var userAuthInfo: UserAuthInfo

    @State private var isAlertPresented: Bool = false
    @State private var alertMessage: String = ""

    @State private var selectedGenderTab: Int = -1
    @State private var isOtherGenderDisplay: Bool = false
    @State private var isOtherRelationshipDisplay: Bool = false

    @State private var personalData: HttpAuthPersonalData = HttpAuthPersonalData()
    @State private var registerCompleteViewModel: RegisterCompleteViewModel = RegisterCompleteViewModel()
    
    @State var realNameTip: String = ""
    @State var nickNameTip: String = ""
    @State var genderTip: String = ""
    @State var birthdayTip: String = ""
    @State var idNumberTip: String = ""
    @State var addressTip: String = ""
    @State var emergencyNameTip: String = ""
    @State var emergencyPhoneTip: String = ""
    @State var emergencyRelationshipTip: String = ""

    enum MemberValidationTip: Int {
        case na = 0
        case realname = 1
        case nickname = 2
        case gender = 3
        case birthday = 4
        case idnumber = 5
        case address = 6
        case emergencyname = 7
        case emergencyphonenumber = 8
        case emergencyrelation = 9
        
        var text: String {
            switch self {
                case .na: return ""
                case .realname: return "請輸入真實姓名"
                case .nickname: return "請輸入暱稱"
                case .gender: return "請輸入性別"
                case .birthday: return "請輸入生日"
                case .idnumber: return "請輸入身分證字號"
                case .address: return "請輸入通訊地址"
                case .emergencyname: return "請輸入緊急聯絡人姓名"
                case .emergencyphonenumber: return "請輸入緊急聯絡人手機號碼"
                case .emergencyrelation: return "請輸入與緊急聯絡人之關係"
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
                        HeaderTextView(text: "會員註冊")
                        Spacer()
                        CapsuleLabelView(label: "會員個人資料")
                        Text("3/3")
                            .padding([.top, .trailing], 20)
                    }
                    
                    VStack {
                        TitleTextEditorView(title: "真實姓名", inputText: $personalData.trueName, validationTip: $realNameTip)
                            .padding([.top], 15)
                        
                        TitleTextEditorView(title: "顯示名稱/暱稱", inputText: $personalData.displayName, validationTip: $nickNameTip)
                            .padding([.top], 10)
                        
                        VStack(alignment: .leading) {
                            Text("性別")
                                .font(.system(size: 18))
                                .padding([.leading, .trailing], 20)
                                .padding([.top], 15)
                            
                            CustomSegmentedView4(selectedSegment: $selectedGenderTab, segments: ["男", "女", "其他"], value: $personalData.gender, validationTip: $genderTip)
                                .padding([.leading, .trailing], 20)
                            
                            if(selectedGenderTab == 2) {
                                TitleTextEditorView(title: "請填入您的性別", inputText: $personalData.gender, validationTip: $genderTip)
                                    .padding([.top], 10)
                            }
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        TitleTextEditorView(title: "出生日期", inputText: $personalData.birthday, validationTip: $birthdayTip)
                            .padding([.top], 15)
                        
                        TitleTextEditorView(title: "身分證字號", inputText: $personalData.identityNumber, validationTip: $idNumberTip)
                            .padding([.top], 10)
                        
                        TitleTextEditorView(title: "通訊地址", inputText: $personalData.mailingAddress, validationTip: $addressTip)
                            .padding([.top], 10)
                        
                        TitleTextEditorView(title: "緊急聯絡人", inputText: $personalData.emergencyContactName, validationTip: $emergencyNameTip)
                            .padding([.top], 10)
                        
                        TitleTextEditorView(title: "緊急聯絡人電話", inputText: $personalData.emergencyContactNumber, validationTip: $emergencyPhoneTip)
                            .padding([.top], 10)
                            .keyboardType(.numberPad)
                        
                        TitleTextEditorView(title: "緊急聯絡人與本人關係", inputText: $personalData.emergencyContactRelationsip, validationTip: $emergencyRelationshipTip)
                             .padding([.top], 10)
                        
                        if(isOtherRelationshipDisplay) {
                            TitleTextEditorView(title: "請輸入：", inputText: $personalData.emergencyContactRelationsip, validationTip: $emergencyRelationshipTip)
                                .padding([.top], 15)
                        }
                    }

                    NavigationLink(value: self.registerCompleteViewModel) {
                        Button(action: {
                            print("Complete button Clicked")
                            if(!memberValidation()) {
                                return
                            }

                            personalData.phone = model.phoneNumber
                            
                            httpAuthPersonalData(person: self.personalData, personCallback: { (reply, error) in
                                if(reply == nil) {
                                    print("httpAuthPersonalData failed")
                                    self.alertMessage = error.message
                                    isAlertPresented = true
                                } else {
                                    print("httpAuthPersonalData successful")
                                    userAuthInfo.memberSignupStatus = MemberSignupStatus.complete.text
                                    DispatchQueue.main.async {
                                        router.navPath.append(registerCompleteViewModel)
                                    }
                                }
                            })

                            //router.navPath.append(registerCompleteViewModel)
                        }) {
                            Text("完成")
                        }
                        .buttonStyle(ActiveCapsuleButtonStyle())
                        .padding([.top], 20)
                    }
                    .navigationDestination(for: RegisterCompleteViewModel.self) { model in
                        RegisterCompleteView(model: self.registerCompleteViewModel)
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
        .alert("錯誤訊息", isPresented: $isAlertPresented, actions: {
            
        }, message: {
            Text(alertMessage)
        })
        .navigationTitle("")
        .navigationBarHidden(true)
    }
    
    func memberValidation() -> Bool {
        var result: Bool = true

        realNameTip = self.personalData.trueName.isEmpty ? MemberValidationTip.realname.text : MemberValidationTip.na.text
        result = self.personalData.trueName.isEmpty ? false : true

        nickNameTip = self.personalData.displayName.isEmpty ? MemberValidationTip.nickname.text : MemberValidationTip.na.text
        result = self.personalData.displayName.isEmpty ? false : true

        genderTip = self.personalData.gender.isEmpty ? MemberValidationTip.gender.text : MemberValidationTip.na.text
        result = (self.selectedGenderTab == -1) ? false : true

        birthdayTip = self.personalData.birthday.isEmpty ? MemberValidationTip.birthday.text : MemberValidationTip.na.text
        result = self.personalData.birthday.isEmpty ? false : true

        idNumberTip = self.personalData.identityNumber.isEmpty ? MemberValidationTip.idnumber.text : MemberValidationTip.na.text
        result = self.personalData.identityNumber.isEmpty ? false : true

        addressTip = self.personalData.mailingAddress.isEmpty ? MemberValidationTip.address.text : MemberValidationTip.na.text
        result = self.personalData.mailingAddress.isEmpty ? false : true

        emergencyNameTip = self.personalData.emergencyContactName.isEmpty ? MemberValidationTip.emergencyname.text : MemberValidationTip.na.text
        result = self.personalData.emergencyContactName.isEmpty ? false : true

        emergencyPhoneTip = self.personalData.emergencyContactNumber.isEmpty ? MemberValidationTip.emergencyphonenumber.text : MemberValidationTip.na.text
        result = self.personalData.emergencyContactNumber.isEmpty ? false : true

        emergencyRelationshipTip = self.personalData.emergencyContactRelationsip.isEmpty ? MemberValidationTip.emergencyrelation.text : MemberValidationTip.na.text
        result = self.personalData.emergencyContactRelationsip.isEmpty ? false : true

        return result
    }

}

struct RegisterMemberView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RegisterMemberView(model: RegisterMemberViewModel())
                .environmentObject(Router())
                .environmentObject(RegisterUser())
                .environmentObject(UserAuthInfo())
        }
        
    }
}

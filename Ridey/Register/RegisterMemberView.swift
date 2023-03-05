//
//  RegisterMemberView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/9.
//

import SwiftUI

struct RegisterMemberView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var router: Router
    
    @State var selectedGenderTab: Int = -1
    @State var isOtherGenderDisplay: Bool = false
    @State var isOtherRelationshipDisplay: Bool = false

    @State var realName: String = ""
    @State var nickName: String = ""
    @State var gender: String = ""
    @State var birthday: String = ""
    @State var idNumber: String = ""
    @State var address: String = ""
    @State var emergencyName: String = ""
    @State var emergencyPhone: String = ""
    @State var emergencyRelationship: String = ""
    @State var otherEmergencyRelationship: String = ""

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
                        TitleTextEditorView(title: "真實姓名", inputText: $realName, validationTip: $realNameTip)
                            .padding([.top], 15)
                        
                        TitleTextEditorView(title: "顯示名稱/暱稱", inputText: $nickName, validationTip: $nickNameTip)
                            .padding([.top], 10)
                        
                        VStack(alignment: .leading) {
                            Text("性別")
                                .font(.system(size: 18))
                                .padding([.leading, .trailing], 20)
                                .padding([.top], 15)
                            
                            CustomSegmentedView4(selectedSegment: $selectedGenderTab, segments: ["男", "女", "其他"], validationTip: $genderTip)
                                .padding([.leading, .trailing], 20)
                            
                            if(selectedGenderTab == 2) {
                                TitleTextEditorView(title: "請填入您的性別", inputText: $gender, validationTip: $genderTip)
                                    .padding([.top], 10)
                            }
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        TitleTextEditorView(title: "出生日期", inputText: $birthday, validationTip: $birthdayTip)
                            .padding([.top], 15)
                        
                        TitleTextEditorView(title: "身分證字號", inputText: $idNumber, validationTip: $idNumberTip)
                            .padding([.top], 10)
                        
                        TitleTextEditorView(title: "通訊地址", inputText: $address, validationTip: $addressTip)
                            .padding([.top], 10)
                        
                        TitleTextEditorView(title: "緊急聯絡人", inputText: $emergencyName, validationTip: $emergencyNameTip)
                            .padding([.top], 10)
                        
                        TitleTextEditorView(title: "緊急聯絡人電話", inputText: $emergencyPhone, validationTip: $emergencyPhoneTip)
                            .padding([.top], 10)
                            .keyboardType(.numberPad)
                        
                        TitleTextEditorView(title: "緊急聯絡人與本人關係", inputText: $emergencyRelationship, validationTip: $emergencyRelationshipTip)
                             .padding([.top], 10)
                        
                        if(isOtherRelationshipDisplay) {
                            TitleTextEditorView(title: "請輸入：", inputText: $otherEmergencyRelationship, validationTip: $emergencyRelationshipTip)
                                .padding([.top], 15)
                        }
                    }
                    
                    NavigationLink(value: "RegisterCompleteView") {
                        Button(action: {
                            print("Complete button Clicked")
                            if(!memberValidation()) {
                                return
                            }
                            router.navPath.append("RegisterCompleteView")
                        }) {
                            Text("完成")
                        }
                        .buttonStyle(ActiveCapsuleButtonStyle())
                        .padding([.top], 20)
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
    
    func memberValidation() -> Bool {
        var result: Bool = true

        realNameTip = self.realName.isEmpty ? MemberValidationTip.realname.text : MemberValidationTip.na.text
        result = self.realName.isEmpty ? false : true

        nickNameTip = self.nickName.isEmpty ? MemberValidationTip.nickname.text : MemberValidationTip.na.text
        result = self.nickName.isEmpty ? false : true

        //genderTip = self.gender.isEmpty ? MemberValidationTip.gender.text : MemberValidationTip.na.text
        //result = self.gender.isEmpty ? false : true
        
        genderTip = (self.selectedGenderTab == -1) ? MemberValidationTip.gender.text : MemberValidationTip.na.text
        result = (self.selectedGenderTab == -1) ? false : true

        birthdayTip = self.birthday.isEmpty ? MemberValidationTip.birthday.text : MemberValidationTip.na.text
        result = self.birthday.isEmpty ? false : true

        idNumberTip = self.idNumber.isEmpty ? MemberValidationTip.idnumber.text : MemberValidationTip.na.text
        result = self.idNumber.isEmpty ? false : true

        addressTip = self.address.isEmpty ? MemberValidationTip.address.text : MemberValidationTip.na.text
        result = self.address.isEmpty ? false : true

        emergencyNameTip = self.emergencyName.isEmpty ? MemberValidationTip.emergencyname.text : MemberValidationTip.na.text
        result = self.emergencyName.isEmpty ? false : true

        emergencyPhoneTip = self.emergencyPhone.isEmpty ? MemberValidationTip.emergencyphonenumber.text : MemberValidationTip.na.text
        result = self.emergencyPhone.isEmpty ? false : true

        emergencyRelationshipTip = self.emergencyRelationship.isEmpty ? MemberValidationTip.emergencyrelation.text : MemberValidationTip.na.text
        result = self.emergencyRelationship.isEmpty ? false : true

        return result
    }

}

struct RegisterMemberView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RegisterMemberView()
                .environmentObject(Router())
                .environmentObject(RegisterUser())
        }
        
    }
}

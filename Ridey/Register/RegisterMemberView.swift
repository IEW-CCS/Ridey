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
    @State var selectedGenderTab: Int = -1
    
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
                        TitleTextEditorView(title: "真實姓名", inputText: $realName)
                            .padding([.top], 15)
                        
                        TitleTextEditorView(title: "顯示名稱/暱稱", inputText: $nickName)
                            .padding([.top], 10)
                        
                        VStack(alignment: .leading) {
                            Text("性別")
                                .font(.system(size: 18))
                                .padding([.leading, .trailing], 20)
                                .padding([.top], 15)
                            
                            CustomSegmentedView4(selectedSegment: $selectedGenderTab, segments: ["男", "女", "其他"])
                                .padding([.leading, .trailing], 20)
                            
                            if(selectedGenderTab == 2) {
                                TitleTextEditorView(title: "請填入您的性別", inputText: $gender)
                                    .padding([.top], 10)
                            }
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        TitleTextEditorView(title: "出生日期", inputText: $birthday)
                            .padding([.top], 15)
                        
                        TitleTextEditorView(title: "身分證字號", inputText: $idNumber)
                            .padding([.top], 10)
                        
                        TitleTextEditorView(title: "通訊地址", inputText: $address)
                            .padding([.top], 10)
                        
                        TitleTextEditorView(title: "緊急聯絡人", inputText: $emergencyName)
                            .padding([.top], 10)
                        
                        TitleTextEditorView(title: "緊急聯絡人電話", inputText: $emergencyPhone)
                            .padding([.top], 10)
                            .keyboardType(.numberPad)
                        
                        TitleTextEditorView(title: "緊急聯絡人與本人關係", inputText: $emergencyRelationship)
                             .padding([.top], 10)
                        
                        if(isOtherRelationshipDisplay) {
                            TitleTextEditorView(title: "請輸入：", inputText: $otherEmergencyRelationship)
                                .padding([.top], 15)
                        }
                    }
                    
                    NavigationLink(value: "RegisterCompleteView") {
                        Button(action: {
                            print("Complete button Clicked")
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

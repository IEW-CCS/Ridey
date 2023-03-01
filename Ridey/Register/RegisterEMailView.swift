//
//  RegisterEMailView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/9.
//

import SwiftUI

struct RegisterEMailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var router: Router
    
    @State private var agreementChecked: Bool = false
    @State var email: String = ""
    @State var pwd: String = ""
    @State var pwd2: String = ""
    
    var body: some View {
        VStack {
            //RideyTitleView()
            RideyLogoView(backHandler: { self.presentationMode.wrappedValue.dismiss() })
            
            ScrollView {
                VStack(alignment: .leading){
                    HStack {
                        HeaderTextView(text: "會員註冊")
                        Spacer()
                        CapsuleLabelView(label: "登入資料")
                        Text("1/3")
                            .padding([.top, .trailing], 20)
                            
                    }
                    
                    Text(REGISTER_WELCOME_DESCRIPTION2)
                        .padding(20)
                        .font(.system(size: 16))
                    
                    TitleTextEditorView(title: "電子信箱", inputText: $email)
                        .keyboardType(.emailAddress)
                    
                    TitleTextEditorView(title: "密碼", inputText: $pwd)
                        .padding([.top], 15)
                        
                    TitleTextEditorView(title: "再次輸入密碼", inputText: $pwd2)
                        .padding([.top], 15)
                    
                    MemoView(title: "會員條款", content: membershipTerms)
                        .padding([.top], 25)
                    
                    CheckBoxView(id: "1",
                                 label: "我已詳閱會員條款",
                                 size: 24,
                                 textSize: TITLE_FONT_SIZE,
                                 callback: checkboxSelected)
                    .padding(20)
                    
                    NavigationLink(value: "RegisterEMailVerificationView") {
                        Button(action: {
                            print("Register button Clicked")
                            router.navPath.append("RegisterEMailVerificationView")
                        }) {
                            Text("註冊成為會員")
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

struct RegisterEMailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RegisterEMailView()
                .environmentObject(Router())
                .environmentObject(RegisterUser())
        }
        
    }
}

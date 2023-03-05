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
    
    @State private var isAlertPresented: Bool = false
    //@State private var alertTitle: String = ""
    @State private var alertMessage: String = ""

    @State private var isChecked: Bool = false

    @State private var email: String = ""
    @State private var pwd: String = ""
    @State private var pwd2: String = ""
    @State private var terms: String = ""
    @State private var emailTip: String = ""
    @State private var pwdTip: String = ""
    @State private var pwd2Tip: String = ""
    @State private var termsTip: String = ""

    enum RegisterEmailTip: Int {
        case na = 0
        case email = 1
        case pwd = 2
        case pwd2 = 3
        case termsNG = 4
        case termsOK = 5
        case pwdwrong = 6
        
        var text: String {
            switch self {
                case .na: return ""
                case .email: return "請輸入電子信箱"
                case .pwd: return "請輸入密碼"
                case .pwd2: return "請再次輸入密碼"
                case .termsNG: return "請完整閱讀上方的會員條款"
                case .termsOK: return "請勾選以進行下一步"
                case .pwdwrong: return "密碼請輸入至少8個英文或數字"
            }
        }
    }

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
                    
                    TitleTextEditorView(title: "電子信箱", inputText: $email, validationTip: $emailTip)
                        .keyboardType(.emailAddress)
                    
                    TitleTextEditorView(isSecured: true, title: "密碼", inputText: $pwd, validationTip: $pwdTip)
                        .padding([.top], 15)
                        
                    TitleTextEditorView(isSecured: true, title: "再次輸入密碼", inputText: $pwd2, validationTip: $pwd2Tip)
                        .padding([.top], 15)
                    
                    MemoView(title: "會員條款", content: membershipTerms, isChecked: $isChecked, validationTip: $termsTip)
                        .padding([.top], 25)
                    
                    NavigationLink(value: "RegisterEMailVerificationView") {
                        Button(action: {
                            print("Register button Clicked")
                            if(!registerEmailValidation()) {
                                return
                            }

                            httpAuthSignUp(signup: HttpAuthSignup(email: email, password: pwd), signUpCallback:  { (reply, error) in
                                if(reply == nil) {
                                    print("httpAuthSignUp failed")
                                    self.alertMessage = error.message
                                    isAlertPresented = true
                                } else {
                                    router.navPath.append("RegisterEMailView")
                                }
                            })
                            //router.navPath.append("RegisterEMailVerificationView")
                        }) {
                            Text("註冊成為會員")
                        }
                        .buttonStyle(ActiveCapsuleButtonStyle())
                        .padding([.top, .bottom], 20)
                    }
                    .buttonStyle(.plain)

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
    
    func registerEmailValidation() -> Bool {
        var result: Bool = true

        emailTip = self.email.isEmpty ? RegisterEmailTip.email.text : RegisterEmailTip.na.text
        result = self.email.isEmpty ? false : true

        pwdTip = self.pwd.isEmpty ? RegisterEmailTip.pwd.text : RegisterEmailTip.na.text
        result = self.pwd.isEmpty ? false : true

        /*
        pwdTip = (!self.pwd.isEmpty && (self.pwd.lengthOfBytes(using: .utf8) < 8)) ? RegisterEmailTip.pwdwrong.text : RegisterEmailTip.na.text
        result = (!self.pwd.isEmpty && (self.pwd.lengthOfBytes(using: .utf8) < 8)) ? false : true*/

        pwd2Tip = self.pwd2.isEmpty ? RegisterEmailTip.pwd2.text : RegisterEmailTip.na.text
        result = self.pwd2.isEmpty ? false : true

        /*
        pwd2Tip = (!self.pwd2.isEmpty && (self.pwd2.lengthOfBytes(using: .utf8) < 8)) ? RegisterEmailTip.pwdwrong.text : RegisterEmailTip.na.text
        result = (!self.pwd2.isEmpty && (self.pwd2.lengthOfBytes(using: .utf8) < 8)) ? false : true*/

        termsTip = !self.isChecked ? RegisterEmailTip.termsOK.text : RegisterEmailTip.na.text
        result = !isChecked ? false : true

        return result
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

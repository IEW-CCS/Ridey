//
//  LoginView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/8.
//

import SwiftUI
import UIKit

struct LoginView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var router: Router
    @EnvironmentObject var registerUser: RegisterUser
    @EnvironmentObject var userAuthInfo: UserAuthInfo

    @State private var isAlertPresented: Bool = false
    @State private var alertMessage: String = ""
    
    @State private var email: String = ""
    @State private var pwd: String = ""
    @State private var emailTip: String = ""
    @State private var pwdTip: String = ""
    
    @FocusState private var focusField: FocusField?
    
    enum FocusField {
        case email, password
    }
    
    enum LoginValidationTip: Int {
        case na = 0
        case email = 1
        case pwd = 2
        
        var text: String {
            switch self {
                case .na: return ""
                case .email: return "請輸入電子信箱"
                case .pwd: return "請輸入密碼"
            }
        }
    }

    
    var body: some View {
        VStack(alignment: .leading){
            //RideyTitleView()
            
            RideyLogoView(backHandler: { self.presentationMode.wrappedValue.dismiss() })
            
            HeaderTextView(text: "會員登入")
            
            NavigationLink(value: "RegisterGoogleView") {
                Button(action: {
                    print("Google login button Clicked")
                    router.navPath.append("RegisterGoogleView")
                }) {
                    HStack {
                        Image("google_icon")
                            .resizable()
                            .frame(width: 30, height:30)
                        Text("使用Google帳號登入")
                    }
                }
                .buttonStyle(BasicButtonStyle())
                .padding([.top], 20)
            }
            
            VStack(alignment: .center) {
                Text("或")
                    .font(.system(size: TITLE_FONT_SIZE))
                    .padding([.top, .bottom], 20)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding([.top, .bottom], 20)

            BasicTextEditorView(inputText: $email, placeHolder: .constant("電子郵件"), validationTip: $emailTip)
                .focused($focusField, equals: .email)
                .keyboardType(.emailAddress)

            BasicTextEditorView(isSecured: true, inputText: $pwd, placeHolder: .constant("密碼"), validationTip: $pwdTip)
                .focused($focusField, equals: .password)
                .padding([.top], 15)
                .keyboardType(.default)

            HStack {
                Spacer()

                NavigationLink(value: "RegisterEMailView") {
                    Button(action: {
                        print("Register Email button Clicked")
                        initializeUserAuthInfo()
                        router.navPath.append("RegisterEMailView")
                    }) {
                        Text("註冊會員")
                    }
                    .buttonStyle(CapsuleButtonStyle(width: 120))
                    .padding([.top, .bottom], 5)
                }
                .buttonStyle(.plain)
                
                Spacer()
                
                Button(action: {
                    print("Login button Clicked")
                    if(!loginValidation()) {
                        return
                    }

                    httpAuthLogin(login: HttpAuthLogin(email: email, password: pwd), loginCallback:  { (reply, error) in
                        if(reply == nil) {
                            print("httpAuthLogin failed")
                            self.alertMessage = error.message
                            isAlertPresented = true
                        } else {
                            registerUser.setRegistered()
                            DispatchQueue.main.async {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        }
                    })
                }) {
                    Text("登入")
                }
                .buttonStyle(ActiveCapsuleButtonStyle(width: 120))
            }
            .padding([.top, .bottom], 20)
            .padding([.leading, .trailing], 20)
            
            Spacer()
        }
        .onSubmit {
            hideKeyboard()
            focusField = nil
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
    
    func loginValidation() -> Bool {
        var result: Bool = true

        emailTip = self.email.isEmpty ? LoginValidationTip.email.text : LoginValidationTip.na.text
        result = self.email.isEmpty ? false : true

        pwdTip = self.pwd.isEmpty ? LoginValidationTip.pwd.text : LoginValidationTip.na.text
        result = self.pwd.isEmpty ? false : true
        
        return result
    }
    
    func initializeUserAuthInfo() {
        print("Initialize UserAuthInfo.")
        self.userAuthInfo.userId = ""
        self.userAuthInfo.userToken = ""
        self.userAuthInfo.email = ""
        self.userAuthInfo.password = ""
        self.userAuthInfo.phoneNumber = ""
        self.userAuthInfo.memberSignupStatus = ""
        self.userAuthInfo.driverApplyStatus = ""
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LoginView()
                .environmentObject(Router())
                .environmentObject(RegisterUser())
                .environmentObject(UserAuthInfo())
        }
        
    }
}

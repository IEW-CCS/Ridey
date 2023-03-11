//
//  RegisterEMailVerificationView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/9.
//

import SwiftUI

struct RegisterEMailVerificationView: View {
    @State var model: RegisterEMailVerificationViewModel
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var router: Router
    @EnvironmentObject var userAuthInfo: UserAuthInfo

    @State private var testToken: String = ""
    @State private var isAlertPresented: Bool = false
    @State private var alertMessage: String = ""

    @State private var timeRemaining = 30
    @State private var secondString: String = "30"
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var registerOTPVerificationViewModel: RegisterOTPVerificationViewModel = RegisterOTPVerificationViewModel()

    var body: some View {
        VStack {
            //RideyTitleView()
            RideyLogoView(backHandler: { self.presentationMode.wrappedValue.dismiss() })

            ScrollView {
                VStack {
                    Image("mail_icon")
                        .resizable()
                        .frame(width: 140, height: 100)
                        .foregroundColor(BORDER_COLOR_ORANGE)
                        .padding([.top], 50)
                    
                    Text("驗證電子郵件")
                        .font(.system(size: EXTREME_LARGE_TITLE_FONT_SIZE))
                        .bold()
                        .padding([.top], 20)
                    
                    Text(REGISTER_EMAIL_VERIFICATION_DESCRIPTION)
                        .font(.system(size: HEADER_FONT_SIZE))
                        .padding([.leading, .trailing, .top], 20)
                    
                    Text(self.model.email)
                        .font(.system(size: HEADER_FONT_SIZE))
                        .padding([.leading, .trailing], 20)
                    
                    //Text(REGISTER_EMAIL_VERIFICATION_DESCRIPTION2)
                    Text("沒有收到信件？ \(secondString)  秒後可以重新寄送郵件。如果您想用其他電子信箱註冊會員，請登出並重新登入或註冊。")
                        .font(.system(size: HEADER_FONT_SIZE))
                        .padding([.leading, .trailing, .top], 20)
                    
                    //For testing prupose
                    TitleTextEditorView(title: "測試用：輸入 Verify Email Token", inputText: $testToken, lineNumber: 3, validationTip: .constant(""))
                        .padding(.vertical, 20)
                    //For testing prupose

                    NavigationLink(value: self.registerOTPVerificationViewModel) {
                        Button(action: {
                            print("Next button Clicked to verify OTP code")
                            registerOTPVerificationViewModel.userId = model.userId
                            registerOTPVerificationViewModel.userToken = model.userToken
                            //registerOTPVerificationViewModel.userToken = self.testToken
                            userAuthInfo.memberSignupStatus = MemberSignupStatus.verify_email.text

                            httpAuthVerifyMail(verifyMail: HttpAuthVerifyMail(token: self.testToken), verifyMailCallback: { (reply, error) in
                                if(reply == nil) {
                                    print("httpAuthVerifyMail failed")
                                    self.alertMessage = error.message
                                    isAlertPresented = true
                                } else {
                                    print("httpAuthVerifyMail successful")
                                    //userAuthInfo.memberSignupStatus = MemberSignupStatus.verify_email.text
                                    DispatchQueue.main.async {
                                        //userAuthInfo.userToken = self.testToken
                                        router.navPath.append(registerOTPVerificationViewModel)
                                    }
                                }
                            })
                        }) {
                            Text("下一步")
                        }
                        .buttonStyle(ActiveCapsuleButtonStyle())
                        .padding([.top], 20)
                    }
                    .navigationDestination(for: RegisterOTPVerificationViewModel.self) { model in
                        RegisterOTPVerificationView(model: model)
                    }
                    
                    Spacer()
                }
            }
        }
        .onReceive(timer) { time in
            if(timeRemaining > 0) {
                timeRemaining -= 1
                secondString = "\(timeRemaining)"
            }
        }
        .alert("錯誤訊息", isPresented: $isAlertPresented, actions: {
            
        }, message: {
            Text(alertMessage)
        })
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct RegisterEMailVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RegisterEMailVerificationView(model: RegisterEMailVerificationViewModel(email: "example@carpool.com"))
                .environmentObject(Router())
                .environmentObject(RegisterUser())
                .environmentObject(UserAuthInfo())
        }
    }
}

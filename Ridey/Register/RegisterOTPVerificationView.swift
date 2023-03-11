//
//  RegisterOTPVerificationView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/9.
//

import SwiftUI

struct RegisterOTPVerificationView: View {
    @State var model: RegisterOTPVerificationViewModel
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var router: Router
    @EnvironmentObject var userAuthInfo: UserAuthInfo

    @State private var isAlertPresented: Bool = false
    @State private var alertMessage: String = ""

    @State private var phoneNumber: String = ""
    @State private var otpCode: String = ""
    @State private var phoneNumberTip: String = ""
    @State private var otpCodeTip: String = ""
    
    @State private var registerMemberViewModel: RegisterMemberViewModel = RegisterMemberViewModel()
    
    enum OTPValidationTip: Int {
        case na = 0
        case phonenumber = 1
        case otp = 2
        
        var text: String {
            switch self {
                case .na: return ""
                case .phonenumber: return "請輸入手機號碼"
                case .otp: return "請輸入驗證碼"
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
                        CapsuleLabelView(label: "手機聯絡號碼")
                        Text("2/3")
                            .padding([.top, .trailing], 20)
                    }
                    
                    Text(REGISTER_OTP_VERIFICATION_DESCRIPTION)
                        .font(.system(size: 18))
                        .padding([.leading, .trailing, .top], 20)
                    
                    
                    HStack(alignment: .bottom) {
                        TitleTextEditorView(title: "手機聯絡號碼", inputText: $phoneNumber, validationTip: $phoneNumberTip)
                            .keyboardType(.numberPad)
                        
                        Button(action: {
                            print("Button Send Verification SMS Clicked")
                            httpAuthSendVerificationSMS(sendVerificationSMS: HttpAuthSendVerificationSMS(phone: self.phoneNumber), sendVerificationSMSCallback: { (reply, error) in
                                if(reply == nil) {
                                    print("httpAuthSendVerificationSMS failed")
                                    self.alertMessage = error.message
                                    isAlertPresented = true
                                } else {
                                    print("httpAuthSendVerificationSMS successful")
                                }
                            })
                        }) {
                            Text("傳送簡訊")
                        }
                        .font(.system(size: 18)).frame(minWidth: 0, maxWidth: 80, minHeight: 14, maxHeight: 14)
                        .padding()
                        .foregroundColor(.white)
                        .background(BUTTON_COLOR_ORANGE)
                        .cornerRadius(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5.0)
                                .stroke(BUTTON_COLOR_ORANGE, lineWidth: 1))
                        .padding([.trailing], 20)
                        .padding([.bottom], 1)
                        
                    }
                    .padding([.top], 15)
                    
                    TitleTextEditorView(title: "驗證碼", inputText: $otpCode, width: 120, validationTip: $otpCodeTip)
                        .padding([.top], 15)
                        .keyboardType(.numberPad)
                    
                    NavigationLink(value: self.registerMemberViewModel) {
                        Button(action: {
                            print("Next button Clicked to input member data")
                            registerMemberViewModel.userId = model.userId
                            registerMemberViewModel.userToken = model.userToken
                            registerMemberViewModel.phoneNumber = self.phoneNumber
                            userAuthInfo.phoneNumber = self.phoneNumber
                            userAuthInfo.memberSignupStatus = MemberSignupStatus.verify_sms.text
                            if(!otpValidation()) {
                                return
                            }

                            httpAuthVerifySMS(verifySMS: HttpAuthVerifySMS(token: self.otpCode), verifySMSCallback: { (reply, error) in
                                if(reply == nil) {
                                    print("httpAuthVerifySMS failed")
                                    self.alertMessage = error.message
                                    isAlertPresented = true
                                } else {
                                    print("httpAuthVerifySMS successful")
                                    userAuthInfo.memberSignupStatus = MemberSignupStatus.verify_sms.text
                                    DispatchQueue.main.async {
                                        router.navPath.append(registerMemberViewModel)
                                    }
                                }
                            })
                        }) {
                            Text("下一步")
                        }
                        .buttonStyle(ActiveCapsuleButtonStyle())
                        .padding([.top], 20)
                    }
                    .navigationDestination(for: RegisterMemberViewModel.self) { model in
                        RegisterMemberView(model: model)
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
    
    func otpValidation() -> Bool {
        var result: Bool = true

        phoneNumberTip = self.phoneNumber.isEmpty ? OTPValidationTip.phonenumber.text : OTPValidationTip.na.text
        result = self.phoneNumber.isEmpty ? false : true

        otpCodeTip = self.otpCode.isEmpty ? OTPValidationTip.otp.text : OTPValidationTip.na.text
        result = self.otpCode.isEmpty ? false : true
        
        return result
    }

}

struct RegisterOTPVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RegisterOTPVerificationView(model: RegisterOTPVerificationViewModel())
                .environmentObject(Router())
                .environmentObject(RegisterUser())
                .environmentObject(UserAuthInfo())
        }
        
    }
}

//
//  RegisterOTPVerificationView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/9.
//

import SwiftUI

struct RegisterOTPVerificationView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var router: Router
    
    @State private var phoneNumber: String = ""
    @State private var otpCode: String = ""
    @State private var phoneNumberTip: String = ""
    @State private var otpCodeTip: String = ""
    
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
                        
                        Button(action: { print("Button Clicked") }) {
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
                    
                    NavigationLink(value: "RegisterMemberView") {
                        Button(action: {
                            print("Next button Clicked")
                            if(!otpValidation()) {
                                return
                            }
                            
                            router.navPath.append("RegisterMemberView")
                        }) {
                            Text("下一步")
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
            RegisterOTPVerificationView()
                .environmentObject(Router())
                .environmentObject(RegisterUser())
        }
        
    }
}

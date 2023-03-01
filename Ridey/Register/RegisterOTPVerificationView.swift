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
    
    @State var phoneNumber: String = ""
    @State var otpCode: String = ""
    
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
                        TitleTextEditorView(title: "手機聯絡號碼", inputText: $phoneNumber)
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
                    
                    TitleTextEditorView(title: "驗證碼", inputText: $otpCode, width: 120)
                        .padding([.top], 15)
                        .keyboardType(.numberPad)
                    
                    NavigationLink(value: "RegisterMemberView") {
                        Button(action: {
                            print("Next button Clicked")
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

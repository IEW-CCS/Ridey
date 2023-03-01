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

    @State var email: String = ""
    @State var pwd: String = ""
    
    enum FocusField {
        case email, password
    }
    
    @FocusState private var focusField: FocusField?
    
    
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
            
            BasicTextEditorView(inputText: $email, placeHolder: .constant("電子郵件"))
                .focused($focusField, equals: .email)
                .keyboardType(.emailAddress)

            
            BasicTextEditorView(inputText: $pwd, placeHolder: .constant("密碼"))
                .focused($focusField, equals: .password)
                .padding([.top], 15)
                .keyboardType(.default)
            
            HStack {
                Spacer()
                
                NavigationLink(value: "RegisterEMailView") {
                    Button(action: {
                        print("Register Email button Clicked")
                        
                        httpAuthSignUp(signup: HttpAuthSignup(email: "roboood84@gmail.com", password: "12345678"), signUpCallback:  { reply in
                            if(reply == nil) {
                                
                            } else {
                                router.navPath.append("RegisterEMailView")
                            }
                        })
                        //router.navPath.append("RegisterEMailView")
                    }) {
                        Text("註冊會員")
                    }
                    .buttonStyle(CapsuleButtonStyle(width: 120))
                    .padding([.top, .bottom], 5)
                }

                Spacer()
                
                Button(action: {
                    registerUser.setRegistered()
                    self.presentationMode.wrappedValue.dismiss()
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
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

/*
func httpAuthSignupReplyCallback(reply: HttpAuthSignupReply?) {
    if(reply == nil) {
        
    } else {
        
    }
}
*/

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LoginView()
                .environmentObject(Router())
                .environmentObject(RegisterUser())
        }
        
    }
}

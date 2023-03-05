//
//  RegisterEMailVerificationView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/9.
//

import SwiftUI

struct RegisterEMailVerificationView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var router: Router
    
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
                        .font(.system(size: 30))
                        .bold()
                        .padding([.top], 20)
                    
                    Text(REGISTER_EMAIL_VERIFICATION_DESCRIPTION)
                        .font(.system(size: 18))
                        .padding([.leading, .trailing, .top], 20)
                    
                    Text("example@carpool.com")
                        .font(.system(size: 18))
                        .padding([.leading, .trailing], 20)
                    
                    Text(REGISTER_EMAIL_VERIFICATION_DESCRIPTION2)
                        .font(.system(size: 18))
                        .padding([.leading, .trailing, .top], 20)
                    
                    NavigationLink(value: "RegisterOTPVerificationView") {
                        Button(action: {
                            print("Next button Clicked")
                            router.navPath.append("RegisterOTPVerificationView")
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
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct RegisterEMailVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RegisterEMailVerificationView()
                .environmentObject(Router())
                .environmentObject(RegisterUser())
        }
        
    }
}

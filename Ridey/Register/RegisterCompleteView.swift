//
//  RegisterCompleteView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/9.
//

import SwiftUI

struct RegisterCompleteView: View {
    @State var model: RegisterCompleteViewModel
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var router: Router
    @EnvironmentObject var registerUser: RegisterUser
    
    var body: some View {
        VStack {
            //RideyTitleView()
            RideyLogoView(backHandler: { //self.presentationMode.wrappedValue.dismiss()
                registerUser.setRegistered()
                router.navPath = NavigationPath()
            })
            
            ScrollView {
                VStack(alignment: .center) {
                    Text("歡迎加入 Ridey")
                        .font(.system(size: EXTREME_LARGE_TITLE_FONT_SIZE))
                        .bold()
                        .padding([.top], 80)
                    
                    Text(REGISTER_COMPLETE_DESCRIPTION)
                        .padding(20)
                        .font(.system(size: HEADER_FONT_SIZE))
                    
                    NavigationLink(value: "DriverApplyView") {
                        Button(action: {
                            print("Driver application button Clicked")
                            router.navPath.append("DriverApplyView")
                        }) {
                            Text("申請成為共乘駕駛")
                        }
                        .buttonStyle(CapsuleButtonStyle(width: 180))
                        .padding([.leading, .trailing], 20)
                        .padding([.top], 40)
                    }

                    Button(action: {
                        DispatchQueue.main.async {
                            registerUser.setRegistered()
                            router.navPath = NavigationPath()
                        }
                    }) {
                        Text("返回首頁")
                    }
                    .padding([.leading, .trailing], 20)
                    .padding([.top], 15)
                    .buttonStyle(ActiveCapsuleButtonStyle(width: 120))
                    
                    Spacer()
                }
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        
    }
}

struct RegisterCompleteView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RegisterCompleteView(model: RegisterCompleteViewModel())
                .environmentObject(Router())
                .environmentObject(RegisterUser())
        }
        
    }
}

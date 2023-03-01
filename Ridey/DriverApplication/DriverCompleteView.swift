//
//  DriverCompleteView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/10.
//

import SwiftUI

struct DriverCompleteView: View {
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
                    Image("firework_icon")
                        .resizable()
                        .frame(width: 120, height: 173)
                        .foregroundColor(BORDER_COLOR_ORANGE)
                        .padding([.top], 50)
                    
                    Text("感謝您申請成為共乘駕駛")
                        .font(.system(size: 30))
                        .bold()
                        .padding([.top], 80)
                    
                    Text(DRIVER_COMPLETE_WELCOME_DESCRIPTION)
                        .padding(20)
                        .font(.system(size: 16))
                    
                    Button(action: {
                        registerUser.setRegistered()
                        router.navPath = NavigationPath()
                    }) {
                        Text("返回首頁")
                    }
                    //.padding([.leading, .trailing], 20)
                    .padding([.top], 10)
                    .buttonStyle(ActiveCapsuleButtonStyle(width: 100))
                    
                    Spacer()
                }
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct DriverCompleteView_Previews: PreviewProvider {
    static var previews: some View {
        DriverCompleteView()
            .environmentObject(Router())
            .environmentObject(RegisterUser())
    }
}

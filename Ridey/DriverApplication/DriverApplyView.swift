//
//  DriverApplyView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/10.
//

import SwiftUI

struct DriverApplyView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack {
            //RideyTitleView()
            RideyLogoView(backHandler: { //self.presentationMode.wrappedValue.dismiss()
                router.navPath = NavigationPath()
            })
            
            ScrollView {
                
                VStack(alignment: .leading) {
                    HStack {
                        HeaderTextView(text: "成為共乘駕駛")
                        Spacer()
                        CapsuleLabelView(label: "駕駛條款")
                        Text("1/4")
                            .padding([.top, .trailing], 20)
                            
                    }
                    
                    Text(DRIVER_APPLY_WELCOME_DESCRIPTION)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding([.top, .bottom], 20)
                        .font(.system(size: 16))
                        
                    
                    MemoView(title: "駕駛條款", content: membershipTerms)
                    
                    CheckBoxView(id: "1",
                                 label: "我已詳閱並同意駕駛條款",
                                 size: 24,
                                 textSize: TITLE_FONT_SIZE,
                                 callback: checkboxSelected)
                    .padding(20)
                    
                    NavigationLink(value: "DriverIDImageView") {
                        Button(action: {
                            print("Next button Clicked")
                            router.navPath.append("DriverIDImageView")
                        }) {
                            Text("下一步")
                        }
                        .buttonStyle(ActiveCapsuleButtonStyle())
                        .padding([.top], 20)
                    }
                    
                    Button(action: {
                        router.navPath = NavigationPath()
                        
                    }) {
                        Text("返回首頁")
                    }
                    .padding([.leading, .trailing], 20)
                    .padding([.top], 10)
                    .buttonStyle(CapsuleButtonStyle())
                    
                    Spacer()
                }
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct DriverApplyView_Previews: PreviewProvider {
    static var previews: some View {
        DriverApplyView()
            .environmentObject(Router())
            .environmentObject(RegisterUser())
    }
}

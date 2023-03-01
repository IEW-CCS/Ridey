//
//  RegisterGoogleView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/9.
//

import SwiftUI

struct RegisterGoogleView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var router: Router
    
    @State private var agreementChecked: Bool = false
    
    var body: some View {
        VStack {
            //RideyTitleView()
            RideyLogoView(backHandler: { self.presentationMode.wrappedValue.dismiss() })
            
            ScrollView {
                VStack(alignment: .leading){
                    HStack {
                        HeaderTextView(text: "會員註冊")
                        Spacer()
                        CapsuleLabelView(label: "會員條款")
                        Text("1/3")
                            .padding([.top, .trailing], 20)
                            
                    }
                    
                    Text(REGISTER_WELCOME_DESCRIPTION)
                        .padding(20)
                        .font(.system(size: 16))
                    
                    MemoView(title: "會員條款", content: membershipTerms)
                    
                    CheckBoxView(id: "1",
                                 label: "我已詳閱會員條款",
                                 size: 24,
                                 textSize: TITLE_FONT_SIZE,
                                 callback: checkboxSelected)
                    .padding(20)
                    
                    NavigationLink(value: "RegisterMemberView") {
                        Button(action: {
                            print("Register button Clicked")
                            router.navPath.append("RegisterMemberView")
                        }) {
                            Text("註冊成為會員")
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

func checkboxSelected(id: String, isMarked: Bool) {
        print("\(id) is marked: \(isMarked)")
}

struct RegisterGoogleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RegisterGoogleView()
                .environmentObject(Router())
                .environmentObject(RegisterUser())
        }
        
    }
}

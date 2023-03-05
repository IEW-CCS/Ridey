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
    
    @State private var isChecked: Bool = false
    @State private var terms: String = ""
    @State private var termsTip: String = ""

    enum RegisterGoogleTip: Int {
        case na = 0
        case termsNG = 1
        case termsOK = 2
        
        var text: String {
            switch self {
                case .na: return ""
                case .termsNG: return "請完整閱讀上方的會員條款"
                case .termsOK: return "請勾選以進行下一步"
            }
        }
    }

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
                    
                    MemoView(title: "會員條款", content: membershipTerms, isChecked: $isChecked, validationTip: $termsTip)
                                     
                    NavigationLink(value: "RegisterMemberView") {
                        Button(action: {
                            print("Register button Clicked")
                            if(!registerGoogleValidation()) {
                                return
                            }
                            
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
    
    func registerGoogleValidation() -> Bool {
        var result: Bool = true

        termsTip = !self.isChecked ? RegisterGoogleTip.termsOK.text : RegisterGoogleTip.na.text
        result = !self.isChecked ? false : true

        return result
    }
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

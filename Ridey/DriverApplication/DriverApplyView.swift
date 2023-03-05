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
    
    @State private var isChecked: Bool = false
    @State private var terms: String = ""
    @State private var termsTip: String = ""

    enum DriverTermsTip: Int {
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
                        
                    
                    MemoView(title: "駕駛條款", content: membershipTerms, isChecked: $isChecked, validationTip: $termsTip)
                    
                    NavigationLink(value: "DriverIDImageView") {
                        Button(action: {
                            print("Next button Clicked")
                            if(!driverTermsValidation()) {
                                return
                            }
                            
                            router.navPath.append("DriverIDImageView")
                        }) {
                            Text("下一步")
                        }
                        .buttonStyle(ActiveCapsuleButtonStyle())
                        .padding([.top], 20)
                    }
                    //.buttonStyle(.plain)
                    
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
    
    func driverTermsValidation() -> Bool {
        var result: Bool = true

        termsTip = !self.isChecked ? DriverTermsTip.termsOK.text : DriverTermsTip.na.text
        result = !self.isChecked ? false : true

        return result
    }
}

struct DriverApplyView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DriverApplyView()
                .environmentObject(Router())
                .environmentObject(RegisterUser())
        }
    }
}

//
//  TripCreateCompleteView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/16.
//

import SwiftUI

struct TripCreateCompleteView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack {
            //RideyTitleView()
            RideyLogoView(backHandler: { self.presentationMode.wrappedValue.dismiss() })
            
            ScrollView {
                VStack(alignment: .center) {
                    Image("check_ok_icon")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .foregroundColor(BORDER_COLOR_ORANGE)
                        .padding([.top], 50)
                    
                    Text("您已成功創造共乘行程！")
                        .font(.system(size: 30))
                        .bold()
                        .padding([.top], 80)
                    
                    Text(CREATE_TRIP_COMPLETE_WELCOME_DESCRIPTION)
                        .padding(20)
                        .font(.system(size: 16))
                    
                    Button(action: {
                        router.navPath = NavigationPath()
                        
                    }) {
                        Text("回到會員專區")
                    }
                    .padding([.leading, .trailing], 20)
                    .padding([.top], 10)
                    .buttonStyle(ActiveCapsuleButtonStyle(width: 120))
                    
                    Spacer()
                }
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct TripCreateCompleteView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TripCreateCompleteView()
                .environmentObject(Router())
        }
        
    }
}

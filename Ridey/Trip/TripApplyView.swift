//
//  TripApplyView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/16.
//

import SwiftUI

struct TripApplyView: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack {
            //RideyTitleView()
            RideyLogoView(backHandler: { router.navPath = NavigationPath() })
            
            ScrollView {
                VStack(alignment: .center) {
                    Image("firework_icon")
                        .resizable()
                        .frame(width: 120, height: 173)
                        .foregroundColor(BORDER_COLOR_ORANGE)
                        .padding([.top], 50)
                    
                    Text("恭喜！")
                        .font(.system(size: 30))
                        .bold()
                        .padding([.top], 80)
                    
                    Text(APPLY_TRIP_COMPLETE_WELCOME_DESCRIPTION)
                        .padding(20)
                        .font(.system(size: 16))
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            router.navPath = NavigationPath()
                            
                        }) {
                            Text("回到會員專區")
                        }
                        .padding([.leading, .trailing], 20)
                        .padding([.top], 10)
                        .buttonStyle(BasicButtonStyle(width: 100))
                    }
                    
                    
                    Spacer()
                }
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct TripApplyView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TripApplyView()
                .environmentObject(Router())
        }
        
    }
}

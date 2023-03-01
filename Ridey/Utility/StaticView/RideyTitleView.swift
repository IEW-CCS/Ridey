//
//  RideyTitleView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/8.
//

import SwiftUI

struct RideyTitleView: View {
    var body: some View {
        HStack {
            Image("ridey_logo")
                .resizable()
                //.renderingMode(.template)
                .scaledToFit()
                
                .frame(width: 150, height:50)
            
            /*
            Text("Ridey")
                .font(.system(size: 50))
                .padding([.leading, .trailing], 15)
            */
            
            Spacer()
        }
        .padding([.leading, .trailing], 20)
        .padding([.top, .bottom], 1)
    }
}

struct RideyTitleView_Previews: PreviewProvider {
    static var previews: some View {
        RideyTitleView()
    }
}

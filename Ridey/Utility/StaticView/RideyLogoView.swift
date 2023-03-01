//
//  RideyLogoView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/18.
//

import SwiftUI

struct RideyLogoView: View {
    let backHandler: (() -> Void)
    
    var body: some View {
        Button(action: { self.backHandler() }) {
            Image("ridey_logo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height:50)

            Spacer()
        }
        .padding([.leading, .trailing], 20)
        .padding([.top, .bottom], 1)
    }
}

struct RideyLogoView_Previews: PreviewProvider {
    static var previews: some View {
        RideyLogoView(backHandler: { })
    }
}

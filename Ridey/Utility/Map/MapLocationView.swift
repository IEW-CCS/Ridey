//
//  MapLocationView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/20.
//

import SwiftUI

struct MapLocationView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("上車地點")
                .font(.system(size: BODY_FONT_SIZE))
                .foregroundColor(STACK_BORDER_COLOR_GRAY)
                .padding(.top, 10)
                .padding(.bottom, 5)
            
            Text("台北市中正區北平西路3號 候車區")
                .font(.system(size: BODY_FONT_SIZE))
                .padding(.bottom, 15)
        }
        .padding(.horizontal, 20)
        .cornerRadius(15)
        //.overlay(
        //    RoundedRectangle(cornerRadius: 15.0)
        //        .stroke(STACK_BORDER_COLOR_GRAY, lineWidth: 1))
        .background(
            Rectangle()
                .fill(BORDER_COLOR_WHITE)
                .cornerRadius(15)
                .shadow(
                    color: Color.gray.opacity(0.7),
                    radius: 15,
                    x: 0,
                    y: 0
                )
        )
    }
}

struct MapLocationView_Previews: PreviewProvider {
    static var previews: some View {
        MapLocationView()
    }
}

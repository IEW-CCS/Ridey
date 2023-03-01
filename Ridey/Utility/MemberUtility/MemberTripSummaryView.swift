//
//  MemberTripSummaryView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/15.
//

import SwiftUI

struct MemberTripSummaryView: View {
    var createdTrips: Int = 0
    var takenTrips: Int = 0
    
    var body: some View {
        HStack(spacing: 20) {
            VStack {
                Text(String(self.createdTrips))
                    .font(.system(size: LARGE_TITLE_FONT_SIZE))
                    .bold()
                    .padding([.bottom], 1)
                Text("已創造共乘")
                    .font(.system(size: BODY_FONT_SIZE))
                    .foregroundColor(STACK_BORDER_COLOR_GRAY)
                    .padding([.top], 1)
            }
            
            VStack {
                Text(String(self.takenTrips))
                    .font(.system(size: LARGE_TITLE_FONT_SIZE))
                    .bold()
                    .padding([.bottom], 1)
                Text("已搭乘共乘")
                    .font(.system(size: BODY_FONT_SIZE))
                    .foregroundColor(STACK_BORDER_COLOR_GRAY)
                    .padding([.top], 1)
            }
        }
        .frame(minWidth: 200, maxWidth: 200, minHeight: 100, maxHeight: 100)
        .overlay(
            RoundedRectangle(cornerRadius: 15.0)
                .stroke(BORDER_COLOR_WHITE, lineWidth: 2))
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

struct MemberTripSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        MemberTripSummaryView(createdTrips: 5, takenTrips: 13)
    }
}

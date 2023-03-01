//
//  MemberDrivePlanListView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/15.
//

import SwiftUI

struct MemberDrivePlanListView: View {
    var body: some View {
        VStack {
            DrivePlanView(ridePlan: ridePlan1)
                .padding([.leading, .trailing], 10)
            
            DrivePlanView(ridePlan: ridePlan3)
                .padding([.leading, .trailing], 10)
            
            DrivePlanView(ridePlan: ridePlan5)
                .padding([.leading, .trailing], 10)
            
            Spacer()
        }
    }
}

struct MemberDrivePlanListView_Previews: PreviewProvider {
    static var previews: some View {
        MemberDrivePlanListView()
    }
}

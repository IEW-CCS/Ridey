//
//  MemberTakenPlanListView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/15.
//

import SwiftUI

struct MemberTakenPlanListView: View {
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        VStack {
            CustomSegmentedView2(selectedSegment: $selectedIndex, segments: ["媒合中", "已媒合"])
                .padding([.leading, .trailing], 20)
                
            
            if(self.selectedIndex == 0){
                TripInfoView2(ridePlan: ridePlan1)
                    .padding([.top], 20)
                TripInfoView2(ridePlan: ridePlan2)
                    .padding([.top], 10)
            } else {
                TripInfoView(titleDisplay: false, ridePlan: ridePlan3)
                    .padding([.top], 20)
                TripInfoView(titleDisplay: false, ridePlan: ridePlan4)
                    .padding([.top], 10)
                TripInfoView(titleDisplay: false, ridePlan: ridePlan5)
                    .padding([.top], 10)
            }

            Spacer()
        }
        //.padding([.leading, .trailing], 20)
    }
}

struct MemberTakenPlanListView_Previews: PreviewProvider {
    static var previews: some View {
        MemberTakenPlanListView()
    }
}

//
//  MemberFinishedPlanListView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/15.
//

import SwiftUI

struct MemberFinishedPlanListView: View {
    var body: some View {

        VStack {
            TripHistoryView(ridePlan: ridePlan1)
            TripHistoryView(ridePlan: ridePlan2)
            TripHistoryView(ridePlan: ridePlan3)
            TripHistoryView(ridePlan: ridePlan4)
            TripHistoryView(ridePlan: ridePlan5)
            TripHistoryView(ridePlan: ridePlan6)
            Spacer()
        }

    }
}

struct MemberFinishedPlanListView_Previews: PreviewProvider {
    static var previews: some View {
        MemberFinishedPlanListView()
    }
}

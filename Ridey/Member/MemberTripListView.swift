//
//  MemberTripListView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/15.
//

import SwiftUI

struct MemberTripListView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var selectedTab: Int = 0
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack {
            MemberNavBar(backHandler: { self.presentationMode.wrappedValue.dismiss()
            }, title: "會員專區")
            
            CustomSegmentedView(selectedSegment: $selectedTab, segments: ["預定搭乘", "預計駕駛", "已完成共乘"])
                .padding([.leading, .trailing], 20)
            
            ScrollView {
                VStack {
                    if(self.selectedTab == 0) {
                        MemberTakenPlanListView()
                            .padding([.top], 20)
                    } else if(self.selectedTab == 1) {
                        MemberDrivePlanListView()
                            .padding([.top], 20)
                    } else {
                        MemberFinishedPlanListView()
                            .padding([.top], 20)
                    }
                }
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct MemberTripListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MemberTripListView()
                .environmentObject(Router())
        }
        
    }
}

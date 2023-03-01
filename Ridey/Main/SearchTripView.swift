//
//  SearchTripView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/16.
//

import SwiftUI

struct SearchTripView: View {
    @EnvironmentObject var router: Router
    
    @State var selectedDateTime: Date = Date()
    @State var startTime: String = ""
    @State var startCity: String = ""
    @State var acceptableStartLocation: String = ""
    @State var arriveCity: String = ""
    @State var acceptableArriveLocation: String = ""
    
    @State var isDateTimeDisplay: Bool = false
    @State var isCityDisplay: Bool = false
    @State var isStartLocationDisplay: Bool = false
    @State var isArriveCityDisplay: Bool = false
    @State var isToLocationDisplay: Bool = false

    var body: some View {
        VStack {
            TitleSelectionTextEditorView(title: "出發時間", inputText: $startTime, isPressed: $isDateTimeDisplay)
                .padding([.leading, .trailing, .top], 20)
                .padding([.bottom], 10)
                //.submitLabel(.done)
            
            if(self.isDateTimeDisplay) {
                DatePicker("", selection: $selectedDateTime)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                 .onChange(of: selectedDateTime, perform: { value in
                 let formatter = DateFormatter()
                 formatter.dateStyle = .full
                 self.startTime = formatter.string(from: value)
                 self.isDateTimeDisplay = false
                 })
            }
            
            TitleSelectionTextEditorView(title: "出發縣市", inputText: $startCity, isPressed: $isCityDisplay)
                .padding([.leading, .trailing], 20)
                .padding([.bottom], 10)
                //.submitLabel(.done)
            
            if(self.isCityDisplay) {
                BasicGridView(dataArray: CITY_DATA, columns: 3, selectedData: $startCity, isPresented: $isCityDisplay)
                    .frame(width: .infinity)
                    .font(.system(size: 24))
                    .overlay(RoundedRectangle(cornerRadius: 5.0)
                            .stroke(STACK_BORDER_COLOR_GRAY, lineWidth: 2))
                    .padding()
            }
            
            TitleSelectionTextEditorView(title: "可接受出發地點（1~2個）", inputText: $acceptableStartLocation, isPressed: $isStartLocationDisplay)
                .padding([.leading, .trailing], 20)
                .padding([.bottom], 10)
                //.submitLabel(.done)
            
            TitleSelectionTextEditorView(title: "抵達縣市", inputText: $arriveCity, isPressed: $isArriveCityDisplay)
                .padding([.leading, .trailing], 20)
                .padding([.bottom], 10)
            
            if(self.isArriveCityDisplay) {
                BasicGridView(dataArray: CITY_DATA, columns: 3, selectedData: $arriveCity, isPresented: $isArriveCityDisplay)
                    .frame(width: .infinity)
                    .font(.system(size: 24))
                    .overlay(RoundedRectangle(cornerRadius: 5.0)
                            .stroke(STACK_BORDER_COLOR_GRAY, lineWidth: 2))
                    .padding()
            }
            
            TitleSelectionTextEditorView(title: "可接受抵達地點（1~2個）", inputText: $acceptableArriveLocation, isPressed: $isToLocationDisplay)
                .padding([.leading, .trailing], 20)
                .padding([.bottom], 10)
            
            HStack {
                Spacer()
                NavigationLink(value: "TripMatchListView") {
                    Button(action: {
                        print("Search trips button clicked")
                        router.navPath.append("TripMatchListView")
                    }) {
                        Text("查詢旅程")
                    }
                    .padding([.bottom], 20)
                    .buttonStyle(BasicButtonStyle(width: 150))
                }
                Spacer()
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(STACK_BACKGROUND_COLOR_LIGHT_GRAY)
        .cornerRadius(5.0)
        .overlay(RoundedRectangle(cornerRadius: 5.0)
                .stroke(STACK_BORDER_COLOR_GRAY, lineWidth: 1))
        .padding([.leading, .trailing], 10)
        .padding([.top, .bottom], 1)
        //.onSubmit {
        //    hideKeyboard()
        //}
        .onTapGesture {
            hideKeyboard()
        }

    }
}

struct SearchTripView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SearchTripView()
                .environmentObject(Router())
        }
    }
}

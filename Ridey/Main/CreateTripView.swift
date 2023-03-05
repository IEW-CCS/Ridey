//
//  CreateTripView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/16.
//

import SwiftUI

struct CreateTripView: View {
    @EnvironmentObject var router: Router
    @FocusState private var isCommenntsFocused: Bool
    
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
    
    @State var inputText: String = ""

    @State var selection: Int? = nil
    
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                TitleSelectionTextEditorView(title: "預計出發時間", inputText: $startTime, isPressed: $isDateTimeDisplay)
                    .padding([.leading, .trailing, .top], 20)
                    .padding([.bottom], 10)
                
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
                
                if(self.isCityDisplay) {
                    BasicGridView(dataArray: CITY_DATA, columns: 3, selectedData: $startCity, isPresented: $isCityDisplay)
                        .frame(width: .infinity)
                        .font(.system(size: 24))
                        .overlay(RoundedRectangle(cornerRadius: 5.0)
                                .stroke(STACK_BORDER_COLOR_GRAY, lineWidth: 2))
                        .padding()
                }
                
                TitleSelectionTextEditorView(title: "可經過出發地點（1~2個）", inputText: $acceptableStartLocation, isPressed: $isStartLocationDisplay)
                    .padding([.leading, .trailing], 20)
                    .padding([.bottom], 10)
                
                TitleSelectionTextEditorView(title: "到達縣市", inputText: $arriveCity, isPressed: $isArriveCityDisplay)
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
                
                TitleSelectionTextEditorView(title: "可經過到達地點（1~2個）", inputText: $acceptableArriveLocation, isPressed: $isToLocationDisplay)
                    .padding([.leading, .trailing], 20)
                    .padding([.bottom], 10)
            }
            
            HStack {
                VStack {
                    Text("提供座位")
                        .font(.system(size: BODY_FONT_SIZE))
                        .padding([.leading, .trailing], 10)
                        .padding([.top], 10)
                        .padding([.bottom], 3)
               
                    HStack {
                        Button(action: {  }) {
                            HStack {
                                Image(systemName: "arrowtriangle.down.fill")
                                    .resizable()
                                    .renderingMode(.template)
                                    .foregroundColor(STACK_BORDER_COLOR_GRAY)
                                    .background(STACK_BACKGROUND_COLOR_GRAY)
                                    .frame(width: 14, height:14)
                            }
                            .foregroundColor(STACK_BORDER_COLOR_GRAY)
                            //.padding([.leading, .trailing], 20)
                            .padding([.bottom], 10)
                        }

                        Text("4  位")
                            .font(.system(size: HEADER2_FONT_SIZE))
                            .bold()
                            .padding([.leading, .trailing], 10)
                            .padding([.bottom], 10)
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .cornerRadius(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 5.0)
                        .stroke(TEXTEDITOR_BRODER_COLOR_GRAY, lineWidth: 1.5))
                
                VStack {
                    Text("可放置行李")
                        .font(.system(size: BODY_FONT_SIZE))
                        .padding([.leading, .trailing], 10)
                        .padding([.top], 10)
                        .padding([.bottom], 3)
                    HStack {
                        Text("總共")
                            .font(.system(size: BODY_FONT_SIZE))
                            .padding([.leading, .trailing], 10)
                            .padding([.bottom], 10)
                        
                        Button(action: {  }) {
                            HStack {
                                Image(systemName: "arrowtriangle.down.fill")
                                    .resizable()
                                    .renderingMode(.template)
                                    .foregroundColor(STACK_BORDER_COLOR_GRAY)
                                    .background(STACK_BACKGROUND_COLOR_GRAY)
                                    .frame(width: 14, height:14)
                            }
                            .foregroundColor(STACK_BORDER_COLOR_GRAY)
                            //.padding([.leading, .trailing], 20)
                            .padding([.bottom], 10)
                            
                        }
                        //Divider()
                        //    .padding([.bottom], 20)
                        //    .frame(width: 2, height: 20)
                        //    .overlay(STACK_BORDER_COLOR_GRAY)
                        Text("3  件")
                            .font(.system(size: HEADER2_FONT_SIZE))
                            .bold()
                            .padding([.leading, .trailing], 10)
                            .padding([.bottom], 10)
                    }
                    
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .cornerRadius(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 5.0)
                        .stroke(TEXTEDITOR_BRODER_COLOR_GRAY, lineWidth: 1.5))
            }
            //.padding([.top], 10)
            .padding([.leading, .trailing], 20)
            
            VStack(alignment: .leading) {
                Text("使用車輛：Toyota Altis 1.8E")
                    .font(.system(size: BODY_FONT_SIZE))
                    .padding([.leading, .trailing], 20)
                    .padding([.top], 10)
                
                //TitleTextEditorView(title: "補充說明內容", inputText: .constant("123"), lineNumber: 3)
                TextEditor(text: $inputText)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 45 * 3, maxHeight: 45 * 3)
                    .foregroundColor(BORDER_COLOR_BLACK)
                    .font(.system(size: BODY_FONT_SIZE))
                    .lineLimit(1)
                    .focused($isCommenntsFocused)
                    .cornerRadius(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5.0)
                            .stroke(
                                isCommenntsFocused ? BORDER_COLOR_SKY_BLUE: TEXTEDITOR_BRODER_COLOR_GRAY, lineWidth: isCommenntsFocused ? 2 : 1.5))
                    .shadow(color: isCommenntsFocused ? BORDER_COLOR_SKY_BLUE : .clear, radius: 2.0)

                    /*
                    .overlay(
                        RoundedRectangle(cornerRadius: 5.0)
                            .stroke(TEXTEDITOR_BRODER_COLOR_GRAY, lineWidth: 1.5))*/
                    .padding([.leading, .trailing], 20)
            }
            
            HStack {
                Spacer()
                NavigationLink(value: "TripCreateCompleteView") {
                    Button(action: {
                        print("Create trip buttonn clicked")
                        router.navPath.append("TripCreateCompleteView")
                    }) {
                        Text("創造共乘旅程")
                    }
                    .buttonStyle(BasicButtonStyle(width: 150))
                    .padding([.top, .bottom], 10)
                    .padding([.bottom], 20)
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
        .onSubmit {
            hideKeyboard()
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct CreateTripView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CreateTripView()
                .environmentObject(Router())
        }
    }
}

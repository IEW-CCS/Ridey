//
//  DriverCarDataView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/10.
//

import SwiftUI

struct DriverCarDataView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var router: Router
    
    @State private var isCarBrandDisplay: Bool = false

    @State private var carBrand: String = ""
    @State private var carYear: String = ""
    @State private var carNumber: String = ""
    @State private var carBrandTip: String = ""
    @State private var carYearTip: String = ""
    @State private var carNumberTip: String = ""

    enum CarValidationTip: Int {
        case na = 0
        case carbrand = 1
        case caryear = 2
        case carnumber = 3
        
        var text: String {
            switch self {
                case .na: return ""
                case .carbrand: return "請選擇車輛廠牌"
                case .caryear: return "請輸入車輛出廠年份"
                case .carnumber: return "請輸入車牌號碼"
            }
        }
    }

    
    var body: some View {
        VStack {
            //RideyTitleView()
            RideyLogoView(backHandler: { self.presentationMode.wrappedValue.dismiss() })
            
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        HeaderTextView(text: "成為共乘駕駛")
                        Spacer()
                        CapsuleLabelView(label: "車輛資訊")
                        Text("4/4")
                            .padding([.top, .trailing], 20)
                            
                    }
                    
                    Text(DRIVER_CAR_WELCOME_DESCRIPTION)
                        .padding(20)
                        .font(.system(size: 16))
                    
                    VStack {
                        SelectionButtonView(title: "車輛廠牌", buttonText: $carBrand, isPressed: $isCarBrandDisplay, validationTip: $carBrandTip)
                        
                        TitleTextEditorView(title: "車輛出廠年份（民國年）", inputText: $carYear, validationTip: $carYearTip)
                            .padding([.top], 15)
                            .keyboardType(.numberPad)
     
                        TitleTextEditorView(title: "車牌號碼", inputText: $carNumber, validationTip: $carNumberTip)
                            .padding([.top], 15)
                            .keyboardType(.default)
                    }

                    VStack(alignment: .leading) {
                        Text("車輛外觀")
                            .font(.system(size: HEADER2_FONT_SIZE))
                            .padding([.bottom], 2)
                        
                        TitleImageView(imageName: "", title: "", imageDescription: IMAGE_BACKGROUND_TEXT2, isTitleShow: false, width: 160)
                    }
                    .padding([.leading, .trailing], 20)
                    .padding([.top], 15)
                    
                    VStack(alignment: .leading) {
                        Text("其他車輛照片（如內裝、其他外觀）")
                            .font(.system(size: HEADER2_FONT_SIZE))
                            .padding([.bottom], 2)
                        
                        TitleImageView(imageName: "", title: "", imageDescription: "+", isTitleShow: false, width: 80, height: 80)
                        
                        Text("最多可上傳5張照片")
                            .frame(width: .infinity)
                            .font(.system(size: 14))
                            .foregroundColor(STACK_BORDER_COLOR_GRAY)
                            .padding([.trailing], 20)
                    }
                    .padding([.leading, .trailing], 20)
                    .padding([.top], 15)
                    
                    HStack {
                        Spacer()
                        NavigationLink(value: "DriverCompleteView") {
                            Button(action: {
                                print("Save button Clicked")
                                router.navPath.append("DriverCompleteView")
                            }) {
                                Text("略過")
                            }
                            .buttonStyle(CapsuleButtonStyle(width: 90))
                            .padding([.leading], 20)
                        }

                        Spacer()
                        
                        NavigationLink(value: "DriverCompleteView") {
                            Button(action: {
                                print("Ignore button Clicked")
                                if(!carValidation()) {
                                    return
                                }
                                
                                router.navPath.append("DriverCompleteView")
                            }) {
                                Text("儲存")
                            }
                            .buttonStyle(ActiveCapsuleButtonStyle(width: 90))
                        }
                        
                        Spacer()
                    }
                    .padding([.top], 20)
                    
                    Spacer()
                }
            }
        }
        .onSubmit {
            hideKeyboard()
        }
        .onTapGesture {
            hideKeyboard()
        }

        .navigationTitle("")
        .navigationBarHidden(true)
    }
    
    func carValidation() -> Bool {
        var result: Bool = true

        carBrandTip = self.carBrand.isEmpty ? CarValidationTip.carbrand.text : CarValidationTip.na.text
        result = self.carBrand.isEmpty ? false : true

        carYearTip = self.carYear.isEmpty ? CarValidationTip.caryear.text : CarValidationTip.na.text
        result = self.carYear.isEmpty ? false : true

        carNumberTip = self.carNumber.isEmpty ? CarValidationTip.carnumber.text : CarValidationTip.na.text
        result = self.carNumber.isEmpty ? false : true

        return result

    }
}

struct DriverCarDataView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DriverCarDataView()
                .environmentObject(Router())
                .environmentObject(RegisterUser())
        }
        
    }
}

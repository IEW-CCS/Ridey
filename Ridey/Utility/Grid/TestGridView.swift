//
//  TestGridView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/20.
//

import SwiftUI

struct TestGridView: View {
    var dataArray: [String] = []
    var columns: Int = 1
    @Binding var selectedData: String
    @State private var selectedIndex: Int = -1
    @Binding var isPresented: Bool
    
    var body: some View {
        Grid(horizontalSpacing: 5, verticalSpacing: 5) {
            ForEach(0..<(dataArray.count/columns)) { row in
                GridRow {
                    ForEach(0..<columns, id: \.self) { column in
                        Text(dataArray[row * columns + column])
                            .font(.system(size: HEADER_FONT_SIZE))
                            .bold()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding(10)
                            .background((self.selectedIndex == (row * columns + column)) ? .gray : BORDER_COLOR_WHITE)
                            .cornerRadius(10)
                            .padding(5)
                            .onTapGesture(count: 1, perform: {
                                selectedData = dataArray[row * columns + column]
                                selectedIndex = row * columns + column
                                isPresented = false
                            })
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity)
            }
            
            if((dataArray.count % columns) != 0) {
                GridRow {
                    ForEach((dataArray.count - (dataArray.count % columns))..<dataArray.count) { index in
                        Text(dataArray[index])
                            .font(.system(size: HEADER_FONT_SIZE))
                            .bold()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding(10)
                            .background((self.selectedIndex == index) ? .gray : .white)
                            .cornerRadius(10)
                            .padding(5)
                            .onTapGesture(count: 1, perform: {
                                selectedData = dataArray[index]
                                selectedIndex = index
                                isPresented = false
                            })
                    }
                }
            }
        }
        
    }
}

struct TestGridView_Previews: PreviewProvider {
    static var previews: some View {
        TestGridView(dataArray: DRIVE_YEAR, columns: 3, selectedData: .constant(""), isPresented: .constant(true))
    }
}

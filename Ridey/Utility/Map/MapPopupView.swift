//
//  MapPopupView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/20.
//

import SwiftUI
import MapKit

struct MapPopupView: View {
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.75773, longitude: -73.985708), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("台北車站")
                    .font(.system(size: LARGE_TITLE_FONT_SIZE))
                    .foregroundColor(BORDER_COLOR_BLACK)
                    .padding(.horizontal, 30)
                    .padding([.top], 10)
                Spacer()
                Button(action: { isPresented = false } ) {
                    Image(systemName: "xmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .padding(.horizontal, 30)
                        .padding([.top], 10)
                }
            }
            Divider()
                .padding(.horizontal, 30)
                .overlay(STACK_BORDER_COLOR_GRAY)
            ZStack {
                Map(coordinateRegion: $region, annotationItems: pointsOfInterest) { item in
                    MapAnnotation(coordinate: item.coordinate) {
                        Image("map_annotation_icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 36, height: 36)
                    }
                }
                    .cornerRadius(15)
                    //.overlay(
                    //    RoundedRectangle(cornerRadius: 15.0)
                    //        .stroke(STACK_BORDER_COLOR_GRAY, lineWidth: 1))
                    .padding(.horizontal, 15)
                    .padding([.top], 10)
                    .padding([.bottom], 15)
                    .frame(minHeight: 360, maxHeight: 360)

                MapLocationView()
                    .padding(.horizontal, 50)
                    .offset(x:0, y: 110)
            }
        }
        .background(BORDER_COLOR_WHITE)
        .cornerRadius(15)
        .overlay(
            RoundedRectangle(cornerRadius: 15.0)
                .stroke(STACK_BORDER_COLOR_GRAY, lineWidth: 1))
        .padding(.horizontal, 15)
        .frame(minHeight: 360, maxHeight: 360)

    }
}

struct MapPopupView_Previews: PreviewProvider {
    static var previews: some View {
        MapPopupView(isPresented: .constant(true))
    }
}

//
//  StructureDefinition.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/1/29.
//

import Foundation
import SwiftUI
import MapKit

struct RidePlan {
    var planID: Int = 0
    var fromLocation: String = ""
    var toLocation: String = ""
    var startTime: String = ""
    var isDriver: Bool = false
}

struct TripInformation {
    var itemNo: String = ""
    var startLocation: String = ""
    var startTime: String = ""
    var toLocation: String = ""
    var durationTime: String = ""
    var driveScoring: String = ""
}

struct ChatInformation: Hashable {
    var chatID: Int = 0
    var imageName: String = ""
    var time: String = ""
    var fromTo: String = ""
    var driverName: String = ""
    var passengerName: String = ""
    var lastMessage: String = ""
    var typeHasNewMessage: Int = 0
    var typeGroupChat: Int = 0    //-1: Top Chat Type
                                  // 0: Group Chat Type
                                  // 1: Personal Chat Type
    var chatFunctionType: Int = 0 // 0: Group Chat Function Type
                                  // 1: Chat Trip Apply Function Type
                                  // 2: Chat Trip Detail Function Type
                                  // 3: Chat Trip Approve Function Type
                                  // 4: Chat Confirm Function Type
}

struct MessageContent: Hashable {
    var messageID: Int = 0
    var imageName: String = ""
    var sender: String = ""
    var isDriver: Bool = false
    var message: String = ""
    var time: String = ""
    var type: String = "" //R: Received Message
                          //S: Send Message
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

final class Router: ObservableObject {
    @Published var navPath: NavigationPath = .init()
    
    func reset() {
        navPath = .init()
    }
}

final class RegisterUser: ObservableObject {
    @Published var isRegisterUser: Bool = false
    
    func setRegistered() {
        isRegisterUser = true
    }
    
    func toggle() {
        isRegisterUser = !isRegisterUser
    }
}

struct AnnotatedItem: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

struct BackgroundClearView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct backGesture: ViewModifier {
    @State var offset: CGSize
    @State var path: NavigationPath
    
    func body(content: Content) -> some View {
        content
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        offset = gesture.translation
                    }
                    .onEnded { _ in
                        if(offset.width > 20) {
                            withAnimation {
                                DispatchQueue.main.async {
                                    path.removeLast(1)
                                }
                            }
                        } else {
                            offset = .zero
                        }
                    }
            )

      }
}

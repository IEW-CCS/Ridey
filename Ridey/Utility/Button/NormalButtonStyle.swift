//
//  NormalButtonView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/1/29.
//

import SwiftUI

struct BasicButtonStyle: ButtonStyle {
    var width: CGFloat = .infinity
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: width, minHeight: 16, maxHeight: 16)
            .padding()
            .foregroundColor(BORDER_COLOR_BLACK)
            .background(BORDER_COLOR_WHITE)
            .font(.system(size: HEADER2_FONT_SIZE))
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5.0)
                    .stroke(BORDER_COLOR_BLACK, lineWidth: 1.5))
            .padding([.leading, .trailing], 20)
    }
}

struct BasicCompactButtonStyle: ButtonStyle {
    var width: CGFloat = .infinity
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: width, minHeight: 14, maxHeight: 14)
            .padding(10)
            .foregroundColor(BORDER_COLOR_BLACK)
            .background(BORDER_COLOR_WHITE)
            .font(.system(size: BODY_FONT_SIZE))
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5.0)
                    .stroke(BORDER_COLOR_BLACK, lineWidth: 1.5))
    }
}


struct CapsuleButtonStyle: ButtonStyle {
    var width: CGFloat = .infinity
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.system(size: HEADER2_FONT_SIZE))
            //.frame(minWidth: 0, maxWidth: .infinity)
            .frame(minWidth: 0, maxWidth: width, minHeight: 14, maxHeight: 14)
            .padding(15)
            .foregroundColor(BUTTON_COLOR_ORANGE)
            .background(BUTTON_BACKGROUND_COLOR)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20.0)
                    .stroke(BUTTON_COLOR_ORANGE, lineWidth: 1))
    }
}

struct ActiveCapsuleButtonStyle: ButtonStyle {
    var width: CGFloat = .infinity
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.system(size: HEADER2_FONT_SIZE))
            //.frame(minWidth: 0, maxWidth: .infinity)
            .frame(minWidth: 0, maxWidth: width, minHeight: 14, maxHeight: 14)
            .padding(15)
            .foregroundColor(.white)
            .background(BUTTON_COLOR_ORANGE)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20.0)
                    .stroke(BUTTON_COLOR_ORANGE, lineWidth: 1))
            .padding([.leading, .trailing], 20)
    }
}

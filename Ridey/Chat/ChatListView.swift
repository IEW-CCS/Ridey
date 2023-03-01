//
//  ChatListView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/22.
//

import SwiftUI

struct ChatListView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var router: Router
    @State private var offset = CGSize.zero

    var body: some View {
        VStack(alignment: .leading) {
            ChatNavBar(backHandler: { self.presentationMode.wrappedValue.dismiss()
            }, titleType: -1, chatInfo: chatInfo1)
                .padding(.bottom, 20)

            ScrollView {
                ForEach(chatInfoArray, id:\.self) { chatInfo in
                    NavigationLink(value: chatInfo.chatID) {
                        ChatListCellView(chatInfo: chatInfo)
                            .padding(.horizontal, 20)
                    }
                    .accentColor(BORDER_COLOR_BLACK)
                }
            }
        }
        .navigationDestination(for: Int.self) { index in
            ChatDetailView(chatInfo: chatInfoArray[index])
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .offset(x: offset.width * 2, y: 0)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                }
                .onEnded { _ in
                    if(offset.width > 20) {
                        withAnimation {
                            router.navPath.removeLast(1)
                        }
                    } else {
                        offset = .zero
                    }
                }
        )
    }
}

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ChatListView()
        }
    }
}

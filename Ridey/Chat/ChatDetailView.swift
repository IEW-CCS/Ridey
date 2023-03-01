//
//  ChatDetailView.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/2/22.
//

import SwiftUI

struct ChatDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var router: Router
    @State private var inputMessage: String = ""
    @State private var msgArray:[MessageContent] = messageTemplate
    @State private var offset = CGSize.zero
    
    @State var chatInfo: ChatInformation
    
    var body: some View {
        VStack(alignment: .leading, spacing:0) {
            VStack {
                ChatNavBar(backHandler: { self.presentationMode.wrappedValue.dismiss()
                }, titleType: (chatInfo.chatFunctionType == 0) ? 0 : 1, chatInfo: chatInfo)
                .padding(.vertical, 10)
                
                switch chatInfo.chatFunctionType {
                case 1:
                    ChatTripApplyFunctionView(driverName: chatInfo.driverName, time: chatInfo.time, fromTo: chatInfo.fromTo)
                    .padding(.vertical, 10)

                case 2:
                    ChatTripDetailFunctionView(driverName: chatInfo.driverName, time: chatInfo.time, fromTo: chatInfo.fromTo)
                    .padding(.vertical, 10)

                case 3:
                    ChatTripApproveFunctionView(passengerName: chatInfo.passengerName, time: chatInfo.time, fromTo: chatInfo.fromTo)
                    .padding(.vertical, 10)

                case 4:
                    ChatConfirmFunctionView(passengerName: chatInfo.passengerName, time: chatInfo.time, fromTo: chatInfo.fromTo)
                    .padding(.vertical, 10)

                default:
                    EmptyView()
                }
            }
            .background(CHAT_BACKGROUND_COLOR)
            
            ScrollViewReader { proxy in
                ScrollView {
                    ForEach(msgArray, id:\.self) { message in
                        if(message.type == "R") {
                            ReceiveMessageCell(messageContent: message)
                                .padding(.vertical, 5)
                                .id(message.messageID)
                        } else {
                            SendMessageCell(messageContent: message)
                                .padding(.vertical, 5)
                                .id(message.messageID)
                        }
                    }
                }
                .background(CHAT_BACKGROUND_COLOR)
                .onChange(of: self.msgArray.count, perform: { value in
                    proxy.scrollTo(msgArray.count)
                })
            }
            .background(CHAT_BACKGROUND_COLOR)
            //.ignoresSafeArea()
            .safeAreaInset(edge: .bottom, alignment: .center, spacing: 0) {
                VStack {
                    Divider()
                        .overlay(BORDER_COLOR_ORANGE)
                    HStack(alignment: .center) {
                        TextEditor(text: $inputMessage)
                            .font(.system(size: BODY_FONT_SIZE))
                            .foregroundColor(BORDER_COLOR_BLACK)
                            .scrollContentBackground(.hidden)
                            .background(CHAT_BACKGROUND_COLOR)
                            .padding([.top, .bottom], 5)
                            .padding([.leading, .trailing], 15)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                            .cornerRadius(30)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30.0)
                                    .stroke( BORDER_COLOR_ORANGE, lineWidth: 1.5))
                            .padding([.top, .bottom], 20)
                            .padding(.leading, 30)
                            .padding(.trailing, 5)
                        
                        Button(action: { sendMessage() }) {
                            Image("send_message_icon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .padding([.top, .bottom, .trailing], 20)
                                .padding(.leading, 5)
                        }
                        
                        Spacer()
                    }
                    //.frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 45)
                    .padding(.top, 10)
                    .background(CHAT_BACKGROUND_COLOR)
                    
                }
                .background(CHAT_BACKGROUND_COLOR)
            }
        }
        .offset(x: offset.width * 2, y: 0)
        .onTapGesture {
            hideKeyboard()
        }
        //.modifier(backGesture(offset: offset, path: router.navPath))
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
        .navigationTitle("")
        .navigationBarHidden(true)
    }
    
    func sendMessage() -> Void {
        var tempMsg: MessageContent = MessageContent()

        tempMsg.messageID = self.msgArray.count + 1
        tempMsg.imageName = "captain_america"
        tempMsg.sender = "Captain"
        tempMsg.isDriver = false
        tempMsg.time = "上午10:00"
        tempMsg.message = self.inputMessage
        tempMsg.type = "S"
        
        self.msgArray.append(tempMsg)
        self.chatInfo.lastMessage = tempMsg.message
        self.inputMessage = ""
    }

    
}


struct ChatDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ChatDetailView(chatInfo: chatInfo1)
        }
        
    }
}

//
//  ChatsView.swift
//  EduSwiftUIProject
//
//  Created by Sergey Ivanov on 16.11.2023.
//

import SwiftUI

struct ChatsView: View {
    @State private var refreshChatsID = UUID()
    
    var body: some View {
        NavigationView {
            List(Chat.chatData) { chat in
                NavigationLink(destination: ChatDetailView(
                        chat: chat
                )
                ) {
                    ChatRow(chat: chat)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.vertical, 3)
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle(NSLocalizedString("Chats", comment: ""))
        }
        .onAppear {
            refreshChatsID = UUID()
        }
    }
}

#Preview {
    ChatsView()
}

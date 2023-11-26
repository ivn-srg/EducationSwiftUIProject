//
//  ChatBubbleView.swift
//  EduSwiftUIProject
//
//  Created by Sergey Ivanov on 16.11.2023.
//

import SwiftUI

struct ChatBubbleView: View {
    var message: String
    var isMyMessage: Bool
    var sentTime: String

    var body: some View {
        HStack {
            if isMyMessage {
                Spacer() // Добавляем пустое пространство слева, если это мое сообщение
            }
            
            ZStack(alignment: .bottomTrailing) {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(isMyMessage ? Color.customBlue : Color.customGray)

                VStack(alignment: .leading, spacing: 8) {
                    Text(message)
                        .foregroundColor(.white)
                    HStack {
                        Spacer()
                        Text(sentTime)
                            .font(.caption)
                            .foregroundColor(.white)
                            .frame(alignment: .trailing)
                    }
                }
                .padding()
            }
            .frame(maxWidth: 300)

            if !isMyMessage {
                Spacer()
            }
        }
        .padding(.horizontal, 5)
    }
}

#Preview {
    
    ChatDetailView(chat: Chat.chatData[0])
}

//
//  ChatDetailView.swift
//  EduSwiftUIProject
//
//  Created by Sergey Ivanov on 16.11.2023.
//

import SwiftUI

struct ChatDetailView: View {
    var chat: Chat
    @State private var messageText = ""
    @State private var refreshID = UUID()
    
    private func sendMessage(inputText: Binding<String>) {
        let comment = inputText.wrappedValue.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if !comment.isEmpty && comment != "" {
            chat.listOfComments.append(Comment(
                text: comment,
                author: .user,
                sentTime: Comment.formattedCurrentTime())
                                    )
            messageText = ""
            refreshID = UUID()
        }
    }
    
    private func calculatePadding(index: Int, comment: Comment) -> CGFloat {
        var vertPadding = 10
        
        if index < chat.listOfComments.count - 1 {
            let nextComment = chat.listOfComments[index + 1]
            vertPadding = nextComment.author == comment.author ? 0 : 15
        }
        return CGFloat(vertPadding)
    }

    var body: some View {
        VStack {
            // Отображение сообщений
            ScrollView {
                VStack {
                    ForEach(Array(chat.listOfComments.enumerated()), id: \.offset) { index, element in
                        ChatBubbleView(
                            message: element.text,
                            isMyMessage: element.author == .user ? true : false,
                            sentTime: element.sentTime
                        )
                        .padding(.bottom, calculatePadding(
                            index: index,
                            comment: element)
                        )
                    }
                }
                .padding(.vertical, 20)
            }
            
            HStack(alignment: .center, spacing:0) {
                TextEditor(text: $messageText)
                    .frame(maxHeight: 100)
                    .lineLimit(nil)
                    .foregroundColor(.primary)
                    .background(Color.secondary.opacity(0.1))
                    .frame(height: 50)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.secondary, lineWidth: 1)
                    )
                .padding(.leading, 10)
                
                Button(action: {
                    sendMessage(inputText: $messageText)
                }) {
                    Image(systemName: "arrow.right.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(Color.customBlue)
                        .padding()
                }
            }
            .padding(.bottom)
        }
        .id(refreshID)
        .navigationTitle(chat.doctor.fullName)
    }
}

#Preview {
    ChatDetailView(chat: Chat.chatData[0])
}

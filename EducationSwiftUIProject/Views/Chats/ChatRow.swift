//
//  ChatRow.swift
//  EduSwiftUIProject
//
//  Created by Sergey Ivanov on 16.11.2023.
//

import SwiftUI

struct ChatRow: View {
    var chat: Chat

    var body: some View {
        HStack {
            AvatarView(avatarImage: chat.doctor.avatarImage)
            
            if let lastComment = chat.listOfComments.last {
                VStack(alignment: .leading) {
                    
                    HStack(alignment: .center) {
                        Text(chat.doctor.fullName)
                            .font(.mainFontBold(size: 16))
                            .foregroundStyle(Color.black)
                        
                        Spacer()
                        
                        Text(lastComment.sentTime)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                        Text(lastComment.author == .user ? "You: \(lastComment.text)" : "Dr.: \(lastComment.text)")
                            .font(.mainFontRegular(size: 14))
                            .foregroundColor(.gray)
                    
                }
                
            .frame(maxHeight: .infinity)
            } else { Text("") }
        }
    }
}

#Preview {
    ChatRow(chat: Chat(
        doctor: listOfDoctors[2],
        listOfComments: [
            Comment(
                text: NSLocalizedString("chatMessage6", comment: ""),
                author: .doctor,
                sentTime: "11:09"
            )
        ]
    ))
}

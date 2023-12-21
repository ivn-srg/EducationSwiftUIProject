//
//  Chat.swift
//  EduSwiftUIProject
//
//  Created by Sergey Ivanov on 16.11.2023.
//

import Foundation

class Chat: Identifiable {
    var id = UUID()
    var doctor: Doctor
    var listOfComments: [Comment]
    
    init(id: UUID = UUID(), doctor: Doctor, listOfComments: [Comment]) {
        self.id = id
        self.doctor = doctor
        self.listOfComments = listOfComments
    }
    
    static let chatData = [
        Chat(
            doctor: Doctor.listOfDoctors[0],
            listOfComments: [
                Comment(
                    text: NSLocalizedString("chatMessage1", comment: ""),
                    author: .doctor,
                    sentTime: "17:09"
                ),
                Comment(
                    text: NSLocalizedString("chatMessage4", comment: ""),
                    author: .user,
                    sentTime: "18:09"
                )
            ]
        ),
        Chat(
            doctor: Doctor.listOfDoctors[1],
            listOfComments: [
                Comment(
                    text: NSLocalizedString("chatMessage2", comment: ""),
                    author: .doctor,
                    sentTime: "14:39"
                ),
                Comment(
                    text: NSLocalizedString("chatMessage5", comment: ""),
                    author: .user,
                    sentTime: "18:19"
                )
            ]
        )
    ]
}

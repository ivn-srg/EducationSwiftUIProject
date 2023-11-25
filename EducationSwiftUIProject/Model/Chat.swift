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
}

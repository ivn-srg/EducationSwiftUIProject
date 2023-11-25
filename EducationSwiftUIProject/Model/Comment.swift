//
//  Comment.swift
//  EduSwiftUIProject
//
//  Created by Sergey Ivanov on 16.11.2023.
//

import Foundation

enum CommentType {
    case user
    case doctor
}

class Comment {
    
    var text: String
    var author: CommentType
    var sentTime: String
    
    init(text: String, author: CommentType, sentTime: String) {
        self.text = text
        self.author = author
        self.sentTime = sentTime
    }
    
    static func formattedCurrentTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: Date())
    }
}

//
//  AvatarView.swift
//  EduSwiftUIProject
//
//  Created by Sergey Ivanov on 15.11.2023.
//

import SwiftUI

struct AvatarView: View {
    var avatarImage: Image
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(Color.black.opacity(0.1))
                .frame(width: 55, height: 70)
                .overlay{
                    avatarImage
                        .resizable()
                        .scaledToFill()
                        .offset(y:5)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                }
        }
    }
}

#Preview {
    AvatarView(avatarImage: .docAvatar2Image)
}

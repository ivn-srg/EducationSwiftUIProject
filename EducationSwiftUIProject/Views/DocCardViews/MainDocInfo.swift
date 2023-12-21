//
//  MainDocInfo.swift
//  EduSwiftUIProject
//
//  Created by Sergey Ivanov on 14.11.2023.
//

import SwiftUI

struct MainDocInfo: View {
    let fullName: String
    let specilty: String
    let image: Image
    let distance: String
        
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            
            AvatarView(avatarImage: image)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(fullName)
                    .font(
                        .mainFontBold(size: 16)
                    )
                    .foregroundColor(.black)
                Text(specilty)
                    .font(.mainFontRegular(size: 14))
                    .foregroundColor(.customGray)
                
            }
            
            Spacer()
            
            HStack(spacing: 3) {
                Image.locationIcon
                    .frame(width: 24, height: 24)
                
                Text(distance)
                    .font(.mainFontRegular(size: 14))
                    .foregroundColor(.customGray)
            }
        }.frame(alignment: .center)
    }
}

#Preview {
    MainDocInfo(
        fullName: "Dr. Imran Syahir",
        specilty: "General Doctor",
        image: .docAvatar1Image,
        distance: "2 KM"
    ).previewLayout(.sizeThatFits)
        .padding(.vertical)
}

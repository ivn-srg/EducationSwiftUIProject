//
//  AdditionalDocInfo.swift
//  EduSwiftUIProject
//
//  Created by Sergey Ivanov on 14.11.2023.
//

import SwiftUI

struct AdditionalDocInfo: View {
    let reviews: String
    let worktime: String
    
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            HStack(alignment: .center, spacing: 8) {
                Image("clockYellow")
                    .frame(width: 20, height: 20)
                
                Text(reviews)
                    .font(.mainFontRegular(size: 12))
                    .foregroundColor(.customYellow)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(alignment: .center, spacing: 8) {
                Image("clockBlue")
                    .font(.system(size: 16))
                
                Text(worktime)
                    .font(.mainFontRegular(size: 12))
                    .foregroundColor(.customBlue)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    AdditionalDocInfo(reviews: "4,9 (190 Reviews)", worktime: "Open at 15.00")
}

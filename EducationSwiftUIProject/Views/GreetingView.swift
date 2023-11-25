//
//  GreetingView.swift
//  EduSwiftUIProject
//
//  Created by Sergey Ivanov on 13.11.2023.
//

import SwiftUI

struct GreetingView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Text(NSLocalizedString("welcomeWord", comment: ""))
                    .font(Font.mainFontRegular(size: 16))
                    .foregroundColor(.customGray)
                
                Text(NSLocalizedString("userName", comment: ""))
                    .font(
                        Font.mainFontBold(size: 20)
                    )
                    .bold()
                    .foregroundColor(.black)
            }
            Spacer()
            Image.welcomeIcon
                .frame(width: 56, height: 56)
        }
    }
}

#Preview {
    GreetingView()
}

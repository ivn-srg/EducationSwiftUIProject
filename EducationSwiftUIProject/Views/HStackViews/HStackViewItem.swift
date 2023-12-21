//
//  HStackViewItem.swift
//  EduSwiftUIProject
//
//  Created by Sergey Ivanov on 15.11.2023.
//

import SwiftUI

struct HStackViewItem: View {
    var HStackItemName: String
    var HStackItemIcon: Image
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            HStack(alignment: .top, spacing: 10) {
                HStackItemIcon
                    .frame(width: 24, height: 24)
            }
            .padding(24)
            .background(Color.customGray1)
            .cornerRadius(100)
            
            Text(HStackItemName)
                .font(.mainFontRegular(size: 15))
                .foregroundColor(.customGray)
        }
    }
}

#Preview {
    HStackViewItem(HStackItemName: "Covid 19", HStackItemIcon: .sunBlueIcon)
}

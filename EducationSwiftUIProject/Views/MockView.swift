//
//  MockView.swift
//  EduSwiftUIProject
//
//  Created by Sergey Ivanov on 14.11.2023.
//

import SwiftUI

struct MockView: View {
    @Environment(\.isModal) private var isModal
    @Binding var isModalPresented: Bool
    
    var body: some View {
        
        if isModal {
            VStack(alignment: .leading) {
                Button(action: {
                    // Закрыть модальное окно
                    isModalPresented = false
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.customGray)
                        .font(.title)
                        .frame(alignment: .leading)
                    Spacer()
                }
                .padding([.top, .leading], 10)
            }
            Spacer()
            Text(NSLocalizedString("MockViewText", comment: ""))
                .font(Font.mainFontRegular(size: 15))
                .foregroundStyle(Color.black)
            Spacer()
        } else {
            Text(NSLocalizedString("MockViewText", comment: ""))
                .font(Font.mainFontRegular(size: 15))
                .foregroundStyle(Color.black)
        }
    }
}

#Preview {
    MockView(isModalPresented: .constant(false))
        .environment(\.isModal, true)
}

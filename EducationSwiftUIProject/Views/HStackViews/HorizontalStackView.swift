//
//  HorizontalStackView.swift
//  EduSwiftUIProject
//
//  Created by Sergey Ivanov on 13.11.2023.
//

import SwiftUI

let HStackItems:[(image: Image, title: String)] = [
    (.sunBlueIcon, NSLocalizedString("HStackItemName1", comment: "")),
    (.profileDocIcon, NSLocalizedString("HStackItemName2", comment: "")),
    (.linkIcon, NSLocalizedString("HStackItemName3", comment: "")),
    (.hospitalIcon, NSLocalizedString("HStackItemName4", comment: ""))
]

struct HorizontalStackView: View {
    @Binding var isModalPresented: Bool
    
    var body: some View {
        HStack(spacing: 20) {
            
            ForEach(Array(HStackItems.enumerated()), id: \.offset) { index, element in
                Button {
                    isModalPresented.toggle()
                } label: {
                    HStackViewItem(
                        HStackItemName: element.title,
                        HStackItemIcon: element.image
                    )
                }
                // Модификатор .sheet для отображения модального окна
                .sheet(isPresented: $isModalPresented) {
                    MockView(isModalPresented: $isModalPresented)
                        .environment(\.isModal, true)
                }
            }
        }
    }
}

#Preview {
    HorizontalStackView(isModalPresented: .constant(false))
}

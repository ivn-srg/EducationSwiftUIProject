//
//  HorizontalStackView.swift
//  EduSwiftUIProject
//
//  Created by Sergey Ivanov on 13.11.2023.
//

import SwiftUI

struct HorizontalStackView: View {
    @Binding var isModalPresented: Bool
    
    var body: some View {
        HStack(spacing: 20) {
            
            ForEach(0..<HStackItems.count) { index in
                let HStackItem = HStackItems[index]
                
                Button {
                    isModalPresented.toggle()
                } label: {
                    HStackViewItem(
                        HStackItemName: HStackItem.title,
                        HStackItemIcon: HStackItem.image
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

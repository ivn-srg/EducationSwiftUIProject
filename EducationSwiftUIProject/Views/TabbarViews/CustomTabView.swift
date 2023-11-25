//
//  CustomTabView.swift
//  EduSwiftUIProject
//
//  Created by Sergey Ivanov on 14.11.2023.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var tabSelection: Int
    @Namespace private var animatedNamespace
    
    var body: some View {
        ZStack {
            HStack(alignment: .bottom, spacing: 35) {
                ForEach(0..<tabbarItems.count) { index in
                    Button {
                        tabSelection = index + 1
                    } label: {
                        if index + 1 == tabSelection {
                            HStack(alignment: .center, spacing: 8) {
                                Image("\(tabbarItems[index].image)Fill")
                                    .frame(width: 24, height: 24, alignment: .center)
                                
                                Text(tabbarItems[index].title)
                                    .font(.secondFontBold(size: 14))
                                    .foregroundStyle(Color.customLightBlue)
                            }
                            .padding(12)
                            .background(Color.customLightBlue.opacity(0.1))
                            .cornerRadius(12)
                            .matchedGeometryEffect(id: "SelectedTabId", in: animatedNamespace)
                        } else {
                            HStack(alignment: .center, spacing: 8) {
                                Image(tabbarItems[index].image)
                                    .frame(width: 24, height: 24, alignment: .center)
                            }
                            .padding(12)
                            .cornerRadius(12)
                        }
                        
                    }

                }
            }
            .frame(maxWidth: .infinity)
            
        }
        .offset(y: 25)
        .frame(height: 80)
//        .padding(.horizontal, 16)
        .padding(.top, 10)
    }
}

#Preview {
    CustomTabView(tabSelection: .constant(2))
        .previewLayout(.sizeThatFits)
        .padding(.vertical)
}

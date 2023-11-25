//
//  SearchFieldView.swift
//  EduSwiftUIProject
//
//  Created by Sergey Ivanov on 13.11.2023.
//

import SwiftUI

struct SearchFieldView: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Image.searchIcon
                .font(.system(size: 16))
                .foregroundColor(.white)
            
            TextField(NSLocalizedString("searchFieldText", comment: ""), text: $searchText)
                .font(.mainFontRegular(size: 15))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(Color.black)
            
        }
        .padding(16)
        .background(Color.customGray1)
        .cornerRadius(12)
    }
}


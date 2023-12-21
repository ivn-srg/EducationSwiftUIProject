//
//  MainContentView.swift
//  EduSwiftUIProject
//
//  Created by Sergey Ivanov on 13.11.2023.
//

import SwiftUI

struct MainContentView: View {
    @State private var searchText = ""
    @State private var isModalPresented = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 25) {
                GreetingView()
                
                GeneralDocView()
                
                SearchFieldView(searchText: $searchText)
                
                HorizontalStackView(isModalPresented: $isModalPresented)
                
                NearDocListView()
                
                Spacer()
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
        }
    }
}

#Preview {
    MainContentView()
}

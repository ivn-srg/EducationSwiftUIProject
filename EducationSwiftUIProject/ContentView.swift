//
//  ContentView.swift
//  EduSwiftUIProject
//
//  Created by Sergey Ivanov on 13.11.2023.
//

import SwiftUI

// MARK: -  Расширение для определения окружения (флаг модальности страниц)

private struct IsModalKey: EnvironmentKey {
    static var defaultValue: Bool = false
}

extension EnvironmentValues {
    var isModal: Bool {
        get { self[IsModalKey.self] }
        set { self[IsModalKey.self] = newValue }
    }
}

// MARK: - Реализация вью

struct ContentView: View {
    @State private var selectedTab = 1
    @State private var isModalPresented = false
    
    var body: some View {
        
        NavigationView {
            TabView(selection: $selectedTab) {
                // Экран 1
                MainContentView()
                    .environment(\.isModal, false)
                    .tag(1)

                // Экран 2
                MockView(isModalPresented: $isModalPresented)
                    .environment(\.isModal, false)
                    .tag(2)

                // Экран 3
                ChatsView()
                    .tag(3)
                
                // Экран 4
                MockView(isModalPresented: $isModalPresented)
                    .environment(\.isModal, false)
                    .tag(4)
            }
            .foregroundStyle(Color.white)
            .safeAreaPadding(.all)
            .overlay(alignment: .bottom) {
                CustomTabView(tabSelection: $selectedTab)
            }
            .ignoresSafeArea(.keyboard) // Игнорировать клавиатурную область
            
        }
        .background(Color.white)
        .preferredColorScheme(.light)
    }
}

#Preview {
    ContentView().preferredColorScheme(.light)
}


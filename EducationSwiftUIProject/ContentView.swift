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

// MARK: - Объявление переменных с данными

var listOfDoctors = [
    Doctor(
        fullName: NSLocalizedString("docName2", comment: ""),
        specilty: NSLocalizedString("docSpecilty2", comment: ""),
        avatarImage: .docAvatar2Image,
        phone: URL(string: "+79239999999"),
        distance: NSLocalizedString("docDistance2", comment: ""),
        reviews: NSLocalizedString("docReview2", comment: ""),
        workDate: NSLocalizedString("generalDocWorkDate", comment: ""),
        workTime: NSLocalizedString("docWorktime2", comment: "")
    ),
    Doctor(
        fullName: NSLocalizedString("docName1", comment: ""),
        specilty: NSLocalizedString("docSpecilty1", comment: ""),
        avatarImage: .docAvatar1Image,
        phone: URL(string: "+79999999999"),
        distance: NSLocalizedString("docDistance1", comment: ""),
        reviews: NSLocalizedString("docReview1", comment: ""),
        workDate: NSLocalizedString("generalDocWorkDate", comment: ""),
        workTime: NSLocalizedString("docWorktime1", comment: ""),
        isGeneralDoc: true
    )
//    ,
//    Doctor(
//        fullName: NSLocalizedString("docName3", comment: ""),
//        specilty: NSLocalizedString("docSpecilty3", comment: ""),
//        avatarImage: .docAvatar3Image,
//        phone: URL(string: "+79029999999"),
//        distance: NSLocalizedString("docDistance3", comment: ""),
//        reviews: NSLocalizedString("docReview3", comment: ""),
//        workDate: NSLocalizedString("generalDocWorkDate", comment: ""),
//        workTime: NSLocalizedString("docWorktime3", comment: "")
//    )
]

let chatData = [
    Chat(
        doctor: listOfDoctors[0],
        listOfComments: [
            Comment(
                text: NSLocalizedString("chatMessage1", comment: ""),
                author: .doctor,
                sentTime: "17:09"
            ),
            Comment(
                text: NSLocalizedString("chatMessage4", comment: ""),
                author: .user,
                sentTime: "18:09"
            )
        ]
    ),
    Chat(
        doctor: listOfDoctors[1],
        listOfComments: [
            Comment(
                text: NSLocalizedString("chatMessage2", comment: ""),
                author: .doctor,
                sentTime: "14:39"
            ),
            Comment(
                text: NSLocalizedString("chatMessage5", comment: ""),
                author: .user,
                sentTime: "18:19"
            )
        ]
    )
//    ,
//    Chat(
//        doctor: listOfDoctors[2],
//        listOfComments: [
//            Comment(
//                text: NSLocalizedString("chatMessage3", comment: ""),
//                author: .doctor,
//                sentTime: "11:09"
//            )
//        ]
//    )
]

let HStackItems:[(image: Image, title: String)] = [
    (.sunBlueIcon, NSLocalizedString("HStackItemName1", comment: "")),
    (.profileDocIcon, NSLocalizedString("HStackItemName2", comment: "")),
    (.linkIcon, NSLocalizedString("HStackItemName3", comment: "")),
    (.hospitalIcon, NSLocalizedString("HStackItemName4", comment: ""))
]

let tabbarItems:[(image: String, title: String)] = [
    ("home", NSLocalizedString("tabbarItemText1", comment: "")),
    ("calendar", NSLocalizedString("tabbarItemText2", comment: "")),
    ("message", NSLocalizedString("tabbarItemText3", comment: "")),
    ("profile", NSLocalizedString("tabbarItemText4", comment: ""))
]

// MARK: - Реализация вью

struct ContentView: View {
    @State private var selectedTab = 1
    @State private var isModalPresented = false
    @State private var isTabBarHidden = false
    
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
                    .opacity(isTabBarHidden ? 0 : 1)
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


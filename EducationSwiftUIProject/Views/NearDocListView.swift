//
//  NearDocListView.swift
//  EduSwiftUIProject
//
//  Created by Sergey Ivanov on 13.11.2023.
//

import SwiftUI

struct NearDocListView: View {
    @State private var isModalPresented = false
    @State private var selectedDoctor: Doctor = listOfDoctors[0]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(NSLocalizedString("nearDocsTitle", comment: ""))
                .font(
                    .mainFontBold(size: 16)
                )
                .foregroundColor(Color.black)
            
            ForEach(listOfDoctors.indices, id: \.self) { index in
                let doc = listOfDoctors[index]
                VStack {
                    VStack(alignment: .center, spacing: 20) {
                        MainDocInfo(
                            fullName: doc.fullName,
                            specilty: doc.specilty,
                            image: doc.avatarImage,
                            distance: doc.distance
                        )
                        .onTapGesture {
                            // При тапе на HStack открываем модальное окно
                            selectedDoctor = doc
                            isModalPresented.toggle()
                        }
                        // Модификатор .sheet для отображения модального окна
                        .sheet(isPresented: $isModalPresented) {
                            DetailDocInfo(isModalPresented: $isModalPresented, doctor: selectedDoctor)
                        }
                        
                        Divider().background(Color.white)
                        
                        AdditionalDocInfo(
                            reviews: doc.reviews,
                            worktime: doc.workTime
                        )
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 20)
                    .background(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray, lineWidth: 0)
                    )
                }
                .frame(alignment: .top)
                .cornerRadius(12)
//                .shadow(radius: 1)
                .shadow(color: Color.black.opacity(0.04), radius: 10, x: 2, y: 12)
            }
        }
    }
}

#Preview {
    NearDocListView()
}
